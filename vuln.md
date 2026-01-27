import sqlite3
import os

def get_user(user_id):
    conn = sqlite3.connect('db.sqlite')
    cursor = conn.cursor()
    # VULNERABLE: SQL injection
    cursor.execute("SELECT * FROM users WHERE id = " + user_id)
    return cursor.fetchone()

# VULNERABLE: Hardcoded credential
DB_PASSWORD = "admin123"

def run_cmd(cmd):
    # VULNERABLE: Command injection
    os.system(cmd)