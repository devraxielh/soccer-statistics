import pymysql.cursors


def getConnection():
    connection = pymysql.connect(host='localhost',
                                 port=3306,
                                 user='root',
                                 password='root',
                                 db='CitizenLab',
                                 charset='utf8mb4',
                                 cursorclass=pymysql.cursors.DictCursor)

    return connection.cursor(), connection
