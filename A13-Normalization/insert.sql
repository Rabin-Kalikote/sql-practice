-- insert into WhoRegion (RegionCode, RegionName)
-- select distinct CAST("WHO Region Code" as decimal), CAST("WHO Region" as decimal) from AllData;

-- insert into Country (CountryCode, CountryName, RegionCode)
-- select distinct CAST("Country Code" as decimal), Country, CAST("WHO Region Code" as decimal) from AllData;

-- Inserting ------------------------------------------

-- insert into WhoRegion (RegionCode, RegionName)
-- select distinct "WHO Region Code", "WHO Region" from AllData;

-- insert into Country (CountryCode, CountryName, RegionCode)
-- select distinct "Country Code", "Country", "WHO Region Code" from AllData;

-- insert into AlcoholConsumption ("Year", "Country", "Sex", "HigherData", "LowerData", "AverageData")
-- select distinct "Year", "Country", "Sex", "Alcohol total per capita (15+) consumption in liters (high estimation)", "Alcohol total per capita (15+) consumption in liters (low estimation)", "Alcohol total per capita (15+) consumption in liters (numeric)" from AllData;

-- View --------------------------------------------------
drop view if exists AllDataView;

create view AllDataView as
select
    wr.RegionCode as "WHO Region Code",
    wr.RegionName as "WHO Region",
    c.CountryCode as "Country Code",
    c.CountryName as "Country",
    ac.Year as "Year",
    ac.Sex as "Sex",
    ac.AverageData as "Alcohol total per capita (15+) consumption in liters (numeric)",
    ac.HigherData as "Alcohol total per capita (15+) consumption in liters (high estimation)",
    ac.LowerData as "Alcohol total per capita (15+) consumption in liters (low estimation)",
    ac.AverageData || ' [' || ac.LowerData || ' - ' || ac.HigherData || ']' as "Alcohol total per capita (15+) consumption in liters (string)"
from WhoRegion as wr
    join Country as c on c.RegionCode = wr.RegionCode
    join AlcoholConsumption as ac on ac.Country = c.CountryName
order by "Year" desc, "Alcohol total per capita (15+) consumption in liters (string)", "Country";

DROP TABLE IF EXISTS AllData;
    