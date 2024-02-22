DROP TABLE IF EXISTS Yotes;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS CourseMeetings;
DROP TABLE IF EXISTS CourseStudent;
DROP TABLE IF EXISTS CourseDetails;
-- Do not modify the code above

-- Your code to create the Yotes table here:
CREATE TABLE Yotes (
  YoteId INTEGER,
  FirstName VARCHAR(20),
  LastName VARCHAR(20),
  Email  VARCHAR(50)
);


-- Your code to create the Courses table here:
CREATE TABLE Courses (
  CourseId INTEGER,
  CourseSubject VARCHAR(8),
  CourseNumber INTEGER,
  Section INTEGER,
  Year INTEGER,
  Term VARCHAR(7),
  InstructorId INTEGER
);


-- Your code to create the CourseMeetings table here:
CREATE TABLE CourseMeetings (
  CourseMeetingId INTEGER,
  CourseId INTEGER,
  Days VARCHAR(10),
  StartTime VARCHAR(10),
  EndTime VARCHAR(10),
  Location VARCHAR(50)
);


-- Your code to create the CourseStudent table here:
CREATE TABLE CourseStudent (
  CourseId INTEGER,
  StudentId INTEGER
);


-- Your code to create the CourseDetails table here:
CREATE TABLE CourseDetails (
  CourseSubject VARCHAR(5),
  CourseNumber INTEGER,
  Title VARCHAR(50),
  Credits INTEGER,
  CourseDescription VARCHAR(2500)
);