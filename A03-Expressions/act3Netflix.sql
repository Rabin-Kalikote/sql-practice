-- Your code for part 1 here:
SELECT title, director
FROM Shows
WHERE director LIKE '%Coppola';


-- Leave this comment for grading purposes
-- Your code for part 2 here:
SELECT title, release_year
FROM Shows
WHERE date_added LIKE 'October 11%'
ORDER BY title;


-- Leave this comment for grading purposes
-- Your code for part 3 here:
SELECT title, duration
FROM Shows
WHERE duration LIKE '__ Seasons';


-- Leave this comment for grading purposes
-- Your code for part 4 here:
SELECT title
FROM Shows
WHERE type = 'Movie' AND title LIKE '%Happy%';


-- Leave this comment for grading purposes
-- Your code for part 5 here:
SELECT title, listed_in
FROM Shows
WHERE "cast" LIKE '%Nicolas Cage%' AND (listed_in LIKE '%Thrillers%' OR listed_in LIKE '%Sci-Fi%');


-- Leave this comment for grading purposes
-- Your code for part 6 here:
SELECT title, release_year, listed_in
FROM Shows
WHERE (release_year BETWEEN 1995 AND 2010) AND (title LIKE '%2') AND (listed_in NOT LIKE '%Comedies%')
ORDER BY release_year;


-- Leave this comment for grading purposes
-- Your code for part 7 here:
SELECT title,
    CASE WHEN listed_in LIKE '%Comedies%' THEN 1
         ELSE 0
    END
    AS funny
FROM Shows
WHERE release_year = 1993;


-- Leave this comment for grading purposes
-- Your code for part 8 here:
SELECT title || ' (' || release_year || ')'
FROM Shows
WHERE "cast" LIKE '%Denzel Washington%'
ORDER BY release_year;

