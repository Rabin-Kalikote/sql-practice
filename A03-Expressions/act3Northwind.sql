-- Your code for part 1 here:
SELECT OrderID, OrderDate, RequiredDate
FROM Orders
WHERE ShippedDate IS NULL
ORDER BY RequiredDate;


-- Leave this comment for grading purposes
-- Your code for part 2 here:
SELECT CustomerID, ShippedDate, ShipCity
FROM Orders
WHERE ShipRegion = 'Northern Europe' AND CustomerID <> 'FOLKO'
ORDER BY ShippedDate NULLS last, ShippedDate ASC;



-- Leave this comment for grading purposes
-- Your code for part 3 here:
SELECT
    CustomerID, Phone, Address,
    CASE WHEN Phone IS NULL AND Address IS NULL THEN 'both'
         WHEN Phone IS NULL THEN 'phone'
         ELSE 'address'  
    END
    AS Missing
FROM Customers
WHERE Phone IS NULL OR Address IS NULL;

