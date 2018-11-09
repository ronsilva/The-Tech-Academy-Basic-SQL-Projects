USE AdventureWorks2014
GO

CREATE PROC uspPayRateEmployee @title varchar(50) = NULL, @rate money = NULL
AS
SELECT
	hre.JobTitle 'Title',
	pp.firstName + ' ' + pp.MiddleName + ' ' + pp.LastName 'Full Name', 
	pph.PhoneNumber 'Phone #',
	eph.rate 'Rate Per Hour'
FROM Person.Person pp
Inner Join HumanResources.Employee hre ON pp.businessEntityID = hre.businessEntityID
Inner Join Person.PersonPhone pph ON pp.businessEntityID = pph.businessEntityID
Inner Join HumanResources.EmployeePayHistory eph ON pp.businessEntityID = eph.businessEntityID 
WHERE JobTitle LIKE '%' + @title + '%' OR Rate = @Rate
GO

EXEC uspPayRateEmployee @title = 'Acc'