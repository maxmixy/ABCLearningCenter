import tkinter as tk
from tkinter import messagebox
import mysql.connector


mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="morrisonabc"
)





def login():
    username = username_entry.get()
    password = password_entry.get()

    mycursor = mydb.cursor()

    mycursor.execute("SELECT * FROM useracc WHERE userID = '" + username + "'")

    myresult = mycursor.fetchall()

    if myresult[0][1] == password:
        messagebox.showinfo("Login", f"Welcome, {username}!")
        login_frame.pack_forget()
        logout_frame.pack()
    else:
        messagebox.showerror("Login Error", "Invalid username or password.")

def logout():
    messagebox.showinfo("Logout", "You have been logged out.")
    logout_frame.pack_forget()
    login_frame.pack()

root = tk.Tk()
root.title("ABC LRN System")

login_frame = tk.Frame(root)
login_frame.pack(padx=10, pady=10)

tk.Label(login_frame, text="Username:").grid(row=0, column=0, padx=5, pady=5)
username_entry = tk.Entry(login_frame)
username_entry.grid(row=0, column=1, padx=5, pady=5)

tk.Label(login_frame, text="Password:").grid(row=1, column=0, padx=5, pady=5)
password_entry = tk.Entry(login_frame, show="*")
password_entry.grid(row=1, column=1, padx=5, pady=5)

login_button = tk.Button(login_frame, text="Login", command=login)
login_button.grid(row=2, columnspan=2, pady=10)

logout_frame = tk.Frame(root)
tk.Label(logout_frame, text="You are logged in!").pack(pady=10)
logout_button = tk.Button(logout_frame, text="Logout", command=logout)
logout_button.pack()

root.mainloop()


mydb.close()