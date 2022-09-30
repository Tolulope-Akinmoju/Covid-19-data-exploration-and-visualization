
--Queries used for Tableau Project



--1
--Showing Percentage death VS population

SELECT SUM(new_cases) AS total_cases, SUM(cast(new_deaths AS int)) AS total_deaths, SUM(cast(new_deaths AS int))/SUM(New_cases)*100 as PercentageDeath
FROM PortfolioProject.dbo.CovidDeaths$
--WHERE location like 'N%ria%'
 WHERE continent is not null
ORDER BY 1,2



--2
--For Consistency, We exclude these as they are not part of the above query
--European Union is part of Europe


SELECT location, SUM(cast(new_deaths as int)) AS TotalDeathCount
FROM PortfolioProject.dbo.CovidDeaths$
--WHERE location like 'N%ria%'
WHERE continent is null
AND location not in ('World', 'European Union', 'International')
GROUP BY location
ORDER BY TotalDeathCount desc


--3
--Looking at Countries with the highest infection rate compared to the Population

SELECT Location, population, MAX(total_cases) AS HighestInfectionCount, MAX(total_cases/population)*100 AS PercentInfectedPopulation
FROM PortfolioProject.dbo.CovidDeaths$
--WHERE location like 'N%ria%'
GROUP BY Location, population
ORDER BY PercentInfectedPopulation desc



--4

SELECT Location, population,date, MAX(total_cases) AS HighestInfectionCount, MAX(total_cases/population)*100 AS PercentInfectedPopulation
FROM PortfolioProject.dbo.CovidDeaths$
--WHERE location like 'N%ria%'
GROUP BY Location, population,date
ORDER BY PercentInfectedPopulation desc


