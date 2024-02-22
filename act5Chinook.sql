-- Your code for part 1 here:

-- INSERT INTO MediaType (MediaTypeId, Name)
-- VALUES (6, 'FLAC');


-- Leave this comment for grading purposes
-- Your code for part 2 here:

-- UPDATE Customer
-- SET
--   Email = 'ejones270@gmail.com'
-- WHERE FirstName = 'Emma' AND LastName = 'Jones';


-- UPDATE Customer
-- SET
--   Address = '1234 Cleveland Blvd',
--   City = 'Caldwell',
--   State = 'ID',
--   PostalCode = '83605'
-- WHERE FirstName = 'Frank' AND LastName = 'Harris';


-- INSERT INTO Customer
--     (FirstName, LastName)
-- VALUES
--     ('Jim', 'Dull');


-- INSERT INTO Customer
--     (FirstName, LastName, Email)
-- VALUES
--     ('Jim', 'Dull', 'jdull@collegeofidaho.edu');

-- SELECT * FROM Customer
-- WHERE FirstName = 'Jim' AND LastName = 'Dull';


-- INSERT INTO Employee
--     (EmployeeId, FirstName, LastName, Title)
-- VALUES
--     (13, 'Lynda', 'Danielson', 'Sales Support Agent');


-- UPDATE Customer
-- SET
--   SupportRepId = 13
-- WHERE FirstName = 'Jim' AND LastName = 'Dull';

-- SELECT c.FirstName || ' ' || c.LastName AS "Customer",
--     s.FirstName || ' ' || s.LastName AS "Support Rep"
-- FROM Customer AS c
--     JOIN Employee AS s ON c.SupportRepId = s.EmployeeId;

-- SELECT EmployeeId FROM Employee WHERE FirstName = 'Steve';

-- UPDATE Customer
-- SET
--   SupportRepId = 13
-- WHERE SupportRepId = 5;

-- DELETE FROM Employee WHERE EmployeeId = 5;


-- part 12
-- SELECT c.FirstName || ' ' || c.LastName AS "Customer",
--     s.FirstName || ' ' || s.LastName AS "Support Rep"
-- FROM Customer AS c
--     JOIN Employee AS s ON c.SupportRepId = s.EmployeeId;

-- SELECT ArtistId FROM Artist WHERE Name = 'Aisha Duo'; -- returns 197

-- DELETE FROM Track
-- WHERE AlbumId IN
--   (SELECT AlbumId FROM Album
--    WHERE ArtistId = 197)
-- ;  

-- DELETE FROM Album WHERE ArtistId = 197;

-- DELETE FROM Artist WHERE ArtistId = 197;

