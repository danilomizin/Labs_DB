CREATE TABLE IF NOT EXISTS zno_data(
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
                SpBall DECIMAL);


-- V1__migrate_zno_data.sql
-- Описує міграцію до третьої нормальної форми

-- Створення нових таблиць
CREATE TABLE IF NOT EXISTS zno_students (
    OutID VARCHAR(1000) PRIMARY KEY,
    Birth DECIMAL NOT NULL,
    SexTypeName CHAR(10) NOT NULL
);

CREATE TABLE IF NOT EXISTS zno_regions (
    Regname VARCHAR(1000) PRIMARY KEY
);

CREATE TABLE IF NOT EXISTS zno_areas (
    AreaName VARCHAR(1000) PRIMARY KEY,
    Regname VARCHAR(1000) REFERENCES zno_regions(Regname)
);

CREATE TABLE IF NOT EXISTS zno_territories (
    TerName VARCHAR(1000) PRIMARY KEY,
    AreaName VARCHAR(1000) REFERENCES zno_areas(AreaName)
);

CREATE TABLE IF NOT EXISTS zno_educational_organizations (
    EOName VARCHAR(1000),
    EOTypeName VARCHAR(1000),
    EORegName VARCHAR(1000),
    PRIMARY KEY (EOName, EOTypeName, EORegName)
);

CREATE TABLE IF NOT EXISTS zno_tests (
    TestName VARCHAR(100),
    TestStatus VARCHAR(25),
    PRIMARY KEY (TestName, TestStatus)
);

CREATE TABLE IF NOT EXISTS zno_results (
    OutID VARCHAR(1000) REFERENCES zno_students(OutID),
    TestName VARCHAR(100) REFERENCES zno_tests(TestName),
    TestStatus VARCHAR(25) REFERENCES zno_tests(TestStatus),
    Ball100 DECIMAL,
    Ball12 DECIMAL,
    Ball DECIMAL,
    PRIMARY KEY (OutID, TestName, TestStatus)
);

CREATE TABLE IF NOT EXISTS zno_student_territories (
    OutID VARCHAR(1000) REFERENCES zno_students(OutID),
    TerName VARCHAR(1000) REFERENCES zno_territories(TerName),
    PRIMARY KEY (OutID, TerName)
);

-- Копіювання даних зі старої таблиці в нові таблиці
INSERT INTO zno_students (OutID, Birth, SexTypeName)
SELECT OutID, Birth, SexTypeName FROM zno_data;

INSERT INTO zno_regions (Regname)
SELECT DISTINCT Regname FROM zno_data;

INSERT INTO zno_areas (AreaName, Regname)
SELECT DISTINCT AreaName, Regname FROM zno_data;

INSERT INTO zno_territories (TerName, AreaName)
SELECT DISTINCT TerName, AreaName FROM zno_data;

INSERT INTO zno_educational_organizations (EOName, EOTypeName, EORegName)
SELECT EOName, EOTypeName, EORegName FROM zno_data;

INSERT INTO zno_tests (TestName, TestStatus)
VALUES
    ('UML', 'TestStatus'),
    ('Ukr', 'TestStatus'),
    ('Hist', 'TestStatus'),
    ('Math', 'TestStatus'),
    ('Phys', 'TestStatus'),
    ('Chem', 'TestStatus'),
    ('Bio', 'TestStatus'),
    ('Geo', 'TestStatus'),
    ('Eng', 'TestStatus'),
    ('Fr', 'TestStatus'),
    ('Deu', 'TestStatus'),
    ('Sp', 'TestStatus');

INSERT INTO zno_results (OutID, TestName, TestStatus, Ball100, Ball12, Ball)
SELECT OutID, 'UML', UMLTestStatus, UMLBall100, UMLBall12, UMLBall FROM zno_data;

INSERT INTO zno_results (OutID, TestName, TestStatus, Ball100, Ball12, Ball)
SELECT OutID, 'Ukr', UkrTestStatus, UkrBall100, UkrBall12, UkrBall FROM zno_data;

INSERT INTO zno_results (OutID, TestName, TestStatus, Ball100, Ball12, Ball)
SELECT OutID, 'Hist', HistTestStatus, HistBall100, HistBall12, HistBall FROM zno_data;

INSERT INTO zno_results (OutID, TestName, TestStatus, Ball100, Ball12, Ball)
SELECT OutID, 'Math', MathTestStatus, MathBall100, MathBall12, MathBall FROM zno_data;

INSERT INTO zno_results (OutID, TestName, TestStatus, Ball100, Ball12, Ball)
SELECT OutID, 'Phys', PhysTestStatus, PhysBall100, PhysBall12, PhysBall FROM zno_data;

INSERT INTO zno_results (OutID, TestName, TestStatus, Ball100, Ball12, Ball)
SELECT OutID, 'Chem', ChemTestStatus, ChemBall100, ChemBall12, ChemBall FROM zno_data;

INSERT INTO zno_results (OutID, TestName, TestStatus, Ball100, Ball12, Ball)
SELECT OutID, 'Bio', BioTestStatus, BioBall100, BioBall12, BioBall FROM zno_data;

INSERT INTO zno_results (OutID, TestName, TestStatus, Ball100, Ball12, Ball)
SELECT OutID, 'Geo', GeoTestStatus, GeoBall100, GeoBall12, GeoBall FROM zno_data;

INSERT INTO zno_results (OutID, TestName, TestStatus, Ball100, Ball12, Ball)
SELECT OutID, 'Eng', EngTestStatus, EngBall100, EngBall12, EngBall FROM zno_data;

INSERT INTO zno_results (OutID, TestName, TestStatus, Ball100, Ball12, Ball)
SELECT OutID, 'Fr', FrTestStatus, FrBall100, FrBall12, FrBall FROM zno_data;

INSERT INTO zno_results (OutID, TestName, TestStatus, Ball100, Ball12, Ball)
SELECT OutID, 'Deu', DeuTestStatus, DeuBall100, DeuBall12, DeuBall FROM zno_data;

INSERT INTO zno_results (OutID, TestName, TestStatus, Ball100, Ball12, Ball)
SELECT OutID, 'Sp', SpTestStatus, SpBall100, SpBall12, SpBall FROM zno_data;


-- Створення зв'язку між студентами та їх територіями
INSERT INTO zno_student_territories (OutID, TerName)
SELECT OutID, TerName FROM zno_data;

-- Видалення початкової таблиці
DROP TABLE IF EXISTS zno_data;

