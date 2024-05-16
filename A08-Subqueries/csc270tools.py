import sqlite3


def get_table(sql_file, database, index=0):
    
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

def get_script(sql_file, index=0):

    # Reading the code in the sql_file
    with open(sql_file) as file:
        queries = file.read().split('for grading purposes')
        
    # Return the query found in the file at the location specified by index
    return queries[index]


def get_table_after_script(sql_file, database, index, table_name):
    # Connecting to the database
    con = sqlite3.connect(database)
    cur = con.cursor()

    # Reading the code in the sql_file
    with open(sql_file) as file:
        scripts = file.read().split('for grading purposes')
        
    script = ''.join(scripts[:index])
    cur.executescript(script)
    
    # extracting the table with the given table_name
    table = cur.execute(f'SELECT * FROM {table_name};').fetchall()
    
    con.close()
    
    return table
