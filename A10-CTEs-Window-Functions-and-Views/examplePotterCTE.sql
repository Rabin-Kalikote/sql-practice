WITH
    Ron AS (
        SELECT * FROM Person 
        WHERE firstName = 'Ron' AND lastName = 'Weasley'
        ),
    RonParents AS (
        SELECT * FROM Person 
        WHERE personID IN (
            SELECT parentID
            FROM ParentChild, Ron
            WHERE childID = Ron.personID)
        ),
    WeasleyKids AS (
        SELECT * FROM Person
        WHERE personID IN (
            SELECT childId
            FROM ParentChild, RonParents
            WHERE parentID = RonParents.personID)
        )
SELECT 
    sib.firstName
FROM 
    WeasleyKids AS sib, Ron
WHERE 
    sib.personID <> Ron.personID;

