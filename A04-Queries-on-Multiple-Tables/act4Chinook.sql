-- Your code for part 1 here:
SELECT al.Title AS "Album Title", ar.Name AS "Artist"
FROM Album AS al
    JOIN Artist AS ar ON al.ArtistId = ar.ArtistId;



-- Leave this comment for grading purposes
-- Your code for part 2 here:
SELECT c.FirstName || ' ' || c.LastName AS "Customer", em.FirstName || ' ' || em.LastName AS "Support Rep"
FROM Customer AS c
    JOIN Employee AS em ON c.SupportRepId = em.EmployeeId
WHERE Customer IS NOT null AND "Support Rep" IS NOT null
ORDER BY em.LastName, c.LastName;


-- Leave this comment for grading purposes
-- Your code for part 3 here:
SELECT e.FirstName || ' ' || e.LastName AS "Employee",
    CASE WHEN b.EmployeeId THEN b.FirstName || ' ' || b.LastName
        ELSE null
    END
    AS "Boss"
FROM Employee AS e
    LEFT JOIN Employee AS b ON e.ReportsTo = b.EmployeeId
-- WHERE e.ReportsTo = b.EmployeeId OR e.ReportsTo IS null
ORDER BY b.FirstName NULLS LAST;


-- Leave this comment for grading purposes
-- Your code for part 4 here:
SELECT t.Name AS "Track",
    p.Name AS "Playlist"
FROM PlaylistTrack AS pt
    JOIN Playlist AS p ON p.PlaylistId = pt.PlaylistId
    JOIN Track AS t ON pt.TrackId = t.TrackId
WHERE p.name = 'Grunge' OR p.name = 'Heavy Metal Classic';


-- Leave this comment for grading purposes
-- Your code for part 5 here:
SELECT round(t.Milliseconds/1000.00, 2) AS Duration,
    t.name AS Track,
    a.Title AS Album,
    ar.Name AS Artist 
FROM Track AS t
    JOIN Album AS a ON t.AlbumId = a.AlbumId
    JOIN Artist AS ar ON a.ArtistId = ar.ArtistId
WHERE t.Milliseconds < 50000
ORDER BY t.Milliseconds;


-- Leave this comment for grading purposes
-- Your code for part 6 here:
SELECT t.Name AS Track
FROM InvoiceLine AS il
    JOIN Invoice AS i ON il.InvoiceId = i.InvoiceId
    JOIN Customer AS c ON c.CustomerId = i.CustomerId
    JOIN Track AS t ON t.TrackId = il.TrackId
WHERE c.FirstName = 'Mark' AND c.LastName = 'Taylor'
ORDER BY t.Name;


-- Leave this comment for grading purposes
-- Your code for part 7 here"
SELECT DISTINCT c.CustomerId AS "Customer ID", c.LastName AS "Last Name"
FROM InvoiceLine AS il
    JOIN Track AS t ON il.TrackId = t.TrackId
    JOIN Album AS a ON a.AlbumId = t.AlbumId
    JOIN Artist AS ar ON a.ArtistId = ar.ArtistId
    JOIN Invoice AS i ON il.InvoiceId = i.InvoiceId
    JOIN Customer as c ON i.CustomerId = c.CustomerId
WHERE ar.Name ='AC/DC';


