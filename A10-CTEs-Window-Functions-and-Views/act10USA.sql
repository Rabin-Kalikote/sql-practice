DROP VIEW IF EXISTS President;
DROP VIEW IF EXISTS DiedInOffice;
DROP VIEW IF EXISTS VicePresident;
-- Do not modify the code above this line

-- Leave this comment for grading purposes
-- Your code for part 1 here:
CREATE VIEW President AS
SELECT
  po.politician_id,
  p.firstname,
  p.middlename,
  p.lastname,
  po.start_date,
  po.end_date
FROM
  PoliticianOffice AS po
  JOIN Office AS o ON po.office_id = o.office_id
  JOIN Politician AS p ON po.politician_id = p.politician_id;

SELECT * FROM President;


-- INSERT INTO President VALUES (123, 'Barak', 'Hussein', 'Obama', '2009-01-20', '2017-01-20');

-- -------------

-- INSERT INTO Politician (firstname, lastname, middlename, suffix, birthdate, city_of_birth, state_of_birth, country_of_birth) VALUES ('Barack', 'Obama', 'Hussein', 'II', '1961-08-04', 'Honolulu', 'Hawaii', 'United States');

-- -- -- President office has ID 1

-- INSERT INTO PoliticianOffice (politician_id, office_id, start_date, end_date)
-- SELECT p.politician_id, 1, '2009-01-20', '2017-01-20'
-- FROM Politician AS p
-- WHERE p.firstname = 'Barack';

-- -------------

-- SELECT p.politician_id, o.office_id, '2009-01-20', '2017-01-20'
-- FROM PoliticianOffice AS po
--     JOIN Politician AS p ON po.politician_id = p.politician_id
--     JOIN Office AS o ON po.office_id = o.office_id
-- WHERE p.firstname = 'Barak';

-- -------------
-- UPDATE Politician
-- SET firstname = 'Barack'
-- WHERE lastname = 'Obama';


-- Leave this comment for grading purposes
-- Your code for part 3 here:
CREATE VIEW DiedInOffice AS
SELECT
  p.firstname,
  p.lastname,
  o.title AS "office",
  p.deathdate
FROM
  PoliticianOffice AS po
  JOIN Office AS o ON po.office_id = o.office_id
  JOIN Politician AS p ON po.politician_id = p.politician_id
WHERE p.deathdate = po.end_date
ORDER BY p.deathdate;

SELECT * FROM DiedInOffice;


-- Leave this comment for grading purposes
-- Your code for part 4 here:

-- CREATE VIEW VicePresident AS
-- SELECT
--   vpp.firstname || ' ' || vpp.lastname AS "vice_president",
--   pp.firstname || ' ' || pp.lastname AS "president",
--   CASE WHEN vpo.start_date <= po.start_date THEN po.start_date 
--      ELSE vpo.start_date
--   END
--   AS "start_date",
--   CASE WHEN vpo.end_date >= po.end_date THEN po.end_date 
--      ELSE vpo.end_date
--   END
--   AS "end_date"
-- FROM Office AS op
--   JOIN Office AS ovp
--   JOIN PoliticianOffice AS vpo ON vpo.office_id = ovp.office_id
--   JOIN PoliticianOffice AS po ON po.office_id = op.office_id AND ((po.start_date BETWEEN vpo.start_date AND vpo.end_date) AND (po.end_date BETWEEN vpo.start_date AND vpo.end_date))
--   JOIN Politician AS vpp ON vpo.politician_id = vpp.politician_id
--   JOIN Politician AS pp ON po.politician_id = pp.politician_id
  
-- WHERE op.title = 'President' AND ovp.title = 'Vice President'
-- ORDER BY "start_date";


CREATE VIEW VicePresident AS
SELECT
  vpp.firstname || ' ' || vpp.lastname AS "vice_president",
  pp.firstname || ' ' || pp.lastname AS "president",
  CASE WHEN vpo.start_date <= po.start_date THEN po.start_date 
     ELSE vpo.start_date
  END
  AS "start_date",
  CASE WHEN vpo.end_date >= po.end_date THEN po.end_date 
     ELSE vpo.end_date
  END
  AS "end_date"
FROM PoliticianOffice AS vpo
    JOIN PoliticianOffice AS po ON vpo.start_date < po.end_date AND vpo.end_date > po.start_date
    JOIN Office AS ovp ON vpo.office_id = ovp.office_id
    JOIN Office AS op ON po.office_id = op.office_id
    JOIN Politician AS vpp ON vpo.politician_id = vpp.politician_id
    JOIN Politician AS pp ON po.politician_id = pp.politician_id
        
WHERE ovp.title = 'Vice President' AND op.title = 'President'
ORDER BY "start_date";


SELECT * FROM VicePresident;



