select * from hr1;
select * from hr2;

-- Total employee
select count(employeeid) from hr2;

--  Average age of emp
select avg(age) from hr1;
select concat(round(avg(age)),'Y')as avg_year from hr1;

-- maximum people eduction 
select max(educationfield) from hr1;

-- maximum people working department
select max(department) from hr1;

-- maximum people gendar
select max(gender) from hr1;

-- Average monthly salary
select avg(monthlyincome) from hr2;


-- total monthly income of all emp
select concat(round(sum(monthlyincome) / 100000000,0), 'B') as total_income from hr2;


-- 1 Average Attrition rate for all Departments
select concat(round(count(case when attrition = "Yes" then 1 end) *100/count(*),2),"%") as Attrition_Rate, department from hr1  
group by department
order by attrition_rate desc;
 
-- 2 Average Hourly rate of Male Research Scientist
select round(avg(hourlyrate)) as avg_hourly_rate,gender,jobrole from hr1
where gender='male' and jobrole='research scientist';


-- 3 Attrition rate Vs Monthly income stats
select concat(round(count(case when Attrition = "Yes" then 1 end)*100/count(*),2),"%") as Attrition_Rate , 
       count(case when Attrition = "Yes" then 1 end) as Attrition 
       from hr1 inner join hr2
on (hr2.employeeid=hr1.employeenumber)
group by case
       when monthlyincome between 1000 and 15000 then "1K-15K"
       when monthlyincome between 15001 and 30000 then "15k-30k"
       when monthlyincome between 30001 and 51000 then "30k- 51k"
       end; 


-- 4 Average working years for each Department

 select concat(round(avg(totalworkingyears)),'Y') as avg_working_year,department from hr2 inner join hr1 
on (hr2.employeeid=hr1.employeenumber)
group by department ;

-- 5 Job Role Vs Work life balance
select round(avg(worklifebalance),2) as avg_work_life_balance,jobrole from  hr2 inner join hr1 
on (hr2.employeeid=hr1.employeenumber)
group by jobrole
order by avg_work_life_balance;



-- 6 Attrition rate Vs Year since last promotion relation

select case
        when YearsSinceLastPromotion between 0 AND 4 then '0-4 Years'
        when YearsSinceLastPromotion  between 5 AND 9 then '5-9 Years'
        when YearsSinceLastPromotion > 9 then '10 Years'
        else '10+year' end as promotion_relation,
    concat(round(COUNT(CASE WHEN Attrition = 'Yes' THEN 1 END) * 100.0 / COUNT(*),2),"%") AS Attrition_Rate
FROM hr1 inner join hr2
on (hr2.employeeid=hr1.employeenumber)
group by 
    case 
        when YearsSinceLastPromotion between 0 AND 4 then '0-4 Years'
        when YearsSinceLastPromotion  between 5 AND 9 then '5-9 Years'
        when YearsSinceLastPromotion > 9 then '10 Years'
        else '10+year'
    end;




















