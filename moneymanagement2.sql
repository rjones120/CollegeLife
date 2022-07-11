-- All information from managed money
SELECT *
FROM dbo.MoneyManagementPort

-- What I put money into the most the most
SELECT Payee, count(Payee) as Most_Frequent
FROM dbo.MoneyManagementPort
GROUP BY Payee
ORDER BY count(Payee) DESC

-- Top Stores I bought from the most
SELECT Payee, count(Payee) as Most_Frequent
FROM dbo.MoneyManagementPort
WHERE Payee != ('Checking Account') AND Payee != ('Business Checking') AND Payee != ('Me') AND Payee != ('Business Savings Account') AND Payee != ('Savings Account') AND Payee != ('Fifth Third Bank') AND Payee != ('Amex') AND Payee != ('Discover')
GROUP BY Payee
ORDER BY count(Payee) DESC

-- How many times I deposited into the account
SELECT COUNT(Deposit) as NumberofDeposits
FROM dbo.MoneyManagementPort
 -- Which Accounts I deposited into
 SELECT Account, Deposit
 FROM dbo.MoneyManagementPort
 WHERE Deposit is not null
 
 -- Most to least deposited with dates
 SELECT Account, Deposit, Date
 FROM dbo.MoneyManagementPort
 WHERE Deposit is not null
 ORDER BY Deposit DESC

 -- Highest Balance in Accounts
SELECT Account, Balance
FROM dbo.MoneyManagementPort
WHERE Account is not null
ORDER BY Balance DESC

-- Lowest Balance in Accounts
SELECT Balance, Account, Date
FROM dbo.MoneyManagementPort
WHERE Account is not null AND Date is not null
GROUP BY Balance, Account, Date
HAVING COUNT(1) = 1
ORDER BY Balance DESC


-- Biggest Payment and what it was from 
SELECT Category, Payment
FROM dbo.MoneyManagementPort
WHERE Category != '[Transfer]'
ORDER BY Payment DESC

--test
SELECT DISTINCT Date, Account, Balance
FROM dbo.MoneyManagementPort
WHERE Account is not null AND Date is not null
GROUP BY Balance, Account, Date
ORDER BY Balance ASC
-- test
SELECT DISTINCT date, Balance
FROM dbo.MoneyManagementPort
WHERE Account is not null AND Date is not null
ORDER BY Balance ASC