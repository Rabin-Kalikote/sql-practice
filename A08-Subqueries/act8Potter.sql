-- Your code for part 1 here:
SELECT
    p.firstName || ' ' || p.lastName AS Parent,
    c.firstName || ' ' || c.lastName AS Child
FROM
    Person AS p,
    Person AS c
WHERE
    (p.personid, c.personid) IN (SELECT * FROM ParentChild);


-- Leave this comment for grading purposes
-- Your code for part 2 here:
SELECT
    gp.firstName || ' ' || gp.lastName AS Grandparent,
    p.firstName || ' ' || p.lastName AS Parent,
    c.firstName || ' ' || c.lastName AS Child
FROM
    Person AS gp,
    Person AS p,
    Person AS c
WHERE
    (c.personid) IN (SELECT ChildId FROM ParentChild WHERE ParentId = p.personid)
    AND (p.personid) IN (SELECT ChildId FROM ParentChild WHERE ParentId = gp.personid);


-- Leave this comment for grading purposes
-- Your code for part 3 here:
SELECT firstName
FROM Person AS c
WHERE EXISTS (
    SELECT 1
    FROM ParentChild AS pc
    WHERE pc.childID = c.personID
    AND EXISTS (
        SELECT 1
        FROM Person AS p
        WHERE pc.parentID = p.personID AND p.firstName = 'Molly'
    )
) AND firstName <> 'Ron'
ORDER BY firstName;



