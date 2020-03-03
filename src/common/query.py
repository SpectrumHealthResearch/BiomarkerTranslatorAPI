import os
import pymysql.cursors


class Query():

    def __init__(self):
        self.conn = pymysql.connect(host=os.environ.get('DB_HOST'),
                                    user=os.environ.get('DB_USER'),
                                    password=os.environ.get('DB_PASS'),
                                    db=os.environ.get('DB_SCHEMA'),
                                    charset='utf8mb4',
                                    cursorclass=pymysql.cursors.DictCursor)

        self.cursor = self.conn.cursor()

    def __del__(self):
        self.conn.close()

    def quick_fetch(self, sql, params):
        cursor = self.conn.cursor()
        cursor.execute(sql, params)
        return cursor.fetchall()

