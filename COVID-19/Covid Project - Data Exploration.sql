/* These queries are for Tableau Project #1 Data Exploration
*/

SELECT *
FROM PortfolioProjects..Covid19

--1
Select SUM(new_cases) as total_Cases, SUM(CAST(new_deaths as int)) as total_deaths, SUM(CAST(new_deaths as int))/SUM(new_cases)*100 as DeathPercentage, SUM(CAST(people_fully_vaccinated as bigint)) as Fully_Vaccinated 
From PortfolioProjects..Covid19
Where continent is not null
Order by 1, 2

--2
Select location, SUM(CAST(new_deaths as int)) as TotalDeathCount, SUM(CAST(total_cases as bigint)) as TotalCases 
From PortfolioProjects..Covid19
Where continent is null
and location not in ('World', 'European', 'International', 'Upper middle income', 'High Income', 'Lower middle income', 'low income', 'European Union')
Group by location
Order by TotalDeathCount desc

--3
Select location, population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as PercentPopulationInfection
From PortfolioProjects..Covid19
where location not in ('World', 'European', 'International', 'Upper middle income', 'High Income', 'Lower middle income', 'low income', 'European Union')
Group By location, population
Order by PercentPopulationInfection desc

--4
Select location,population,date, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as PercentPopulationInfected
From PortfolioProjects..Covid19
where location not in ('World', 'European', 'International', 'Upper middle income', 'High Income', 'Lower middle income', 'low income', 'European Union')
Group By location, population, date
Order by location

----5
Select continent, location, population, MAX(CAST(people_fully_vaccinated as bigint)) as TotalVaccination, MAX((CAST(people_fully_vaccinated as bigint))/population)*100 as PercentPopulationVaccination
from PortfolioProjects..Covid19
Where continent is not null
Group by continent, location, population
order by 3 Desc

--6
Select location, date, population, MAX((CAST(people_fully_vaccinated as bigint))/population)*100 as PercentFullyVaccination, MAX((CAST(people_vaccinated as bigint))/population)*100 as PercentOneDose, MAX((CAST(total_boosters as bigint))/population)*100 as BoosterShot
From PortfolioProjects..Covid19
where continent is not null
group by location, date, population
order by 1,2,3




