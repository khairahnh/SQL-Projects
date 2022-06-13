/* These queries are for Tableau Project
*/

--1

Select SUM(new_cases) as total_Cases, SUM(CAST(new_deaths as int)) as total_deaths, SUM(CAST(new_deaths as int))/SUM(new_cases)*100 as DeathPercentage
From PortfolioProjects..CovidDeaths
Where continent is not null
Order by 1, 2

--2
Select location, SUM(CAST(new_deaths as int)) as TotalDeathCount
From PortfolioProjects..CovidDeaths
Where continent is null
and location not in ('World', 'European', 'International', 'Upper middle income', 'High Income', 'Lower middle income', 'low income', 'European Union')
Group by location
Order by TotalDeathCount desc

--3

Select location, population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as PercentPopulationInfection
From PortfolioProjects..CovidDeaths
Group By location, population
Order by PercentPopulationInfection desc

--4

Select location,population,date, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as PercentPopulationInfected
From PortfolioProjects..CovidDeaths
Group By location, population, date
Order by PercentPopulationInfected desc

--5
Select dea.continent, dea.location, dea.date, dea.population
, MAX(vac.total_vaccinations) as RollingPeopleVaccinated
From PortfolioProjects..CovidDeaths dea
Join PortfolioProjects..CovidVaccinations vac
		On dea.location = vac.location
		and dea.date = vac.date
where dea.continent is not null
group by dea.continent, dea.location, dea.date, dea.population
order by 1,2,3

--6
Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(new_cases)*100 as DeathPercentage
From PortfolioProjects..CovidDeaths
Where continent is not null
Order by 1, 2

--7

Select location, date, total_cases, total_deaths
from PortfolioProjects..CovidDeaths
where location in ('Malaysia', 'Singapore', '%Indonesia', 'Phillipines', 'Thailand', 'Brunei', 'Vietnam', 'Laos', 'Myanmar')
order by 1,2

