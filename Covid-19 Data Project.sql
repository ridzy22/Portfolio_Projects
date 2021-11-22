SELECT *
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
ORDER BY 3,4;

--SELECT *
--FROM PortfolioProject..CovidVaccinations
--ORDER BY 3,4;

-- Select data that we are going to be using

SELECT location, date, total_cases, new_cases, total_deaths, population
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
ORDER BY 1,2;

-- Looking at Total Cases vs Total Deaths

SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 AS death_percentage
FROM PortfolioProject..CovidDeaths
-- WHERE location = 'India'
WHERE continent IS NOT NULL
ORDER BY 1,2;

-- Looking at the Total Cases vs Population

SELECT location, date, total_cases, total_deaths, population, (total_cases/population)*100 AS population_percentage
FROM PortfolioProject..CovidDeaths
-- WHERE location = 'India'
WHERE continent IS NOT NULL
ORDER BY 1,2;

-- Looking at countries with Highest Infection Count vs Population

SELECT location, MAX(total_cases) AS highest_infection_count, population, (MAX(total_cases)/population)*100 AS infection_rate
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location, population
ORDER BY infection_rate DESC;

-- Looking at countries with Highest Death Count

SELECT location, population, MAX(CAST(total_deaths AS int)) AS highest_death_count
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location, population
ORDER BY highest_death_count DESC;

-- Breaking down by Continent

SELECT continent, MAX(CAST(total_deaths AS int)) AS highest_death_count
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY highest_death_count DESC;

-- Global Numbers

SELECT date, SUM(new_cases) AS total_infections, SUM(CAST(new_deaths AS INT)) AS total_deaths
FROM PortfolioProject..CovidDeaths
WHERE continent IS NOT NULL
GROUP BY date
ORDER BY 1;

-- Looking at Vaccinations in each of the Countries

SELECT dea.continent, dea.location, dea.date, vac.new_vaccinations, vac.total_vaccinations, (CAST(vac.total_vaccinations AS BIGINT)/dea.population)*100 AS percent_vaccinated_until_date
FROM PortfolioProject..CovidDeaths AS dea
JOIN PortfolioProject..CovidVaccinations AS vac
	ON dea.location = vac.location
	AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
ORDER BY 2,3;

--SELECT location, date, new_vaccinations, total_vaccinations
--FROM PortfolioProject..CovidVaccinations
--ORDER BY 1,2;

-- Looking at Total Vaccinated until 2021-08-02 in each of the Countries with CTE

WITH PopvsVac (continent, location, date, population, new_vaccinations, rolling_people_vaccinated)
AS
(
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations, 
	SUM(CAST(vac.new_vaccinations AS INT)) OVER (PARTITION BY dea.location ORDER BY dea.location, dea.date) AS rolling_people_vaccinated 
FROM PortfolioProject..CovidDeaths AS dea
JOIN PortfolioProject..CovidVaccinations AS vac
	ON dea.location = vac.location
	AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
-- ORDER BY 2,3;
)
SELECT *, (rolling_people_vaccinated/population)*100 AS percent_vaccinated
FROM PopvsVac;