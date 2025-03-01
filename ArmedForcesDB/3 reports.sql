use ArmedForcesDB
go

select *
from ArmedForces af
order by af.IQLevel desc

select af.SoldierFirstName, af.SoldierLastName, af.DateOfEnlistment, af.AgeAtEnlistment
from ArmedForces af
order by af.AgeAtEnlistment desc

select 
    YearRange = '2017-2019',
    SoldierDetails = concat(af.SoldierFirstName,' ',af.SoldierLastName,' - ',af.SSN,' (',af.DateOfEnlistment,'), ',af.ServiceUnit)
from ArmedForces af
where year(af.DateOfEnlistment) between 2017 and 2019
union select 
    YearRange = '2020-2022',
    SoldierDetails = concat(af.SoldierFirstName,' ',af.SoldierLastName,' - ',af.SSN,' (',af.DateOfEnlistment,'), ',af.ServiceUnit)
from ArmedForces af
where year(af.DateOfEnlistment) between 2020 and 2022

-- SM can also be done like this:
select 
    YearRange = case when year(af.DateOfEnlistment) between 2017 and 2019 then '2017-2019' when year(af.DateOfEnlistment) between 2020 and 2022 then '2020-2022' else '' end,
    SoldierDetails = concat(af.SoldierFirstName,' ',af.SoldierLastName,' - ',af.SSN,' (',af.DateOfEnlistment,'), ',af.ServiceUnit)
from ArmedForces af
order by YearRange

select af.ServiceUnit, AvgIqLevel = avg(af.IQLevel)
from ArmedForces af
group by af.ServiceUnit