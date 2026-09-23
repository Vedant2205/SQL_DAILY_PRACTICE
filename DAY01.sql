Queries 
 
1.	List all the columns of the Salespeople table. 
-       select * from salespeople;

2.	List all customers with a rating of 100.
	select * from customers where rating =100;

3.	Find all records in the Customer table with NULL values in the city column. 
	 select * from customers where city is null;
	
4.	Find the largest order taken by each salesperson on each date.
	select s.sname,s.snum,o.date,max(o.amt) as largest_order from orders o join 	salespeople s on s.snum = o.snum group by s.num,s.name,o.odate;
 
5.	Arrange the Orders table by descending customer number. 
	select * from orders o order by o.cnum desc;

6.	Find which salespeople currently have orders in the Orders table.
	SELECT s.snum, s.sname FROM salespeople s JOIN orders o ON s.snum = o.snum;
	 
7.	List names of all customers matched with the salespeople serving them. 
 	select s.snum,s.sname,c.cname from salespeople s join customers c on s.snum = c.snum;	

8.	Find the names and numbers of all salespeople who had more than one customer. 
	select s.sname,s.snum,count(c.cnum) from salespeople s join customers c on s.snum =  	c.snum group by s.sname,s.snum having count(c.cnum)>1;

9.	Count the orders of each of the salespeople and output the results in descending  	order.
	select s.sname,s.snum ,count(onum) from salespeople s join orders o on s.snum = 	o.snum group by s.snum ,s.sname order by count(onum) desc;
	

10.	List the Customer table if and only if one or more of the customers in the Customer 	table are located in San Jose.

	select * from customers where exists (select 1 from customers c where c.city = 'San Jose');