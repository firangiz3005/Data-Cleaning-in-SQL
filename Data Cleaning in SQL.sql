select *
from [dbo].[onlinefoods.csv data set from kaggle1];

--Standardize date format
select Date_Recorded
from [dbo].[OnlineFood];

select Date_Recorded, convert(date, Date_Recorded)
from dbo.OnlineFood;

update OnlineFood
set Date_Recorded = convert(date, Date_Recorded)

ALTER TABLE OnlineFood
ADD SaleDateConverted Date;

update OnlineFood
set SaleDateConverted = convert(date,Date_Recorded)

select SaleDateConverted
from dbo.OnlineFood;

select *
from dbo.OnlineFood;

-- Break out address into individual columns
select Address
from dbo.OnlineFood

select
PARSENAME(REPLACE(Address, ',','.'),3),
PARSENAME(REPLACE(Address, ',','.'),2),
PARSENAME(REPLACE(Address, ',','.'),1)
from dbo.OnlineFood

ALTER TABLE OnlineFood
Add SplitAddress Nvarchar(255)

ALTER TABLE OnlineFood
Add City Nvarchar(255)

ALTER TABLE OnlineFood
Add SplitState Nvarchar(255)

UPDATE OnlineFood
SET SplitAddress = PARSENAME(REPLACE(Address, ',','.'),3)

UPDATE OnlineFood
SET City = PARSENAME(REPLACE(Address, ',','.'),2)

UPDATE OnlineFood
SET SplitState = PARSENAME(REPLACE(Address, ',','.'),1)

select *
from dbo.OnlineFood

--Change 'Post Graduate' to "P/G" 
select distinct(Educational_Qualifications), count(Educational_Qualifications)
from dbo.OnlineFood
group by Educational_Qualifications
order by 2

select Educational_Qualifications,
Case	When Educational_Qualifications = 'Post Graduate' then 'P/G'
		Else Educational_Qualifications
		End
from dbo.OnlineFood

UPDATE OnlineFood	
Set Educational_Qualifications = Case	When Educational_Qualifications = 'Post Graduate' then 'P/G'
		Else Educational_Qualifications
		End
select *
from dbo.OnlineFood

-- Remove Duplicates
WITH RowNumberCTE AS (
select *,
ROW_NUMBER() OVER(PARTITION BY Gender, Occupation, latitude ORDER BY Gender) duplicate_row
from dbo.OnlineFood
)
delete
from RowNumberCte
where duplicate_row>1
--order by duplicate_row desc

select *
from dbo.OnlineFood

-- Delete unused columns

select *
from dbo.OnlineFood

ALTER TABLE OnlineFood
DROP COLUMN Date_Recorded, Address

select *
from dbo.OnlineFood

