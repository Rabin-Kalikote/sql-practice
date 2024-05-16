-- Your code for part 1 here:
SELECT Title FROM Album
WHERE ArtistId =
(SELECT ArtistId FROM Artist
    WHERE Name = 'Led Zeppelin');


-- Leave this comment for grading purposes
-- Your code for part 2 here:
SELECT Email FROM Customer
WHERE SupportRepId =
(SELECT EmployeeId FROM Employee
    WHERE LastName = 'Peacock' AND FirstName = 'Jane')
ORDER BY Email;


-- Leave this comment for grading purposes
-- Your code for part 3 here:
SELECT FirstName, Lastname FROM Employee
WHERE EmployeeId IN
(SELECT ReportsTo FROM Employee);


-- Leave this comment for grading purposes
-- Your code for part 4 here:
SELECT FirstName, Lastname FROM Employee
WHERE EmployeeId NOT IN
(SELECT ReportsTo FROM Employee WHERE ReportsTo NOT NULL);


-- Leave this comment for grading purposes
-- Your code for part 6 here:
UPDATE Employee
SET (Title, ReportsTo) =
  (SELECT Title, ReportsTo
   FROM Employee
   WHERE FirstName = 'Nancy' AND LastName = 'Edwards')
WHERE FirstName = 'Dave' AND LastName = 'Rosoff';


-- Leave this comment for grading purposes
-- Your code for part 7 here:
UPDATE Employee
SET ReportsTo =
  (SELECT EmployeeId
   FROM Employee
   WHERE FirstName = 'Dave' AND LastName = 'Rosoff')
WHERE ReportsTo =
   (SELECT EmployeeId
   FROM Employee
   WHERE FirstName = 'Nancy' AND LastName = 'Edwards');



-- insert into Employee (FirstName, LastName, HireDate, Email) values ('Dave', 'Rosoff', '2024-02-29', 'dave@chinookcorp.com');