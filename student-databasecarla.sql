CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT
);

CREATE TABLE registered_courses (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

CREATE TABLE grades (
    student_id INT,
    course_id INT,
    grade INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (student_id, course_id) REFERENCES registered_courses(student_id, course_id)
);

INSERT INTO students VALUES (202502210, 'Carla Doumit', 19);

INSERT INTO registered_courses VALUES (202502210, 350);
INSERT INTO registered_courses VALUES (202502210, 311);
INSERT INTO registered_courses VALUES (202502210, 321);

INSERT INTO grades VALUES (202502210, 350, 92);
INSERT INTO grades VALUES (202502210, 311, 99);
INSERT INTO grades VALUES (202502210, 321, 97);

SELECT student_id, course_id, grade
FROM grades
WHERE student_id = 202502210
ORDER BY grade DESC
LIMIT 1;

SELECT student_id, AVG(grade) AS avg_grade
FROM grades
WHERE student_id = 202502210
GROUP BY student_id;
