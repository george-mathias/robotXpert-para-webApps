import psycopg2
from logging import info

class DeloreanLibrary():

    def connect_database(self):

        return psycopg2.connect(
            host='ec2-107-20-153-39.compute-1.amazonaws.com',
            database='dftfo325togtas',
            user='xriezdxlokyzuw',
            password='4241ef829cdf08b1a7d9c783287a7b670c730ca7f7c89959baeea6200010e829'
        )       
        
    
    def remove_student(self, email):

        query = "delete from students where email = '{}'".format(email)
        info(query)

        conn = self.connect_database()

        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close()

    def remove_student_by_name(self, name):

        query = "delete from students where name LIKE '%{}%'".format(name)
        info(query)

        conn = self.connect_database()

        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close()

    
    def insert_student(self, student):

        self.remove_student(student['email'])

        query = ("insert into students (name, email, age, weight, feet_tall, created_at, updated_at)"
                 "values('{}', '{}', {}, {}, {}, now(), now());"
                 .format(student['name'], student['email'], student['age'], student['weight'], student['feet_tall'])
                 )
        info(query)

        conn = self.connect_database()

        cur = conn.cursor()
        cur.execute(query)
        conn.commit()
        conn.close()