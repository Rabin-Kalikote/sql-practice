-- Copy your code from act6create.sql, and then add keys and constraints:

DROP TABLE IF EXISTS Yotes;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS CourseMeetings;
DROP TABLE IF EXISTS CourseStudent;
DROP TABLE IF EXISTS CourseDetails;
-- Do not modify the code above

PRAGMA foreign_keys = OFF;

-- Your code to create the Yotes table here:
CREATE TABLE Yotes (
  YoteId INTEGER PRIMARY KEY,
  FirstName VARCHAR(20),
  LastName VARCHAR(20),
  Email  VARCHAR(50) NOT NULL,
  UNIQUE (Email)
);


-- Your code to create the Courses table here:
CREATE TABLE Courses (
  CourseId INTEGER PRIMARY KEY,
  CourseSubject VARCHAR(8),
  CourseNumber VARCHAR(7),
  Section INTEGER DEFAULT 1,
  "Year" VARCHAR(6),
  Term VARCHAR(7) CHECK (Term IN ('Summer', 'Spring', 'Winter', 'Fall')),
  InstructorId INTEGER REFERENCES Yotes (YoteId) ON DELETE SET NULL,
  FOREIGN KEY (CourseSubject, CourseNumber) REFERENCES CourseDetails (CourseSubject, CourseNumber) ON DELETE CASCADE
);


-- Your code to create the CourseMeetings table here:
CREATE TABLE CourseMeetings (
  CourseMeetingId INTEGER PRIMARY KEY,
  CourseId INTEGER REFERENCES Courses (CourseId) ON DELETE CASCADE,
  Days VARCHAR(10),
  StartTime VARCHAR(10),
  EndTime VARCHAR(10),
  Location VARCHAR(50),
  CHECK (EndTime > StartTime)
);


-- Your code to create the CourseStudent table here:
CREATE TABLE CourseStudent (
  CourseId INTEGER NOT NULL REFERENCES Courses (CourseId) ON DELETE CASCADE,
  StudentId INTEGER NOT NULL REFERENCES Yotes (YoteId),
  PRIMARY KEY (CourseId, StudentId)
);


-- Your code to create the CourseDetails table here:
CREATE TABLE CourseDetails (
  CourseSubject VARCHAR(5) NOT NULL,
  CourseNumber VARCHAR(5) NOT NULL,
  Title VARCHAR(50) NOT NULL,
  Credits INTEGER CHECK (Credits BETWEEN 0 AND 10),
  CourseDescription VARCHAR(2500),
  PRIMARY KEY (CourseSubject, CourseNumber)
);

