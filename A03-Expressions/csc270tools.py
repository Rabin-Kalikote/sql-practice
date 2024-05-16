import sqlite3


def get_table(sql_file, database=':memory:', index=0):
    
    # Connecting to the database
    con = sqlite3.connect(database)
    cur = con.cursor()

    # Reading the code in the sql_file
    with open(sql_file) as file:
        queries = file.read().split('for grading purposes')
        
    # Running the query found in the file at the location specified by index
    query = queries[index]
    table = cur.execute(query).fetchall()
        
    con.close()
    
    return table

