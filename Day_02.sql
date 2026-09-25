1. Match salespeople to customers according to what city they lived in.

SELECT s.sname, c.cname, s.city FROM salespeople s JOIN customers c ON s.city = c.city;


2. Find the largest order taken by each salesperson.


SELECT s.sname, s.snum, MAX(o.amt) AS largest_order FROM salespeople s JOIN orders o ON s.snum = o.snum GROUP BY s.sname, s.snum;


3. Find customers in San Jose who have a rating above 200.


SELECT c.cname, c.city, c.rating FROM customers c WHERE c.city = 'San Jose' AND c.rating > 200;


4. List the names and commissions of all salespeople in London.


SELECT s.sname, s.comm FROM salespeople s WHERE s.city = 'London';


5. List all the orders of salesperson Motika from the Orders table.


SELECT o.* FROM orders o JOIN salespeople s ON o.snum = s.snum WHERE s.sname = 'Motika';


6. Find all customers with orders on October 3.


SELECT * FROM customers WHERE cnum IN (SELECT o.cnum FROM orders o WHERE o.odate = '1996-10-03');


7. Give the sums of the amounts from the Orders table, grouped by date, eliminating all those dates where the SUM was not at least 2000.00 above the MAX amount.


SELECT o.odate, SUM(o.amt) AS total_amount FROM orders o GROUP BY o.odate HAVING SUM(o.amt) >= MAX(o.amt) + 2000;


8. Select all orders that had amounts that were greater than at least one of the orders from October 6.


SELECT * FROM orders o WHERE o.amt > ANY (SELECT o2.amt FROM orders o2 WHERE o2.odate = '1996-10-06');


9. Write a query that uses the EXISTS operator to extract all salespeople who have customers with a rating of 300.

SELECT s.* FROM salespeople s WHERE EXISTS (SELECT 1 FROM customers c WHERE c.snum = s.snum AND c.rating = 300);


10. Find all pairs of customers having the same rating.

SELECT c1.cname AS customer1, c2.cname AS customer2, c1.rating FROM customers c1 JOIN customers c2 ON c1.rating = c2.rating AND c1.cnum < c2.cnum;


11. Find all customers whose CNUM is 1000 above the SNUM of Serres.

SELECT c.* FROM customers c WHERE c.cnum = 1000 + (SELECT s.snum FROM salespeople s WHERE s.sname = 'Serres');

