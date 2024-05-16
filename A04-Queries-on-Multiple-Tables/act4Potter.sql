-- Your code for part 1 here:
SELECT p.firstName || ' ' || p.lastName AS "Parent", c.firstName || ' ' || c.lastName AS "Child"
FROM ParentChild AS pc
    LEFT JOIN Person AS c ON pc.childID = c.personID
    LEFT JOIN Person AS p ON pc.parentID = p.personID;


-- Leave this comment for grading purposes
-- Your code for part 2 here:
SELECT c.firstName
FROM ParentChild AS pc
    LEFT JOIN Person AS c ON pc.childID = c.personID
    LEFT JOIN Person AS p ON pc.parentID = p.personID
WHERE (p.firstName = 'Molly') AND c.firstName <> 'Ron'
ORDER BY c.firstName;


-- Leave this comment for grading purposes
-- Your code for part 3 here:
SELECT gp.firstName || ' ' || gp.lastName AS "Grand Parent",
    p.firstName || ' ' || p.lastName AS "Parent",
    c.firstName || ' ' || c.lastName AS "Child"
FROM ParentChild AS gp_pc
    LEFT JOIN Person AS gp ON gp_pc.parentID = gp.personID
    LEFT JOIN Person AS p ON gp_pc.childID = p.personID
    LEFT JOIN ParentChild AS p_pc ON p_pc.parentID = p.personID
    LEFT JOIN Person AS c ON p_pc.childID = c.personID
    
WHERE c.firstName NOT NULL;
