import csv
import requests
import py7zr
import psycopg2
import time
import pandas as pd
import math

start_time = time.time()
print('Start time:', time.strftime('%H:%M:%S'))

# Підключення до бази даних
def connect():
    for attempt in range(30):
        try:
            conn = psycopg2.connect(
                host="db",
                database="LAB1_BD",
                user="postgres",
                password="111"
            )
            print("Connection is successful")
            return conn
        except psycopg2.OperationalError as error:
            print(error)
            print("Connection failed. Restarting in 5 seconds...")
            time.sleep(5)

CONN = connect()
CUR = CONN.cursor()

# Створення таблиці для даних 2019 року
data19 = pd.DataFrame(pd.read_csv(r'Odata2019File.csv', sep=";", decimal=",", encoding="Windows-1251", low_memory=False),
                                 columns=['OUTID', 'Birth', 'SEXTYPENAME', 'REGNAME', 'AREANAME', 'TERNAME',
                                 'REGTYPENAME', 'TerTypeName', 'EONAME', 'EOTYPENAME', 'EORegName',
                                 'UkrTestStatus',
                                 'UkrBall100',
                                 'UkrBall12',
                                 'UkrBall',
                                 'histTestStatus',
                                 'histBall100',
                                 'histBall12',
                                 'histBall',
                                 'mathTestStatus',
                                 'mathBall100',
                                 'mathBall12',
                                 'mathBall',
                                 'physTestStatus',
                                 'physBall100',
                                 'physBall12',
                                 'physBall',
                                 'chemTestStatus',
                                 'chemBall100',
                                 'chemBall12',
                                 'chemBall',
                                 'bioTestStatus',
                                 'bioBall100',
                                 'bioBall12',
                                 'bioBall',
                                 'geoTestStatus',
                                 'geoBall100',
                                 'geoBall12',
                                 'geoBall',
                                 'engTestStatus',
                                 'engBall100',
                                 'engBall12',
                                 'engBall',
                                 'frTestStatus',
                                 'frBall100',
                                 'frBall12',
                                 'frBall',
                                 'deuTestStatus',
                                 'deuBall100',
                                 'deuBall12',
                                 'deuBall',
                                 'spTestStatus',
                                 'spBall100',
                                 'spBall12',
                                 'spBall',
                                 ])

data21 = pd.DataFrame(pd.read_csv(r'Odata2021File.csv', sep=";", decimal=",", encoding='utf-8', low_memory=False),
                                 columns=['OUTID', 'Birth', 'SexTypeName', 'RegName', 'AREANAME', 'TERNAME',
                                 'RegTypeName', 'TerTypeName', 'EONAME', 'EOTypeName', 'EORegName',
                                 'UMLTestStatus',
                                 'UMLBall100',
                                 'UMLBall12',
                                 'UMLBall',
                                 'UkrTestStatus',
                                 'UkrBall100',
                                 'UkrBall12',
                                 'UkrBall',
                                 'HistTestStatus',
                                 'HistBall100',
                                 'HistBall12',
                                 'HistBall',
                                 'MathTestStatus',
                                 'MathBall100',
                                 'MathBall12',
                                 'MathBall',
                                 'PhysTestStatus',
                                 'PhysBall100',
                                 'PhysBall12',
                                 'PhysBall',
                                 'ChemTestStatus',
                                 'ChemBall100',
                                 'ChemBall12',
                                 'ChemBall',
                                 'BioTestStatus',
                                 'BioBall100',
                                 'BioBall12',
                                 'BioBall',
                                 'GeoTestStatus',
                                 'GeoBall100',
                                 'GeoBall12',
                                 'GeoBall',
                                 'EngTestStatus',
                                 'EngBall100',
                                 'EngBall12',
                                 'EngBall',
                                 'FrTestStatus',
                                 'FrBall100',
                                 'FrBall12',
                                 'FrBall',
                                 'DeuTestStatus',
                                 'DeuBall100',
                                 'DeuBall12',
                                 'DeuBall',
                                 'SpTestStatus',
                                 'SpBall100',
                                 'SpBall12',
                                 'SpBall',
                                 ])

def table_exist():
    query = """SELECT COUNT(table_name) FROM information_schema.tables
            WHERE table_schema LIKE 'public' AND table_type LIKE 'BASE TABLE' AND table_name = 'zno_data'"""
    CUR.execute(query)
    result = CUR.fetchall()[0][0]
    if result == 1:
        return True
    return False

def create_table():
    CUR.execute('''
        
        CREATE TABLE zno_data(
                Year INT,
                OutID VARCHAR(1000) NOT NULL,
                Birth DECIMAL NOT NULL,
                SexTypeName CHAR(10) NOT NULL,
                Regname VARCHAR(1000) NOT NULL,
                AreaName VARCHAR(1000) NOT NULL,
                TerName VARCHAR(1000) NOT NULL,
                RegTypeName VARCHAR(1000) NOT NULL,
                TerTypeName VARCHAR(1000) NOT NULL,
                EOName VARCHAR(1000),
                EOTypeName VARCHAR(1000),
                EORegName VARCHAR(1000),
                UMLTestStatus VARCHAR(25),
                UMLBall100 DECIMAL,
                UMLBall12 DECIMAL,
                UMLBall DECIMAL,
                UkrTestStatus VARCHAR(25),
                UkrBall100 DECIMAL,
                UkrBall12 DECIMAL,
                UkrBall DECIMAL,
                HistTestStatus VARCHAR(25),
                HistBall100 DECIMAL,
                HistBall12 DECIMAL,
                HistBall DECIMAL,
                MathTestStatus VARCHAR(25),
                MathBall100 DECIMAL,
                MathBall12 DECIMAL,
                MathBall DECIMAL,
                PhysTestStatus VARCHAR(25),
                PhysBall100 DECIMAL,
                PhysBall12 DECIMAL,
                PhysBall DECIMAL,
                ChemTestStatus VARCHAR(25),
                ChemBall100 DECIMAL,
                ChemBall12 DECIMAL,
                ChemBall DECIMAL,
                BioTestStatus VARCHAR(25),
                BioBall100 DECIMAL,
                BioBall12 DECIMAL,
                BioBall DECIMAL,
                GeoTestStatus VARCHAR(25),
                GeoBall100 DECIMAL,
                GeoBall12 DECIMAL,
                GeoBall DECIMAL,
                EngTestStatus VARCHAR(25),
                EngBall100 DECIMAL,
                EngBall12 DECIMAL,
                EngBall DECIMAL,
                FrTestStaTus VARCHAR(25),
                FrBall100 DECIMAL,
                FrBall12 DECIMAL,
                FrBall DECIMAL,
                DeuTestStaTus VARCHAR(25),
                DeuBall100 DECIMAL,
                DeuBall12 DECIMAL,
                DeuBall DECIMAL,
                SpTestStaTus VARCHAR(25),
                SpBall100 DECIMAL,
                SpBall12 DECIMAL,
                SpBall DECIMAL 
            );
    ''')
    print('Table is created.')

if table_exist():
    print("Table exists.")
else:
    create_table()
    print("Table doesn't exist. Creating table...")

def check_row_not_in_db(columns_string, values_string):
    columns_string = columns_string.split(', ')
    values_string = [None if isinstance(x, float) and math.isnan(x) else x for x in values_string]
    query = "SELECT COUNT(*) FROM zno_data WHERE "
    for i in range(len(columns_string)):
        if i > 0:
            query += " AND "
        query += "{} = %s".format(columns_string[i])
    CUR.execute(query, values_string)
    result = CUR.fetchone()
    return result == (0,)

# Зчитуємо дані з файлів
# def insert_data(df, conn, year):
#     columns = [i[0].upper() + i[1:] for i in df.columns]
#     for col in df.columns:
#         if "Ball100" in col:
#             df[col] = df[col].apply(pd.to_numeric)
#     query = "INSERT INTO zno_data(year, " + ", ".join(columns) + ") VALUES (%s" + ", %s" * len(columns) + ");"
#     values = [(year, *row) for row in df.values]
#     with conn.cursor() as cur:
#         cur.executemany(query, values)
#         conn.commit()

def insert_data(df, conn, year):
    global ignore_num
    columns = [i[0].upper() + i[1:] for i in df.columns]
    values_string = ', '.join(['%s'] * (len(columns) + 1))
    columns_string = ', '.join(['year'] + columns)
    left = []
    i = 0

    try:
        CUR.execute(f"SELECT COUNT(*) FROM zno_data WHERE year = {year}")
        ignore_num = CUR.fetchone()[0]

    except psycopg2.OperationalError:
        insert_data(df, CONN, year)

    for i, row in enumerate(df.head(2500).values):
        row = [year, *row]
        left.append(row)
        if i >= ignore_num:
            if not check_row_not_in_db(columns_string, row):
                print('Duplicates...')
                continue
            query = f"INSERT INTO zno_data ({columns_string}) VALUES ({values_string})"
            try:
                CUR.execute(query, row)
                if i % 1000 == 0:
                    conn.commit()
                    left = []
                    print(f"{i} rows inserted.")

            except psycopg2.OperationalError:
                print("Reconnection...")
                for y in left:
                    CUR.execute(query, y)
                CUR.execute(query, row)
                if i % 1000 == 0:
                    conn.commit()
                    cash = []
                    print(f"{i} rows inserted.")
        i += 1
    conn.commit()
    print(f"{i} rows inserted.")
    print(f"{year} year is inserted.")

#conn = connect()
#cur = conn.cursor()
for attempt in range(15):
    try:
        insert_data(data19, CONN, 2019)
        insert_data(data21, CONN, 2021)
        print("Inserting...")
    except psycopg2.OperationalError as error:
        print(error)
        CONN = connect()
        insert_data(data19, CONN, 2019)
        insert_data(data21, CONN, 2021)
        print("Inserting failed. Connecting and inserting...")
        time.sleep(5)

query1 = """
        SELECT REGNAME, MAX(UkrBall100)
        FROM zno_data
        WHERE UkrTestStatus = 'Зараховано'
        GROUP BY REGNAME
        """

query2 = """
        SELECT RegName, MAX(UMLBall100)
        FROM zno_data
        WHERE UMLTestStatus = 'Зараховано'
        GROUP BY RegName
        """

# виконання запиту для 2019 року
CUR.execute(query1)
results_2019 = CUR.fetchall()
print(results_2019)
# виконання запиту для 2021 року
CUR.execute(query2)
results_2021 = CUR.fetchall()
print(results_2021)

# запис результатів до CSV-файлу
with open('../best_scores.csv', mode='w', newline='') as f:
    writer = csv.writer(f)
    writer.writerow(['Region', 'Best score in 2019', 'Best score in 2021'])
    for row_2019, row_2021 in zip(results_2019, results_2021):
        region = row_2019[0]
        best_score_2019 = row_2019[1]
        best_score_2021 = row_2021[1]
        writer.writerow([region, best_score_2019, best_score_2021])

print("The results have been saved to 'best_scores.csv' file")

elapsed_time = round(time.time() - start_time, 2)
print('Working time:', elapsed_time)
