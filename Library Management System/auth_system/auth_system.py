import mysql.connector
from mysql.connector import Error

def create_connection():
    try:
        connection = mysql.connector.connect(
            host='127.0.0.1',
            port=3306,
            database='librarymanagement', 
            user='root',
            password='223769TCdot'
        )
        if connection.is_connected():
            print("Connected to MySQL database")
            return connection
    except Error as e:
        print(f"Error: {e}")
        return None

def authenticate_user(username, password):
    connection = create_connection()
    if connection:
        cursor = connection.cursor()
        query = "SELECT u.username, r.role_name FROM users u JOIN roles r ON u.role_id = r.role_id WHERE u.username = %s AND u.password = %s"
        print(f"Executing query: {query} with username: {username} and password: {password}")
        cursor.execute(query, (username, password))
        
        user = cursor.fetchone()
        print(f"Query result: {user}")
        connection.close()
        
        if user:
            print(f"Login successful! Welcome {user[0]}, Role: {user[1]}")
            return user[1]  # Return the role of the user
        else:
            print("Login failed! Invalid username or password.")
            return None

if __name__ == "__main__":
    username = input("Enter username: ")
    password = input("Enter password: ")
    role = authenticate_user(username, password)
    
    if role:
        if role == 'Admin':
            print("Access Level: Admin")
            # Additional admin-specific logic
        elif role == 'Librarian':
            print("Access Level: Librarian")
            # Additional librarian-specific logic
        elif role == 'Member':
            print("Access Level: Member")
            # Additional member-specific logic
        else:
            print("Unknown role!")
