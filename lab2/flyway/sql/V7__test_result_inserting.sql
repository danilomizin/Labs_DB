INSERT INTO subject(subjectname)
VALUES ('UML');

INSERT INTO subject(subjectname)
VALUES ('UKR');

INSERT INTO subject(subjectname)
VALUES ('HIST');

INSERT INTO subject(subjectname)
VALUES ('MATH');

INSERT INTO subject(subjectname)
VALUES ('PHYS');

INSERT INTO subject(subjectname)
VALUES ('CHEM');

INSERT INTO subject(subjectname)
VALUES ('BIO');

INSERT INTO subject(subjectname)
VALUES ('GEO');

INSERT INTO subject(subjectname)
VALUES ('ENG');

INSERT INTO subject(subjectname)
VALUES ('FRA');

INSERT INTO subject(subjectname)
VALUES ('DEU');

INSERT INTO subject(subjectname)
VALUES ('SPA');



INSERT INTO test_result (student_id, status, ball100, ball12, ball, subject_id)
SELECT students.student_id, UMLTestStatus, UMLBall100, UMLBall12, UMLBall, 1
FROM zno_data
JOIN students ON zno_data.OutID = students.outid
              AND zno_data.Birth = students.birth
              AND zno_data.SexTypeName = students.sextypename;


INSERT INTO test_result (student_id, status, ball100, ball12, ball, subject_id)
SELECT students.student_id, UkrTestStatus, UkrBall100, UkrBall12, UkrBall, 2
FROM zno_data
JOIN students ON zno_data.OutID = students.outid
              AND zno_data.Birth = students.birth
              AND zno_data.SexTypeName = students.sextypename;



INSERT INTO test_result (student_id, status, ball100, ball12, ball, subject_id)
SELECT students.student_id, HistTestStatus, HistBall100, HistBall12, HistBall, 3
FROM zno_data
JOIN students ON zno_data.OutID = students.outid
              AND zno_data.Birth = students.birth
              AND zno_data.SexTypeName = students.sextypename;



INSERT INTO test_result (student_id, status, ball100, ball12, ball, subject_id)
SELECT students.student_id, MathTestStatus, MathBall100, MathBall12, MathBall, 4
FROM zno_data
JOIN students ON zno_data.OutID = students.outid
              AND zno_data.Birth = students.birth
              AND zno_data.SexTypeName = students.sextypename;


INSERT INTO test_result (student_id, status, ball100, ball12, ball, subject_id)
SELECT students.student_id, PhysTestStatus, PhysBall100, PhysBall12, PhysBall, 5
FROM zno_data
JOIN students ON zno_data.OutID = students.outid
              AND zno_data.Birth = students.birth
              AND zno_data.SexTypeName = students.sextypename;


INSERT INTO test_result (student_id, status, ball100, ball12, ball, subject_id)
SELECT students.student_id, ChemTestStatus, ChemBall100, ChemBall12, ChemBall, 6
FROM zno_data
JOIN students ON zno_data.OutID = students.outid
              AND zno_data.Birth = students.birth
              AND zno_data.SexTypeName = students.sextypename;


INSERT INTO test_result (student_id, status, ball100, ball12, ball, subject_id)
SELECT students.student_id, BioTestStatus, BioBall100, BioBall12, BioBall, 7
FROM zno_data
JOIN students ON zno_data.OutID = students.outid
              AND zno_data.Birth = students.birth
              AND zno_data.SexTypeName = students.sextypename;

INSERT INTO test_result (student_id, status, ball100, ball12, ball, subject_id)
SELECT students.student_id, GeoTestStatus, GeoBall100, GeoBall12, GeoBall, 8
FROM zno_data
JOIN students ON zno_data.OutID = students.outid
              AND zno_data.Birth = students.birth
              AND zno_data.SexTypeName = students.sextypename;


INSERT INTO test_result (student_id, status, ball100, ball12, ball, subject_id)
SELECT students.student_id, EngTestStatus, EngBall100, EngBall12, EngBall, 9
FROM zno_data
JOIN students ON zno_data.OutID = students.outid
              AND zno_data.Birth = students.birth
              AND zno_data.SexTypeName = students.sextypename;

INSERT INTO test_result (student_id, status, ball100, ball12, ball, subject_id)
SELECT students.student_id, FrTestStatus, FrBall100, FrBall12, FrBall, 10
FROM zno_data
JOIN students ON zno_data.OutID = students.outid
              AND zno_data.Birth = students.birth
              AND zno_data.SexTypeName = students.sextypename;

INSERT INTO test_result (student_id, status, ball100, ball12, ball, subject_id)
SELECT students.student_id, DeuTestStatus, DeuBall100, DeuBall12, DeuBall, 11
FROM zno_data
JOIN students ON zno_data.OutID = students.outid
              AND zno_data.Birth = students.birth
              AND zno_data.SexTypeName = students.sextypename;

INSERT INTO test_result (student_id, status, ball100, ball12, ball, subject_id)
SELECT students.student_id, SpTestStatus, SpBall100, SpBall12, SpBall, 12
FROM zno_data
JOIN students ON zno_data.OutID = students.outid
              AND zno_data.Birth = students.birth
              AND zno_data.SexTypeName = students.sextypename;