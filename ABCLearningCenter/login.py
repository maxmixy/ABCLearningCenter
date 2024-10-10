import os
from flask import Flask, render_template, request, redirect, url_for, session, jsonify, Response
from flask_mysqldb import MySQL
import mysql.connector
import subprocess
from mysql.connector import Error
from datetime import date, datetime, timedelta
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import text
import pdfkit

app = Flask(__name__) #render app
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:@localhost:3306/morrisonabc'
db = SQLAlchemy(app)

app.secret_key = 'pooKey'

# <----------------------- DATABASE MODELS ----------------------->
class books(db.Model):
    ISBN = db.Column(db.String(20), primary_key=True)
    title = db.Column(db.String(100), nullable=False)
    author = db.Column(db.String(100), nullable=False)
    abstract = db.Column(db.String(500), nullable=False)
    description = db.Column(db.String(500), nullable=False)
    publisher = db.Column(db.String(500), nullable=False)
    copyrightyear = db.Column(db.Integer, nullable=False)
    category = db.Column(db.String(500), nullable=False)
    unitprice = db.Column(db.DECIMAL(precision=10, scale=2), nullable=False)
    
    stock = db.relationship('stocks', uselist=False, backref='book')

class stocks(db.Model):
    ISBN = db.Column(db.String(20), db.ForeignKey('books.ISBN'), primary_key=True)
    Qty = db.Column(db.Integer(), nullable=False)
    InStock = db.Column(db.Integer(), nullable=False)

class reservetran(db.Model):
    UserID = db.Column(db.String(20), db.ForeignKey('books.ISBN'), primary_key=True)
    TransactionNo = db.Column(db.Integer(), nullable=False)
    DateReserved = db.Column(db.Date(), nullable=False)
    ISBN = db.Column(db.String(20), nullable=False)
    Notes = db.Column(db.Text(), nullable=True)
    
class borrowtran(db.Model):
    UserID = db.Column(db.String(20), db.ForeignKey('books.ISBN'), primary_key=True)
    TransactionNo = db.Column(db.Integer(), nullable=False)
    DateBorrowed = db.Column(db.Date(), nullable=False)
    ISBN = db.Column(db.String(20), nullable=False)
    IsBookReturned = db.Column(db.Boolean, nullable=False)
    Notes = db.Column(db.Text(), nullable=True)

# <----------------------- SQL COMMANDS/FUNCTIONS ----------------------->
def create_connection():
    try:
        connection = mysql.connector.connect(
            host='localhost',
            database='morrisonabc',
            user='root',
            password=''
        )
        return connection
    except Error as e:
        print(f"Error connecting to MySQL: {e}")
        return None
    
def create_cursor(connection):
    try:
        cursor = connection.cursor()
        return cursor
    except Error as e:
        print(f"Error creating cursor: {e}")
        return None
    
def execute_query(cursor, query):
    try:
        cursor.execute(query)
        return cursor.fetchall()
    except Error as e:
        print(f"Error executing query: {e}")
        return None
    
def close_connection(connection):
    try:
        connection.close()
    except Error as e:
        print(f"Error closing connection: {e}")
        
def filter_books(title, author, isbn, category):
    conditions = []
    if title:
        conditions.append(books.title.ilike('%' + title + '%'))
    if author:
        conditions.append(books.author.ilike('%' + author + '%'))
    if isbn:
        conditions.append(books.ISBN.ilike('%' + isbn + '%'))
    if category:
        conditions.append(books.category.ilike('%' + category + '%'))

    search_results = books.query.filter(db.or_(*conditions)).all()
    return search_results

@app.route('/update_cart', methods=['POST'])
def update_cart():
    data = request.get_json()
    isbn = data['isbn']
    title = data['title']
    if 'cart' not in session:
        session['cart'] = {}
    session['cart'][isbn] = title
    session.modified = True
    return 'Cart updated successfully!'

@app.route('/clear_cart', methods=['POST'])
def clear_cart():
    session['cart'] = {}
    session.modified = True
    return 'Cart cleared successfully!'

@app.route('/remove_from_cart', methods=['POST'])
def remove_from_cart():
    data = request.get_json()
    isbn = data['isbn']
    if 'cart' in session and isbn in session['cart']:
        del session['cart'][isbn]
        session.modified = True
    return 'Book removed from cart successfully!'

@app.route('/confirm_reservation', methods=['POST'])
def confirm_reservation():
    cart = request.get_json()
    
    # Get the user's current borrow count within 24 hours
    user_id = session['userID']
    now = datetime.now()
    yesterday = now - timedelta(hours=24)
    
    con = create_connection()
    cur = create_cursor(con)
    
    query = "SELECT MAX(TransactionNo) AS transno FROM reservetran;"
    result = execute_query(cur, query)
    if result[0][0] is None:
        transno = 0
    else:
        transno = int(result[0][0]) + 1
        
    query = "SELECT COUNT(*) AS borrow_count FROM reservetran WHERE UserID = '" + str(user_id) + "' AND DateReserved >= '"+ str(yesterday) +"';"
    result = execute_query(cur, query)
    # Check if the user has already borrowed 3 books within 24 hours
    if int(result[0][0]) >= 3:
        close_connection(con)
        return jsonify({'error': 'You have already reserved 3 books within the last 24 hours.'})
    else:
        for isbn, title in cart.items():
            reserve_tran = reservetran()
            reserve_tran.UserID = user_id
            reserve_tran.TransactionNo = transno
            reserve_tran.DateReserved = datetime.now()
            reserve_tran.ISBN = isbn
            reserve_tran.Notes = ""
            
            db.session.add(reserve_tran)
        
        db.session.commit()
        close_connection(con)
        return jsonify({'message': 'Reservation confirmed successfully!'})

@app.route('/delete_reservation', methods=['POST'])
def delete_reservation():
    data = request.get_json()
    isbn = str(data['isbn'])
    user_id = str(data['userID'])
    com = text("DELETE FROM reservetran WHERE ISBN = '"+ isbn +"' AND UserID = '"+ user_id +"';")
    # Delete the reservation record from the reservetran table
    db.session.execute(com)
    db.session.commit()

    return jsonify({'success': True})

@app.route('/borrow_item', methods=['POST'])
def lend_listed_items():
    data = request.get_json()
    user_id = str(data['userID'])
    isbn_list = [item['isbn'] for item in data['items']]

    # Delete reservation records
    for isbn in isbn_list:
        com = text("DELETE FROM reservetran WHERE ISBN = :isbn AND UserID = :user_id")
        db.session.execute(com, {'isbn': isbn, 'user_id': user_id})
    db.session.commit()

    con = create_connection()
    cur = create_cursor(con)

    query = "SELECT MAX(TransactionNo) AS transno FROM borrowtran;"
    result = execute_query(cur, query)
    if result is None or result[0][0] is None:
        transno = 1
    else:
        transno = int(result[0][0]) + 1

    # Insert new data into borrowtran table
    now = datetime.now()
    for isbn in isbn_list:
        borrow_tran = borrowtran()
        borrow_tran.UserID = user_id
        borrow_tran.TransactionNo = transno  # implement a function to get the next transaction no
        borrow_tran.DateBorrowed = now
        borrow_tran.ISBN = isbn
        borrow_tran.IsBookReturned = False
        borrow_tran.Notes = ""
        db.session.add(borrow_tran)
    db.session.commit()
    session['transdata'] = []
    transaction_data = []
    # Generate a "receipt" like tab with transaction information
    book_list = []
    for isbn in isbn_list:
        book = books.query.filter_by(ISBN=isbn).first()
        book_list.append({
            'ISBN': isbn,
            'Title': book.title,
        })
    Borrowed = now.strftime('%Y-%m-%d'),
    Due = (now + timedelta(days=3)).strftime('%Y-%m-%d')
    query = "SELECT Fname, Lname FROM users where UserID = '" + str(user_id) + "';"
    result = execute_query(cur, query)
    
    name = result[0][0] + " " + result[0][1]
    
    transaction_data.append({'TransactionNo': transno,'Borrowed': Borrowed,'Due': Due, 'Items': book_list, 'Name': name})
    session['transdata'] = transaction_data
    return jsonify("")

@app.route('/receipt', methods=['GET'])
def receipt():
    transact_data = session['transdata']
    return render_template("receipt.html", transaction_data=transact_data)

def generate_pdf(transaction_data):
    template = render_template('receipt.html', transaction_data=transaction_data)
    html = template
    config = pdfkit.configuration(wkhtmltopdf='C:/Program Files/wkhtmltopdf/bin/wkhtmltopdf.exe')
    pdf = pdfkit.from_string(html, False, configuration=config)
    response = Response(pdf, mimetype='application/pdf')
    response.headers['Content-Disposition'] = 'attachment; filename="borrow_receipt.pdf"'
    return response

@app.route('/print', methods=['GET'])
def generate_pdf_route():
    transaction_data = session['transdata']  # retrieve the transaction data from the session
    pdf_response = generate_pdf(transaction_data)  # call the generate_pdf function
    return pdf_response

# <----------------------- ROUTING ----------------------->
@app.route("/")
def index():
    return redirect(url_for("guest"))

@app.route("/log", methods=["GET", "POST"])
def log():
    return render_template("Login.html")

@app.route("/logout", methods=["GET", "POST"])
def logout():
    return redirect(url_for("guest"))

@app.route("/login", methods=["POST"])
def login():
    username = request.form["username"]
    password = request.form["password"]
    con = create_connection()
    if con:
        cur = create_cursor(con)
        query = "SELECT * FROM useracc WHERE Username = %s AND Password = %s"
        cur.execute(query, (username, password))
        results = cur.fetchone()
        if results:
            username = str(results[0])
            query = "SELECT membership.Validity, roles.Role, roles.UserID FROM membership INNER JOIN roles ON membership.UserID=roles.UserID WHERE roles.UserID = '" + username + "'"
            results = execute_query(cur, query)
            print(results)
            session['validity'] = results[0][0]
            session['role'] = results[0][1]
            session['userID'] = results[0][2]
            if session['validity'] > datetime.date(datetime.now()):
                return redirect(url_for("success"))
            else:
                return "Inactive account", 401
            
        else:
            return "Invalid username or password", 401
    else:
        return "Error connecting to database", 500
    
@app.route("/success")
def success():
    if session['role'] == 'administrator':
        session['cart'] = {}
        return redirect(url_for("admin"))
    elif session['role'] == 'member':
        session['cart'] = {}
        return redirect(url_for("admin"))
    else:
        return redirect(url_for("guest"))

# <----------------------- PAGE RENDERING ----------------------->
@app.route('/admin', defaults={'index': 1})
@app.route('/admin/<int:index>')
def admin(index):
    categories = ['Databases', 'Communication', 'Electronic media', 'Mechatronics', 'Electronics Engineering', 'Web Design', 'Automotive', 'Electronics', 'Plumbing', 'Game Art', 'Programming', 'Utilities', 'Networking', 'Game Design', 'Game Programming', 'ICT']

    title = request.args.get('title', '')
    author = request.args.get('author', '')
    isbn = request.args.get('isbn', '')
    category = request.args.get('category', '')

    if 'cart' not in session:
        session['cart'] = {}

    cart = session['cart']

    if request.method == 'POST':
        isbn = request.form['isbn']
        title = request.form['title']
        if isbn not in cart:
            cart[isbn] = title
        session.modified = True  # Mark the session as modified

    if title or author or isbn or category:
        filtered_books = filter_books(title, author, isbn, category)
        if filtered_books:
            books_list = filtered_books
            if index > len(books_list):
                return "Invalid index", 404
            book = books_list[index - 1] 
            total_books = len(books_list)
            next_url = url_for('admin', index=index + 1, title=title, author=author, isbn=isbn, category=category)
            prev_url = url_for('admin', index=index - 1, title=title, author=author, isbn=isbn, category=category)
            return render_template('Test.html', book=book, categories=categories, current_index=index, total_books=total_books, next_url=next_url, prev_url=prev_url, cart=cart, session_role=session['role'])
        else:
            return "No results found", 200
    else:
        books_list = books.query.all()  # Retrieve the list of books
        if index > len(books_list):
            return "Invalid index", 404
        book = books_list[index - 1]  # Adjust the index to match the book list
        total_books = len(books_list)
        next_url = url_for('admin', index=index + 1)
        prev_url = url_for('admin', index=index - 1)
        return render_template('Test.html', book=book, categories=categories, current_index=index, total_books=total_books, next_url=next_url, prev_url=prev_url, cart=cart, session_role=session['role'])
    
@app.route('/transaction_records')
def transaction_records():
    
    con = create_connection()
    cur = create_cursor(con)
    
    query = "SELECT * FROM reservetran where UserID = '" + str(session['userID']) + "';"
    reserve = execute_query(cur, query)
    
    query = "SELECT * FROM borrowtran where UserID = '" + str(session['userID']) + "';"
    borrow = execute_query(cur, query)
    
    return render_template('TransactionRecords.html', reservation_records=reserve, borrow_records = borrow, session_role=session['role'])

@app.route('/borrowing', defaults={'index': 1})
@app.route('/borrowing/<int:index>')
def borrow(index):
    categories = ['Databases', 'Communication', 'Electronic media', 'Mechatronics', 'Electronics Engineering', 'Web Design', 'Automotive', 'Electronics', 'Plumbing', 'Game Art', 'Programming', 'Utilities', 'Networking', 'Game Design', 'Game Programming', 'ICT']

    title = request.args.get('title', '')
    author = request.args.get('author', '')
    isbn = request.args.get('isbn', '')
    category = request.args.get('category', '')

    if 'cart' not in session:
        session['cart'] = {}

    cart = session['cart']

    if request.method == 'POST':
        isbn = request.form['isbn']
        title = request.form['title']
        if isbn not in cart:
            cart[isbn] = title
        session.modified = True  # Mark the session as modified

    if title or author or isbn or category:
        filtered_books = filter_books(title, author, isbn, category)
        if filtered_books:
            books_list = filtered_books
            if index > len(books_list):
                return "Invalid index", 404
            book = books_list[index - 1] 
            total_books = len(books_list)
            next_url = url_for('borrow', index=index + 1, title=title, author=author, isbn=isbn, category=category)
            prev_url = url_for('borrow', index=index - 1, title=title, author=author, isbn=isbn, category=category)
            memberID = request.args.get('userID', '')
    
            con = create_connection()
            cur = create_cursor(con)
            
            query = " SELECT r.UserID, b.title, b.ISBN FROM reservetran r JOIN books b ON r.ISBN = b.ISBN WHERE r.UserID = '" + memberID + "';"
            result = execute_query(cur, query)
            return render_template('borrow.html',  reservation_records=result, session_role=session['role'], book=book, categories=categories, current_index=index, total_books=total_books, next_url=next_url, prev_url=prev_url, cart=cart)
        else:
            return "No results found", 200
    else:
        books_list = books.query.all()  # Retrieve the list of books
        if index > len(books_list):
            return "Invalid index", 404
        book = books_list[index - 1]  # Adjust the index to match the book list
        total_books = len(books_list)
        next_url = url_for('borrow', index=index + 1)
        prev_url = url_for('borrow', index=index - 1)
        memberID = request.args.get('userID', '')
    
        con = create_connection()
        cur = create_cursor(con)
        
        query = " SELECT r.UserID, b.title, b.ISBN FROM reservetran r JOIN books b ON r.ISBN = b.ISBN WHERE r.UserID = '" + memberID + "';"
        result = execute_query(cur, query)
        return render_template('borrow.html',  reservation_records=result, session_role=session['role'], book=book, categories=categories, current_index=index, total_books=total_books, next_url=next_url, prev_url=prev_url, cart=cart)

@app.route('/guest', defaults={'index': 1})
@app.route('/guest/<int:index>')
def guest(index):
    categories = ['Databases', 'Communication', 'Electronic media', 'Mechatronics', 'Electronics Engineering', 'Web Design', 'Automotive', 'Electronics', 'Plumbing', 'Game Art', 'Programming', 'Utilities', 'Networking', 'Game Design', 'Game Programming', 'ICT']

    title = request.args.get('title', '')
    author = request.args.get('author', '')
    isbn = request.args.get('isbn', '')
    category = request.args.get('category', '')

    if title or author or isbn or category:
        filtered_books = filter_books(title, author, isbn, category)
        if filtered_books:
            books_list = filtered_books
            if index > len(books_list):
                return "Invalid index", 404
            book = books_list[index - 1] 
            total_books = len(books_list)
            next_url = url_for('guest', index=index + 1, title=title, author=author, isbn=isbn, category=category)
            prev_url = url_for('guest', index=index - 1, title=title, author=author, isbn=isbn, category=category)
            return render_template('guest.html', book=book, categories=categories, current_index=index, total_books=total_books, next_url=next_url, prev_url=prev_url)
        else:
            return "No results found", 200
    else:
        books_list = books.query.all()  # Retrieve the list of books
        if index > len(books_list):
            return "Invalid index", 404
        book = books_list[index - 1]  # Adjust the index to match the book list
        total_books = len(books_list)
        next_url = url_for('guest', index=index + 1)
        prev_url = url_for('guest', index=index - 1)
        return render_template('guest.html', book=book, categories=categories, current_index=index, total_books=total_books, next_url=next_url, prev_url=prev_url)


if __name__ == "__main__":
        app.run(debug=True)