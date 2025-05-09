Use forjob;

/*Task 1: Employee Count by Department and Gender*/

Select Department, count(Department) as Total_Dept_Employees, count(case when Gender = 'Female' then 1 end)
as Female_Count, count(case when Gender = 'Male' then 1 end) as Male_Count
From Hr_dataset
Group by Department
Order by Department;

/*Task 2 Average Salary by Department*/

Select Department, Avg(Salary) as Average_Salary
From Hr_dataset
Group by Department;

/* Task 3: Top 5 Highest Paid Employees */

Select Name, Salary, Department
From HR_dataset
order by salary desc Limit 5;

/* Task 4: Employees with No Promotion in Last 3 Years */

Select Name, lastpromotiondate as Last_Promotion_Date,
Date_format(Lastpromotiondate, '%Y') as Last_Promotion_Year, 
datediff(curdate(), Lastpromotiondate) as No_Promotion_till_days, timestampdiff(Year, Lastpromotiondate, Curdate()) 
as Total_Years_without_Promotion,
timestampdiff(Month, lastpromotiondate, curdate())-(timestampdiff(year, lastpromotiondate, curdate())*12) as Months
from Hr_Dataset
WHere datediff(curdate(), Lastpromotiondate) >=1095 /* 1095 = 3*365 = (3 Years)*/
Order by Total_Years_without_Promotion desc; 

/* Task 5: Attrition Rate by Department*/

Select Department, Count(case when Attrition = 'Yes' then 1 end) as Attrition_Count
From HR_dataset
group by Department
Order by Attrition_Count desc;

/* Task 6: Trend of New Hires per Year */

Select date_format(Hiredate, '%Y') as Year, count(date_format(Hiredate, '%Y')) as Trend_Of_New_Hires
from Hr_dataset
group by date_format(Hiredate, '%Y')
order by Year desc;

/*Task 7: Performance Rating Distribution*/	

Select 
Count(Case when Performancerating = 1 then 1 end) as Rating_1,
Count(case when Performancerating = 2 then 1 end) as Rating_2,
Count(case when Performancerating = 3 then 1 end ) as Rating_3,
Count(case when Performancerating = 4 then 1 end) as Rating_4,
Count(case when Performancerating = 5 then 1 end) as Rating_5
From HR_dataset;

/* Task 8: List of Employees Eligible for Promotion
(e.g., Last promotion > 2 years ago and good performance)*/

Select Name, PerformanceRating, datediff(Curdate(), Lastpromotiondate) as Last_Promotion_In_Days
From HR_dataset
where Performancerating=5 and datediff(Curdate(), Lastpromotiondate)> 730 /*730 days = 2 years*/
order by Last_Promotion_in_Days desc;

/* Task 9: Find Department with Highest Average Salary*/

Select Department, avg(Salary) as Average_Salary
from HR_dataset
Group by Department
Order by Average_Salary desc
Limit 1;

/*Task 10: Monthly Joining Trend (based on HireDate)*/

Select date_format(Hiredate, '%M ') as Month, count(date_format(HireDate,'%M')) as Total_Join
From HR_Dataset
Group by date_format(Hiredate, '%M '), month(hiredate)
order by month(hiredate);