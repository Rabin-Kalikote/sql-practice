DROP TABLE IF EXISTS A;
DROP TABLE IF EXISTS B;
DROP TABLE IF EXISTS C;
DROP TABLE IF EXISTS D;
DROP TABLE IF EXISTS E;

CREATE TABLE A (x, y);
CREATE TABLE B (x, y, z, w);
CREATE TABLE C (x, y, z, w);
CREATE TABLE D (a, b);
CREATE TABLE E (q, r, s);
-- Do Not modify the code above this line

-- Your code for part 1 here:
INSERT INTO A (x, y)
VALUES (10, 22);


-- Leave this comment for grading purposes
-- Your code for part 2 here:
INSERT INTO B (x, z)
VALUES (5, 10);


-- Leave this comment for grading purposes
-- Your code for part 3 here:
INSERT INTO C (x, y, z, w)
VALUES (0, 0, 0, 0), (1, 0, 1, 0), (1, 2, 3, 4), (2, 4, 6, 8), (10, -4, -5, -1), (-1, 3, 10, -3);


-- Leave this comment for grading purposes
-- Your code for part 4 here:
INSERT INTO D (a, b)
SELECT x+y+z+w AS s, x*y*z*w as p FROM C;


-- Leave this comment for grading purposes
-- Your code for part 5 here:
INSERT INTO E (q, s)
SELECT a+b AS s,
    CASE WHEN a <> 0
        THEN a
        WHEN b <> 0
        THEN b
        ELSE NULL
     END
     AS p
FROM D;

