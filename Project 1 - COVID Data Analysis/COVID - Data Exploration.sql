------------------------------------------------------------
-- GLOBAL COVID ANALYSIS PROJECT
-- Author: Matheus Vieira
-- Dataset: CovidDeaths & CovidVaccinations
------------------------------------------------------------

-- SELECT DATABASE PROJECT
USE PortfolioProject
GO


-- First tables
SELECT * 
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
ORDER BY 3, 4

SELECT * 
FROM PortfolioProject..CovidVaccinations
ORDER BY 3,4


-- Select Data that i'm going to be using
SELECT location, date, total_cases, new_cases, total_deaths, population
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
ORDER BY location, date


-- Looking at Total Cases vs Total Death
-- Show likelihood of dying if you contract covid in your country
SELECT location, date, total_cases, total_deaths, ROUND((total_deaths/total_cases)*100, 2) as 'DeathPercentage'
FROM PortfolioProject..CovidDeaths
WHERE location = 'Brazil'
ORDER BY location, date


-- Looking at Total Cases vs Population in Brazil
-- Shows what percentage of population got Covid
SELECT 
	location, 
	date, 
	total_cases, 
	population, 
	(total_cases/population)*100 as 'InfectedPercentage'
FROM 
	PortfolioProject..CovidDeaths
WHERE location = 'Brazil'
ORDER BY location, date


-- Looking at Countries with highest Infection Rate compared to Population
SELECT 
    location AS "Location",
    population AS "Population",
    MAX(total_cases) AS "Total Cases",
    MAX(total_cases / population * 100) AS "Infection Percent"
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location, population
ORDER BY "Infection Percent" DESC;


-- Showing Countries with Highest Death Count per Population
SELECT 
    location AS "Location",
    MAX(CAST(total_deaths AS FLOAT)) AS "Total Deaths" --> Casting because data types problem when use max()
FROM 
    PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY "Total Deaths" DESC;


-- Let's break things down by CONTINENT
SELECT 
	location, 
	MAX(CAST(total_deaths as INT)) as 'TotalDeathCount' --> Casting because data types problem when use max()
FROM 
	PortfolioProject..CovidDeaths
WHERE continent IS NULL
GROUP BY location
ORDER BY 'TotalDeathCount' DESC


-- Highest country death value in each continent
SELECT 
	continent, 
	MAX(CAST(total_deaths as INT)) as 'TotalDeathCount' --> Casting because data types problem when use max()
FROM 
	PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY 'TotalDeathCount' DESC


-- GLOBAL VALUES
-- New cases and new deaths around the world per day
SELECT 
    date AS "Date",
    SUM(new_cases) AS "World New Cases per Day",
    SUM(CAST(new_deaths AS FLOAT)) AS "World New Deaths per Day",
    SUM(CAST(new_deaths AS FLOAT)) * 100.0 / NULLIF(SUM(new_cases), 0) AS "Death Percent per Day"
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY date
ORDER BY date;


-- TOTAL New cases and New deaths 
SELECT 
	SUM(new_cases) AS "Total New Cases", 
	SUM(CAST(new_deaths AS INT)) AS "Total New Deaths",
	SUM(CAST(new_deaths AS INT)) / SUM(new_cases) * 100 AS "DeathPercentage"
FROM 
	PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL


/*
START USING NOW THE SECOND TABLE CovidVaccinations
*/
SELECT * 
FROM PortfolioProject..CovidVaccinations
ORDER BY 3,4


-- Looking at Total Population vs Vaccinations per Day
SELECT 
    dea.continent AS "Continent",
    dea.location AS "Location",
    dea.date AS "Date",
    dea.population AS "Population",
    vac.new_vaccinations AS "New Vaccinations",
    SUM(CAST(vac.new_vaccinations AS FLOAT)) 
        OVER (PARTITION BY dea.location ORDER BY dea.date) AS "Cumulative Vaccinations"
FROM PortfolioProject..CovidDeaths dea
JOIN PortfolioProject..CovidVaccinations vac
    ON dea.location = vac.location 
    AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
ORDER BY dea.location, dea.date;


-- USING CTE
WITH PopvsVac(Continent, Location, Date, Population, New_Vaccinations, RollingPeopleVaccinated) AS (
SELECT 
	dea.continent,
	dea.location,
	dea.date,
	dea.population,
	vac.new_vaccinations,
	SUM(CONVERT(INT, vac.new_vaccinations)) OVER(PARTITION BY dea.location ORDER BY dea.location, dea.date)
FROM PortfolioProject..CovidDeaths dea
JOIN PortfolioProject..CovidVaccinations vac
	ON dea.location = vac.location AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
-- ORDER BY location, date
)

SELECT
	*,
	(RollingPeopleVaccinated / Population) * 100 AS "VaccinatedPeoplePercentage"
FROM 
	PopvsVac


-- CREATING AND USING TEMP TABLE
DROP TABLE IF EXISTS #PercentPopulationVaccinated
CREATE TABLE #PercentPopulationVaccinated
(
	Continent NVARCHAR(255),
	Location NVARCHAR(255),
	Date DATETIME,
	Population NUMERIC,
	New_vaccinations NUMERIC,
	RollingPeopleVaccinated NUMERIC
)

INSERT INTO #PercentPopulationVaccinated
SELECT 
	dea.continent,
	dea.location,
	dea.date,
	dea.population,
	vac.new_vaccinations,
	SUM(CONVERT(INT, vac.new_vaccinations)) OVER(PARTITION BY dea.location ORDER BY dea.location, dea.date)
FROM PortfolioProject..CovidDeaths dea
JOIN PortfolioProject..CovidVaccinations vac
	ON dea.location = vac.location AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
ORDER BY location, date

SELECT
	*,
	(RollingPeopleVaccinated / Population) * 100 AS "VaccinatedPeoplePercentage"
FROM 
	#PercentPopulationVaccinated
ORDER BY location, date


-- Creating View to store data for later visualizations
CREATE VIEW PercentPopulationVaccinated AS
SELECT 
	dea.continent,
	dea.location,
	dea.date,
	dea.population,
	vac.new_vaccinations,
	SUM(CONVERT(INT, vac.new_vaccinations)) OVER(PARTITION BY dea.location ORDER BY dea.location, dea.date) AS "RollingPeopleVaccinated"
FROM PortfolioProject..CovidDeaths dea
JOIN PortfolioProject..CovidVaccinations vac
	ON dea.location = vac.location AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
-- ORDER BY location, date

SELECT *
FROM PercentPopulationVaccinated


-- TOP TOTAL CASES VS TOTAL DEATHS PER COUNTRY (Death Rate per Country)
SELECT 
    location AS "Location",
    MAX(total_cases) AS "Total Cases",
    MAX(CAST(total_deaths AS FLOAT)) AS "Total Deaths",
    MAX(CAST(total_deaths AS FLOAT)) * 100.0 / NULLIF(MAX(total_cases), 0) AS "Death Percent"
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY "Death Percent" DESC;


-- GLOBAL TOTALS (LAST AVAILABLE DATE)
SELECT 
    MAX(date) AS "Last Date",
    SUM(new_cases) AS "New Cases",
    SUM(CAST(new_deaths AS FLOAT)) AS "New Deaths",
    SUM(CAST(new_deaths AS FLOAT)) * 100.0 / NULLIF(SUM(new_cases), 0) AS "Death Percent"
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL;


-- VACCINATION RATE BY COUNTRY
WITH VaccinationProgress AS (
    SELECT 
        dea.location AS "Location",
        dea.population AS "Population",
        MAX(CAST(vac.people_vaccinated AS FLOAT)) AS "People_Vaccinated"
    FROM PortfolioProject..CovidDeaths dea
    JOIN PortfolioProject..CovidVaccinations vac
        ON dea.location = vac.location 
        AND dea.date = vac.date
    WHERE dea.continent IS NOT NULL
    GROUP BY dea.location, dea.population
)
SELECT 
    Location,
    Population,
    People_Vaccinated,
    People_Vaccinated * 100.0 / NULLIF(Population, 0) AS "Vaccinated Percent"
FROM VaccinationProgress
WHERE People_Vaccinated IS NOT NULL
ORDER BY "Vaccinated Percent" DESC;


-- TOP COUNTRIES BY VACCINATION RATE
SELECT TOP 10
    dea.location AS "Location",
    MAX(CAST(vac.people_vaccinated AS FLOAT)) / NULLIF(MAX(dea.population), 0) * 100.0 AS "Vaccinated Percent"
FROM PortfolioProject..CovidDeaths dea
JOIN PortfolioProject..CovidVaccinations vac
    ON dea.location = vac.location 
    AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
GROUP BY dea.location
ORDER BY "Vaccinated Percent" DESC;


-- GLOBAL VACCINATION PROGRESS OVER TIME
SELECT 
    dea.date AS "Date",
    SUM(CAST(vac.new_vaccinations AS FLOAT)) AS "New Vaccinations per Day",
    SUM(SUM(CAST(vac.new_vaccinations AS FLOAT))) 
        OVER (ORDER BY dea.date) AS "Cumulative Vaccinations (World)"
FROM PortfolioProject..CovidDeaths dea
JOIN PortfolioProject..CovidVaccinations vac
    ON dea.location = vac.location 
    AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
GROUP BY dea.date
ORDER BY dea.date;


------------------------------------------------------------
-- ADVANCED INSIGHTS
-- Exploring socio-economic and health-related correlations
------------------------------------------------------------


-- 1. Infection rate vs GDP per Capita
-- Hypothesis: Richer countries may have higher testing and reported cases
SELECT 
    dea.location AS "Location",
    MAX(dea.total_cases / dea.population * 100) AS "Infection Percent",
    MAX(vac.gdp_per_capita) AS "GDP per Capita"
FROM PortfolioProject..CovidDeaths dea
JOIN PortfolioProject..CovidVaccinations vac
    ON dea.location = vac.location
WHERE dea.continent IS NOT NULL
GROUP BY dea.location
ORDER BY "GDP per Capita" DESC;


-- 2. Death rate vs GDP per Capita
-- Hypothesis: Countries with higher GDP have lower death rates
SELECT 
    dea.location AS "Location",
    MAX(CAST(dea.total_deaths AS FLOAT)) * 100.0 / NULLIF(MAX(dea.total_cases), 0) AS "Death Percent",
    MAX(vac.gdp_per_capita) AS "GDP per Capita"
FROM PortfolioProject..CovidDeaths dea
JOIN PortfolioProject..CovidVaccinations vac
    ON dea.location = vac.location
WHERE dea.continent IS NOT NULL
GROUP BY dea.location
ORDER BY "GDP per Capita" DESC;


-- 3. Life Expectancy vs Death Rate
-- Hypothesis: Countries with higher life expectancy may have lower COVID death rates
SELECT 
    dea.location AS "Location",
    MAX(CAST(dea.total_deaths AS FLOAT)) * 100.0 / NULLIF(MAX(dea.total_cases), 0) AS "Death Percent",
    MAX(vac.life_expectancy) AS "Life Expectancy"
FROM PortfolioProject..CovidDeaths dea
JOIN PortfolioProject..CovidVaccinations vac
    ON dea.location = vac.location
WHERE dea.continent IS NOT NULL
GROUP BY dea.location
ORDER BY "Life Expectancy" DESC;


-- 4. Hospital beds per thousand vs Death Rate
-- Hypothesis: Countries with more hospital beds may handle COVID better
SELECT 
    dea.location AS "Location",
    MAX(vac.hospital_beds_per_thousand) AS "Hospital Beds per Thousand",
    MAX(CAST(dea.total_deaths AS FLOAT)) * 100.0 / NULLIF(MAX(dea.total_cases), 0) AS "Death Percent"
FROM PortfolioProject..CovidDeaths dea
JOIN PortfolioProject..CovidVaccinations vac
    ON dea.location = vac.location
WHERE dea.continent IS NOT NULL
GROUP BY dea.location
HAVING MAX(vac.hospital_beds_per_thousand) IS NOT NULL
ORDER BY "Hospital Beds per Thousand" DESC;


-- 5. Median Age vs Death Rate
-- Hypothesis: Countries with older populations tend to have higher death rates
SELECT 
    dea.location AS "Location",
    MAX(vac.median_age) AS "Median Age",
    MAX(CAST(dea.total_deaths AS FLOAT)) * 100.0 / NULLIF(MAX(dea.total_cases), 0) AS "Death Percent"
FROM PortfolioProject..CovidDeaths dea
JOIN PortfolioProject..CovidVaccinations vac
    ON dea.location = vac.location
WHERE dea.continent IS NOT NULL
GROUP BY dea.location
HAVING MAX(vac.median_age) IS NOT NULL
ORDER BY "Median Age" DESC;


-- 6. Diabetes prevalence vs Death Rate
-- Hypothesis: Higher diabetes prevalence may increase COVID fatality
SELECT 
    dea.location AS "Location",
    MAX(vac.diabetes_prevalence) AS "Diabetes Prevalence",
    MAX(CAST(dea.total_deaths AS FLOAT)) * 100.0 / NULLIF(MAX(dea.total_cases), 0) AS "Death Percent"
FROM PortfolioProject..CovidDeaths dea
JOIN PortfolioProject..CovidVaccinations vac
    ON dea.location = vac.location
WHERE dea.continent IS NOT NULL
GROUP BY dea.location
HAVING MAX(vac.diabetes_prevalence) IS NOT NULL
ORDER BY "Diabetes Prevalence" DESC;


-- 7. Cardiovascular death rate vs COVID Death Rate
-- Hypothesis: Countries with higher cardiovascular mortality may have higher COVID death rate
SELECT 
    dea.location AS "Location",
    MAX(vac.cardiovasc_death_rate) AS "Cardiovascular Death Rate",
    MAX(CAST(dea.total_deaths AS FLOAT)) * 100.0 / NULLIF(MAX(dea.total_cases), 0) AS "COVID Death Percent"
FROM PortfolioProject..CovidDeaths dea
JOIN PortfolioProject..CovidVaccinations vac
    ON dea.location = vac.location
WHERE dea.continent IS NOT NULL
GROUP BY dea.location
HAVING MAX(vac.cardiovasc_death_rate) IS NOT NULL
ORDER BY "Cardiovascular Death Rate" DESC;


-- 8. Stringency Index over time (policy strictness)
-- Shows how government restrictions evolved through the pandemic
SELECT 
    vac.location AS "Location",
    vac.date AS "Date",
    vac.stringency_index AS "Stringency Index"
FROM PortfolioProject..CovidVaccinations vac
WHERE vac.continent IS NOT NULL
ORDER BY vac.location, vac.date;


-- 9. GDP per Capita vs Vaccination Rate
-- Hypothesis: Wealthier countries have vaccinated a higher proportion of their population
SELECT 
    dea.location AS "Location",
    MAX(vac.gdp_per_capita) AS "GDP per Capita",
    MAX(CAST(vac.people_vaccinated AS FLOAT)) * 100.0 / NULLIF(MAX(dea.population), 0) AS "Vaccinated Percent"
FROM PortfolioProject..CovidDeaths dea
JOIN PortfolioProject..CovidVaccinations vac
    ON dea.location = vac.location
WHERE dea.continent IS NOT NULL
GROUP BY dea.location
HAVING MAX(vac.gdp_per_capita) IS NOT NULL
ORDER BY "GDP per Capita" DESC;


-- 10. Handwashing facilities vs Infection Rate
-- Hypothesis: Countries with better hygiene infrastructure have lower infection rates
SELECT 
    dea.location AS "Location",
    MAX(vac.handwashing_facilities) AS "Handwashing Facilities (%)",
    MAX(dea.total_cases / dea.population * 100) AS "Infection Percent"
FROM PortfolioProject..CovidDeaths dea
JOIN PortfolioProject..CovidVaccinations vac
    ON dea.location = vac.location
WHERE dea.continent IS NOT NULL
GROUP BY dea.location
HAVING MAX(vac.handwashing_facilities) IS NOT NULL
ORDER BY "Handwashing Facilities (%)" DESC;