import sqlite3
import os
import subprocess

def get_user(user_id):
    conn = sqlite3.connect('db.sqlite')
    cursor = conn.cursor()
    # FIXED: Parameterized query
    cursor.execute("SELECT * FROM users WHERE id = ?", (user_id,))
    return cursor.fetchone()

# FIXED: Use environment variable
DB_PASSWORD = os.environ.get("DB_PASSWORD")

def run_cmd(args):
    # FIXED: No shell, use list
    subprocess.run(args, shell=False)