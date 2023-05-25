SELECT l.regname, s.year, MAX(tests.ball100)
FROM students s JOIN locations l ON s.location_id = l.location_id
                JOIN test_result tests ON s.student_id = tests.student_id
                JOIN subject ON tests.subject_id=subject.subject_id
WHERE tests.status = 'Зараховано' and (subjectname='UKR' or subjectname='UML')
GROUP BY l.regname, s.year;