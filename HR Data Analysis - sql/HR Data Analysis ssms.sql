select * from Dept_Info
select * from Emp_Info

-- Joined Tables
select *
from Dept_Info as d
inner join Emp_Info as e
on d.Dept_Id=e.Dept_Id

-- Distinct employees
select distinct Emp_Id
from Emp_Info

-- Employees in more than 1 Department
select distinct Emp_Id, First_name, Last_name, count(Emp_Id) as Departments
from Emp_Info
group by Emp_Id, First_name, Last_name
having count(Emp_Id)>1

-- Average Tenure of employees who left
select avg(DATEDIFF(year, DoJ, Last_date)) as Avg_Tenure
from Emp_Info

-- Employees having Performance issues (C or PIP with salary > 80,000)
select distinct Emp_Id, First_name, Last_name
from Emp_Info
where Last_performance_rating in ('C','PIP') and Salary > 80000

-- Total employees associated with the firm
select count(Emp_Id) as Emp_count
from Emp_Info

-- Total employees who left
select count(Emp_Id) as Emp_count
from Emp_Info
where [Left] = 1

-- Total employees who are currently in the firm
select count(Emp_Id) as Emp_count
from Emp_Info
where [Left] = 0

-- Total Employees in leadership roles
select count(Emp_Id) as Emp_count
from Emp_Info
where Title like '%leader%'

-- Top performers (S or A)
select distinct Emp_Id, First_name, Last_name
from Emp_Info
where Last_performance_rating in ('S','A')

-- Salaries of best Performing Employees
select Emp_Id, First_name, Last_name, Last_performance_rating, Salary
from Emp_Info
where Last_performance_rating = 'S'
order by Salary

-- Salaries of Employees with rating 'S' or 'A'
select Emp_Id, First_name, Last_name, Last_performance_rating, Salary
from Emp_Info
where Last_performance_rating in ('S','A')
order by Salary

-- Top performers per Derpartment
select Dep_Name, count(Emp_Id) as Emp_count
from Dept_Info as d
inner join Emp_Info as e
on d.Dept_Id=e.Dept_Id
where Last_performance_rating in ('S','A')
group by Dep_Name
order by Emp_count desc

-- Average Salary by Department
select Dep_Name, avg(Salary) as Avg_salary
from Dept_Info as d
inner join Emp_Info as e
on d.Dept_Id=e.Dept_Id
group by Dep_Name
order by Avg_salary desc

-- Employees joined each year
select YEAR(doj) as Years, count(Emp_Id) as Emp_count
from Emp_Info
group by YEAR(doj)

-- Departments that saw most hiring in the past 2 years
select Dep_Name, count(Emp_Id) as Emp_joined
from Dept_Info as d
inner join Emp_Info as e
on d.Dept_Id=e.Dept_Id
where YEAR(DoJ) in (select distinct top 2 year(doj) as years
					from Emp_Info
					order by years desc)
group by Dep_Name
order by Emp_joined desc

-- Total Male employees
select count(Emp_Id) as Emp_count
from Emp_Info
where Gender = 'M'

-- Total Female employees
select count(Emp_Id) as Emp_count
from Emp_Info
where Gender = 'F'

-- Total Employees in Each Performance rating
select Last_performance_rating, Rating, count(Emp_Id) as Emp_count
from Emp_Info
group by Last_performance_rating, Rating

-- Salaries of employees who left
select Emp_Id, First_name, Last_name, Last_performance_rating, Salary
from Emp_Info
where [Left] = 1
order by Salary

-- Top 10 Highest earning employees
select distinct top 10 Emp_Id, First_name, Last_name, Salary
from Emp_Info
order by Salary desc


select *
from Emp_Info
where [Left] = 1