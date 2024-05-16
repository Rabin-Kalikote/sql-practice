-- For part 2, modify the following line:
SELECT * FROM Album LIMIT 10;

-- Be sure that you only have one query written above. In particular, the unit test for this activity assume there is only one semicolon above. 

-- Leave this comment for grading purposes
-- Your code for Part 3 here:
select Name
from Artist
order by Name desc
limit 2;


-- Part 4

-- Leave this comment for grading purposes
-- Your code for part (a) here:
SELECT FirstName, LastName, Address, PostalCode
FROM Customer
WHERE City = 'Paris';


-- Leave this comment for grading purposes
-- Your code for part (b) here:
SELECT FirstName, LastName, Title, BirthDate
FROM Employee
ORDER BY BirthDate ASC
LIMIT 3;


-- Leave this comment for grading purposes
-- Your code for part (c) here:
SELECT FirstName, LastName, Title, HireDate
FROM Employee
ORDER BY HireDate DESC
LIMIT 5;


-- Leave this comment for grading purposes
-- Your code for part (d) here:
SELECT ArtistID
FROM Artist
WHERE Name = 'Van Halen'
LIMIT 1;

-- returns 152


-- Leave this comment for grading purposes
-- Your code for part (e) here:
SELECT Title
FROM Album
WHERE ArtistId = 152;


