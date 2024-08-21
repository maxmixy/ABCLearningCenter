import os
from flask import Flask, render_template, request, redirect, url_for, session, render_template_string
from flask_mysqldb import MySQL
import mysql.connector
import subprocess
from mysql.connector import Error
from datetime import date, datetime
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__) #render app
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:@localhost:3306/morrisonabc'
db = SQLAlchemy(app)

app.secret_key = 'pooKey'

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

#sql commands
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

#app functionalities and routes
@app.route("/")
def index():
    return redirect(url_for("guest"))

@app.route("/log", methods=["GET", "POST"])
def log():
    return render_template("Login.html")

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
            print(results)
            session['UserID'] = results[0]
            query = "SELECT * FROM roles WHERE UserID = %s"
            cur.execute(query, (session['UserID'],))
            results = cur.fetchone()
            session['role'] = results[1]
            return redirect(url_for('success'))
        else:
            return "Invalid username or password", 401
    else:
        return "Error connecting to database", 500
    
@app.route("/success")
def success():
    if session['role'] == 'admin':
        return redirect(url_for("admin"))
    else:
        return redirect(url_for("guest"))


@app.route('/admin', defaults={'index': 1})
@app.route('/admin/<int:index>')
def admin(index):
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
            return render_template('Test.html', book=book, categories=categories, current_index=index, total_books=total_books, next_url=next_url, prev_url=prev_url)
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
        return render_template('Test.html', book=book, categories=categories, current_index=index, total_books=total_books, next_url=next_url, prev_url=prev_url)

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

if __name__ == "__main__":
        app.run(debug=True)