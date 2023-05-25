CREATE TABLE locations (
	location_id SERIAL PRIMARY KEY,
	regname VARCHAR(1000) NOT NULL,
	areaname VARCHAR(1000) NOT NULL,
	tername VARCHAR(1000) NOT NULL,
	tertypename VARCHAR(1000) NOT NULL
);

CREATE TABLE educational_organizations(
	eo_id SERIAL PRIMARY KEY,
	eo_name VARCHAR(1000) NOT NULL,
	eo_type VARCHAR(1000) NOT NULL,
	location_id INT,
	FOREIGN KEY(location_id) REFERENCES locations(location_id)
);

CREATE TABLE students(
	student_id SERIAL PRIMARY KEY,
	year CHAR(4) NOT NULL,
	outid VARCHAR(1000) NOT NULL,
	birth DECIMAL NOT NULL,
	sextypename CHAR(10) NOT NULL,
	location_id INT NULL,
	eo_id INT NULL
);

CREATE TABLE subject (
    subject_ID SERIAL PRIMARY KEY,
    subjectname VARCHAR NOT NULL
);

CREATE TABLE test_result (
    id SERIAL PRIMARY KEY,
    student_id INT NULL,
    status VARCHAR(25),
    ball100 DECIMAL,
    ball12 DECIMAL,
    ball DECIMAL,
    subject_id INT NULL,
    FOREIGN KEY(student_id) REFERENCES students(student_id),
    FOREIGN KEY(subject_id) REFERENCES subject(subject_id)
);








 