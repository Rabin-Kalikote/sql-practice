-- Your code for part 1 here:
SELECT a.Title AS "Metallica Albums",
    COUNT(*) AS "Number of Tracks",
    ROUND( MIN(t.Milliseconds/60000.00), 2) AS "Min",
    ROUND( MAX(t.Milliseconds/60000.00), 2) AS 'Max',
    ROUND( AVG(t.Milliseconds/60000.00), 2) AS "Average"
FROM Album AS a
    JOIN Artist AS ar ON a.ArtistId = ar.ArtistId
    JOIN Track AS t ON t.AlbumId = a.AlbumId
WHERE ar.Name = 'Metallica'
GROUP BY a.Title;


-- Leave this comment for grading purposes
-- Your code for part 2 here:
SELECT ROUND( AVG(t.Milliseconds/60000.00), 2) AS "Average Track Length",
    g.Name AS "Genre"
FROM Track AS t
    JOIN Genre AS g ON t.GenreId = g.GenreId
GROUP BY g.Name;


-- Leave this comment for grading purposes
-- Your code for part 3 here:
SELECT ROUND( AVG(t.Milliseconds/60000.00), 2) AS "Average Track Length",
    g.Name AS "Genre",
    mt.Name AS "Media Type"
FROM Track AS t
    JOIN Genre AS g ON t.GenreId = g.GenreId
    JOIN MediaType AS mt ON t.MediaTypeId = mt.MediaTypeId
GROUP BY g.Name, mt.name
ORDER BY mt.Name, g.Name;


-- Leave this comment for grading purposes
-- Your code for part 4 here:
SELECT a.Name,
    COUNT(*) AS "Number of Track"
FROM Artist AS a
    JOIN Album AS al ON a.ArtistId = al.ArtistId
    JOIN Track AS t ON al.AlbumId = t.AlbumId
GROUP BY a.Name
HAVING "Number of Track" > 99
ORDER BY "Number of Track" DESC;
    


-- Leave this comment for grading purposes
-- Your code for part 5 here:
SELECT a.Name,
    ROUND( SUM(t.Milliseconds/3600000.00), 2) AS "Number of Hours"
FROM Artist AS a
    JOIN Album AS al ON a.ArtistId = al.ArtistId
    JOIN Track AS t ON al.AlbumId = t.AlbumId
    JOIN Genre AS g ON t.GenreId = g.GenreId
WHERE g.Name NOT IN ('TV Shows', 'Drama', 'Comedy', 'Sci Fi & Fantasy', 'Science Fiction')
GROUP BY a.Name
HAVING "Number of Hours" > 3.99
ORDER BY "Number of Hours" DESC;

