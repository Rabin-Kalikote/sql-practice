-- Your code for part 7 here:
SELECT DISTINCT y.FirstName, y.LastName
FROM Yotes AS y
JOIN Courses AS c ON y.YoteId = c.InstructorId
WHERE c.CourseSubject = 'CSC' AND c.CourseNumber = '270'
ORDER BY y.LastName;


-- Leave this comment for grading purposes
-- Your code for part 8 here:
SELECT c.CourseSubject || '-' || c.CourseNumber || '-0' || c.Section AS course,
    cd.Title AS course_title,
    i.LastName AS instructor,
    cm.Days AS days,
    cm.StartTime AS start_time,
    cm.EndTime AS end_time,
    cm.Location AS room
FROM Yotes AS s
    JOIN CourseStudent AS cs on s.YoteId = cs.StudentId
    JOIN Courses AS c ON cs.CourseId = c.CourseId
    JOIN Yotes AS i ON i.YoteId = c.InstructorId
    JOIN CourseMeetings AS cm ON c.CourseId = cm.CourseId
    JOIN CourseDetails AS cd ON c.CourseSubject = cd.CourseSubject AND c.CourseNumber = cd.CourseNumber
WHERE s.YoteId = 0646282;



