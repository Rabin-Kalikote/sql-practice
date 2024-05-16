-- Your code for part 1 here:
SELECT
  a.Title AS "Album Title",
  t.Name AS "Track Name",
  t.Milliseconds AS "Track Length",
  AVG( t.Milliseconds ) OVER
    (PARTITION BY t.AlbumId)
    AS "Album Average Track Length"
FROM
  Album AS a
  JOIN Track AS t ON t.AlbumId = a.AlbumId
  JOIN Artist AS ar ON a.ArtistId = ar.ArtistId
WHERE ar.Name = 'Foo Fighters'
ORDER BY "Album Title", "Track Length";


-- Leave this comment for grading purposes
-- Your code for part 2 here:
WITH
  ta AS
    (SELECT AlbumId, AVG( Milliseconds ) AS average
     FROM Track
     GROUP BY AlbumId)
SELECT
  a.Title AS "Album Title",
  t.Name AS "Track Name",
  t.Milliseconds AS "Track Length",
  ta.average AS "Album Average Track Length"
FROM
  Album AS a
  JOIN Track AS t ON t.AlbumId = a.AlbumId
  JOIN ta ON ta.AlbumId = a.AlbumId
  JOIN Artist AS ar ON a.ArtistId = ar.ArtistId
WHERE ar.Name = 'Foo Fighters'
ORDER BY "Album Title", "Track Length";


-- Leave this comment for grading purposes
-- Your code for part 3 here:
WITH
  ta AS
    (SELECT AlbumId,
         AVG( Milliseconds ) AS average,
         MAX( Milliseconds ) AS max,
         MIN( Milliseconds ) AS min
     FROM Track
     GROUP BY AlbumId)
SELECT
  a.Title AS "Album Title",
  t.Name AS "Track Name",
  t.Milliseconds AS "Track Length",
  ta.average AS "Album Average Track Length",
  ta.min AS "Album Min Track Length",
  ta.max AS "Album Max Track Length"
FROM
  Album AS a
  JOIN Track AS t ON t.AlbumId = a.AlbumId
  JOIN ta ON ta.AlbumId = a.AlbumId
  JOIN Artist AS ar ON a.ArtistId = ar.ArtistId
WHERE ar.Name = 'Foo Fighters'
ORDER BY "Album Title", "Track Length";




