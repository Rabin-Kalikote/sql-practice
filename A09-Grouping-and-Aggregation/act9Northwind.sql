-- Your code for part 1 here:
SELECT COUNT(*) FROM Products;


-- Leave this comment for grading purposes
-- Your code for part 2 here:
SELECT MIN(BirthDate) FROM Employees;


-- Leave this comment for grading purposes
-- Your code for part 3 here:
SELECT ShipRegion, COUNT(*) FROM Orders
GROUP BY ShipRegion
ORDER BY COUNT(*) DESC;


-- Leave this comment for grading purposes
-- Your code for part 4 here:
SELECT ShipRegion, COUNT(*) FROM Orders
WHERE ShippedDate NOT NULL
GROUP BY ShipRegion
ORDER BY COUNT(*) DESC;


-- Leave this comment for grading purposes
-- Your code for part 5 here:
SELECT ShipRegion, COUNT(*) FROM Orders
WHERE ShippedDate NOT NULL
GROUP BY ShipRegion
HAVING COUNT(*) > 50 AND COUNT(*) < 100
ORDER BY COUNT(*) DESC;


-- Leave this comment for grading purposes
-- Your code for part 6 here:
SELECT c.CategoryName AS "Category",
    AVG(p.UnitPrice) AS "Average unit price",
    SUM(p.UnitsInStock) As 'Total number of units in stock'
FROM Products as p
    JOIN Categories AS c ON c.CategoryID = p.CategoryID
GROUP BY c.CategoryName
ORDER BY "Average unit price" ASC;


-- Leave this comment for grading purposes
-- Your code for part 7 here:
SELECT c.CategoryName AS "Category",
    AVG(p.UnitPrice) AS "Average unit price",
    SUM(p.UnitsInStock) As 'Total number of units in stock'
FROM Products as p
    JOIN Categories AS c ON c.CategoryID = p.CategoryID
WHERE Discontinued = 0
GROUP BY c.CategoryName
ORDER BY "Average unit price" ASC;


-- Leave this comment for grading purposes
-- Your code for part 8 here:
SELECT c.CategoryName AS "Category",
    AVG(p.UnitPrice) AS "Average unit price",
    SUM(p.UnitsInStock) As "Total number of units in stock"
FROM Products as p
    JOIN Categories AS c ON c.CategoryID = p.CategoryID
WHERE Discontinued = 0
GROUP BY c.CategoryName
HAVING "Total number of units in stock" > 299
ORDER BY "Average unit price" ASC;

