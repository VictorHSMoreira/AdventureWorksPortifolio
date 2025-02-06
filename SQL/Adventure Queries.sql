--SELECT 1

USE AdventureWorksDW2022;

WITH FaturamentoAnual (Faturamento, Ano) AS
(
	SELECT
		SUM(S.SalesAmount) AS Faturamento,
		D.CalendarYear AS Ano
	FROM FactInternetSales AS S
	INNER JOIN DimDate AS D ON D.DateKey = S.OrderDateKey
	GROUP BY D.CalendarYear
)

SELECT
	Ano,
	FORMAT(Faturamento, 'C0') AS FaturamentoAno,
	FORMAT(LAG(Faturamento, 1, 0) OVER(ORDER BY Ano, Faturamento ASC), 'C0') AS FaturamentoAnoAnt,
	FORMAT(Faturamento - LAG(Faturamento, 1, 0) OVER(ORDER BY Ano, Faturamento ASC), 'C0') AS DiferençaAno
FROM FaturamentoAnual AS F
WHERE Ano BETWEEN 2011 AND 2013




--SELECT 2
SELECT 
	FORMAT(AVG(S.SalesAmount), 'C0') AS Média
FROM FactInternetSales AS S
INNER JOIN DimDate AS D ON D.DateKey = OrderDateKey
WHERE D.CalendarYear = 2013


--SELECT 3

SELECT
	S.CustomerKey,
	CONCAT(C.FirstName, ' ', C.LastName) AS Cliente,
	FORMAT(AVG(S.SalesAmount), 'C0') AS FaturamentoMedio,
	D.CalendarYear AS Ano	
FROM FactInternetSales AS S
INNER JOIN DimDate AS D ON D.DateKey = OrderDateKey
INNER JOIN DimCustomer AS C ON C.CustomerKey = S.CustomerKey
GROUP BY S.CustomerKey, D.CalendarYear, CONCAT(C.FirstName, ' ', C.LastName)
HAVING D.CalendarYear = 2013
ORDER BY FaturamentoMedio DESC


--SELECT 4

USE AdventureWorksDW2022;
WITH FaturamentoMeses(SomaFaturamento, NomeMes)
AS
(
	SELECT
		FORMAT(SUM(S.SalesAmount), 'C0') AS SomaFaturamento,
		D.EnglishMonthName AS NomeMes
	FROM FactInternetSales AS S
	INNER JOIN DimDate AS D ON D.DateKey = S.OrderDateKey
	WHERE DATEPART(YEAR, S.OrderDate) BETWEEN 2011 AND 2013
	GROUP BY D.EnglishMonthName
)
SELECT TOP 3
	*
FROM FaturamentoMeses
ORDER BY SomaFaturamento DESC

--SELECT 5

USE AdventureWorksDW2022;
WITH FaturamentoMeses(SomaFaturamento, NomeDia)
AS
(
	SELECT
		FORMAT(SUM(S.SalesAmount), 'C0') AS SomaFaturamento,
		D.EnglishDayNameOfWeek AS NomeDia
	FROM FactInternetSales AS S
	INNER JOIN DimDate AS D ON D.DateKey = S.OrderDateKey
	WHERE DATEPART(YEAR, S.OrderDate) BETWEEN 2011 AND 2013
	GROUP BY D.EnglishDayNameOfWeek
)
SELECT TOP 3
	*
FROM FaturamentoMeses
ORDER BY SomaFaturamento DESC

--SELECT 6


USE AdventureWorksDW2022

SELECT
	COUNT(P.EnglishDescription) ItensIniciados,
	DATEPART(YEAR,P.StartDate) AS AnoInicio
FROM DimProduct AS P
GROUP BY DATEPART(YEAR,P.StartDate)

--SELECT 7

USE AdventureWorksDW2022;
WITH FaturamentoCategora(Categora, Faturamento, Ano, Trimestre) AS
(
	SELECT
		C.EnglishProductCategoryName AS Categoria,
		FORMAT(SUM(S.SalesAmount), 'C0') AS Faturamento,
		D.CalendarYear AS Ano,
		D.CalendarQuarter AS Trimestre
	FROM FactInternetSales AS S
	INNER JOIN DimProduct AS P ON P.ProductKey = S.ProductKey
	INNER JOIN DimProductCategory AS C ON C.ProductCategoryKey = P.ProductSubcategoryKey
	INNER JOIN DimDate AS D ON D.DateKey = S.OrderDateKey
	GROUP BY 
		C.EnglishProductCategoryName,
		D.CalendarYear,
		D.CalendarQuarter
)

SELECT
	*
FROM FaturamentoCategora
WHERE 
	ANO = 2013
	AND Trimestre = 4
ORDER BY Faturamento DESC

--SELECT 8

USE AdventureWorksDW2022

SELECT DISTINCT TOP 10
	P.EnglishProductName,
	C.EnglishProductCategoryName,
	FORMAT(S.SalesAmount - S.TotalProductCost, 'C0') AS Margem
FROM FactInternetSales AS S
INNER JOIN DimProduct AS P ON P.ProductKey = S.ProductKey
INNER JOIN DimProductCategory AS C ON C.ProductCategoryKey = P.ProductSubcategoryKey
ORDER BY Margem DESC
