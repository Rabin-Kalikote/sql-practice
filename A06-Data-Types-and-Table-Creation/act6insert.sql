-- Insert data into Yotes here:
INSERT INTO Yotes 
VALUES 
    (12, 'Jim', 'Dull', 'jdull@collegeofidaho.edu'),
    (256, 'Jonny', 'Comes', 'jcomes@collegeofidaho.edu'),
    (201, 'Clara', 'Madsen', 'cmadsen@yotes.collegeofidaho.edu'),
    (153, 'Alice', 'Simurdak', 'asimurdak@yotes.collegeofidaho.edu');
    
-- Insert data into Courses here:
INSERT INTO Courses 
VALUES 
    (1234, 'CSC', '270', 1, '2024', 'Spring', 256),
    (1111, 'CSC', '270', 1, '2023', 'Spring', 256),
    (1012, 'MAT', '461', 1, '2022', 'Fall', 256),
    (2468, 'PHY', '271L', 2, '2024', 'Fall', 12);
    

-- Insert into Yotes
INSERT INTO Yotes 
VALUES 
    (0646282, 'Rabin', 'Kalikote', 'rabin.kalikote@yotes.collegeofidaho.edu'),
    (1, 'Lynda', 'Danielson', 'ldanielson@collegeofidaho.edu'),
    (2, 'Timothy', 'Lee', 'tlee@collegeofidaho.edu'),
    (3, 'Mike', 'Hartwell', 'mhartwell@yotes.collegeofidaho.edu');
 
-- Insert into Courses
INSERT INTO Courses 
VALUES 
    (1000001, 'CSC', '340', 1, '2024', 'Spring', 1),
    (1000002, 'PSY', '206', 1, '2024', 'Spring', 2),
    (1000003, 'MAT', '252', 1, '2024', 'Spring', 256),
    (1000004, 'THE', '185', 1, '2024', 'Spring', 3);


-- Insert data into CourseMeetings here:
INSERT INTO CourseMeetings
VALUES 
    -- (1, 1234, 'TH', '08:00', '09:15', 'CML 105'),
    (2, 1000001, 'TH', '09:25', '10:40', 'CML 105'),
    (3, 1000003, 'MWF', '09:00', '09:50', 'Boone 124'),
    (5, 1000002, 'TH', '13:00', '13:50', 'Jweet 110'),
    (4, 1000004, 'MWF', '11:00', '11:50', 'Langrise ST'),
    (12, 1012, 'MWF', '13:00', '13:50', 'Boone 132'),
    (34, 1234, 'TH', '09:25', '10:40', 'CML 105'),
    (56, 2468, 'H', '08:00', '10:40', 'TBD');



-- Insert data into CourseStudent here:
INSERT INTO CourseStudent
VALUES 
    (1000001, 0646282),
    (1234, 0646282),
    (1000002, 0646282),
    (1000003, 0646282),
    (1000004, 0646282),
    (1111, 201),
    (1111, 153),
    (2468, 153),
    (1012, 201);



-- Insert data into CourseDetails here:
INSERT INTO CourseDetails
VALUES
    ('CSC', '270', 'Applied Databases', 3, 
     'An introduction to the fundamental concepts of database design and management. Topics may include entity-relationship and relational data models, normalization, relational database design and implementation, SQL, and administration.'),
    ('MAT', '461', 'Abstract Algebra', 3, 
     'An introduction to the study of abstract algebra via the theory of groups and rings.'),
    ('PHY', '271L', 'Analytical Physics I Lab', 1, 
     'An integral part of PHY-271, with which it should normally be taken concurrently. One laboratory period weekly. Credit for PHY-271L will not be granted to students who have completed PHY-231L.'),
    ('CSC', '340', 'Algorithms Design and Analysis', 1, 
     'Fairly difficult class.'),
    ('PSY', '206', 'Social Psychology', 1, 
     'Has a lot of readings.'),
    ('MAT', '252', 'Discrete Mathematics', 1, 
     'Interesting proofs and graphs.'),
    ('THE', '185', 'Stagecraft', 1, 
     'There are more than 100 tools to use. Also, there are chances you will talk to beautiful girls.');


-- 6
INSERT INTO Yotes VALUES (333333, 'Jason', 'McClelland', 'jmcclelland@collegeofidaho.edu');
INSERT INTO Yotes VALUES (333334, 'Robin', 'Cruz', 'rcruz@collegeofidaho.edu');

-- 7
INSERT INTO Courses 
VALUES 
    (33333, 'CSC', '270', 1, '2020', 'Spring', 333333),
    (33334, 'CSC', '270', 1, '2021', 'Spring', 333334);
    
INSERT INTO CourseMeetings
VALUES 
    (6, 33333, 'TH', '09:25', '10:40', 'CML 105'),
    (7, 33334, 'TH', '09:25', '10:40', 'CML 105');









