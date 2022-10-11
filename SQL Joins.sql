/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 select P.Name AS productName, C.Name AS CategoryName 
 from products AS P
 inner join categories AS C
 on C.CategoryID =P.CategoryID
 where C.Name = "Computers";
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 select p.Name, p.Price , R.Rating from products as P
 inner join reviews as r on r.ProductID =p.ProductID
 where r.Rating =5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
select e.FirstName,e.LastName,sum(s.Quantity)As Total
from sales As S
Inner join employees As e On e.EmployeeID=s.EmployeeID
group by e.EmployeeID
order by Total Desc
limit 2;
/* joins: find the name of the department, and the name of the category for Appliances and Games */
select d.Name as 'Department Name', C.Name as 'Category Name' from departments as d
inner join categories as c on C.DepartmentID =d.DepartmentID
where c.Name ='Appliances'or c.Name ='Games';
/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
select p.Name , sum(s.Quantity) as 'Total Sold',sum(s.Quantity * s.PricePerUnit) as 'Total Price'
from products as p
Inner Join Sales as s on s.ProductID =p.ProductID
where p.ProductID =97;
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
select e.EmployeeID, e.FirstName, e.LastName, p.Name, sum(s.Quantity) as TotalSold
from Sales as s
Inner Join employees as e on e.EmployeeID =s.EmployeeID
inner join products as p on p.ProductID = s.ProductID
group by e.EmployeeID, p.ProductID
order by e.FirstName;
-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */