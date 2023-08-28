select * from CovidStat.dbo.Deaths
order by 3,4;

select * from CovidStat.dbo.Vaccinations;

select location, date, total_cases, new_cases, total_deaths, population
from CovidStat.dbo.Deaths
order by 1,2;

-- looking at total deaths vs total cases

select location, date, total_cases, total_deaths, population, (total_deaths/total_cases)*100 as 'Deathratio%'
from CovidStat.dbo.Deaths
where total_cases is not null and total_deaths is not null and location like '%state%'
order by 1,2;



-- countries with high infection rate

select location, max(total_cases), population, max((total_cases/population)*100) as 'InfectRate%'
from CovidStat.dbo.Deaths 
group by location, population
order by 'InfectRate%' desc;


-- countries with highest death count 

select location, max(cast(total_deaths as int)) as Maxtotaldeath, population, max((total_deaths/population)*100) as 'DeathRate%'
from CovidStat.dbo.Deaths 
where continent is not null
group by location, population
order by Maxtotaldeath desc;

-- new vaccinations

select dea.continent, dea.date, dea.location, dea.population, dea.new_cases,
  sum(cast(dea.new_cases as int)) over(partition by dea.location) as totalnewcases
  from CovidStat..Vaccinations as vac
  join CovidStat..deaths as dea on dea.location = vac.location
  ;

with newratio ( continent, date, location, population , new_cases, totalnewcases) as 
(
  select dea.continent, dea.date, dea.location, dea.population, dea.new_cases,
  sum(cast(dea.new_cases as bigint)) over(partition by dea.location) as totalnewcases
  from CovidStat..Vaccinations as vac
  join CovidStat..deaths as dea on dea.location = vac.location)

  select *, (totalnewcases/population)*100 as 'totalratio%'
  from newratio
  ;

