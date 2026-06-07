
--- PROJECT : Exploring Customer Behavior Through Database Analysis - SQL Case Study
-----------------------------------------------------------------------------------------------------

CREATE DATABASE Customer_Behavior_Case_Study;

USE Customer_Behavior_Case_Study;

-----------------------------------------------------------------------------------------------------------------------------------------

--- A. Sales 
-------------

CREATE TABLE Sales (User_ID INT, Created_Date DATE, Product_ID INT,
						 FOREIGN KEY (Product_ID) REFERENCES Product (Product_ID),
						 FOREIGN KEY (User_ID) REFERENCES User_Name (User_ID),
						 FOREIGN KEY (User_ID) REFERENCES Users (User_ID),
						 FOREIGN KEY (User_ID) REFERENCES Goldusers_Signup (User_ID));

INSERT INTO Sales ( User_ID, Created_Date, Product_ID) VALUES
						(1, CONVERT(DATE, '19-04-2017', 105), 2),
						(3, CONVERT(DATE, '18-12-2019', 105), 1),
						(2, CONVERT(DATE, '20-07-2020', 105), 3),
						(1, CONVERT(DATE, '23-10-2019', 105), 2),
						(1, CONVERT(DATE, '19-03-2018', 105), 3),
						(3, CONVERT(DATE, '20-12-2016', 105), 2),
						(1, CONVERT(DATE, '09-11-2016', 105), 1),
						(1, CONVERT(DATE, '20-05-2016', 105), 3),
						(2, CONVERT(DATE, '24-09-2017', 105), 1),
						(1, CONVERT(DATE, '11-03-2017', 105), 2),
						(1, CONVERT(DATE, '11-03-2017', 105), 1),
						(3, CONVERT(DATE, '10-11-2016', 105), 1),
						(3, CONVERT(DATE, '07-12-2017', 105), 2),
						(3, CONVERT(DATE, '15-12-2016', 105), 2),
						(2, CONVERT(DATE, '08-11-2017', 105), 2),
						(2, CONVERT(DATE, '10-09-2018', 105), 3),
						(4, CONVERT(DATE, '01-05-2019', 105), 1),
						(5, CONVERT(DATE, '23-11-2018', 105), 3),
						(6, CONVERT(DATE, '30-06-2017', 105), 9),
						(7, CONVERT(DATE, '12-08-2018', 105), 8),
						(8, CONVERT(DATE, '19-03-2019', 105), 7),
						(9, CONVERT(DATE, '04-12-2017', 105), 6),
						(10, CONVERT(DATE, '22-09-2018', 105), 2),
						(4, CONVERT(DATE, '17-08-2020', 105), 1),
						(5, CONVERT(DATE, '12-05-2017', 105), 10),
						(6, CONVERT(DATE, '27-01-2014', 105), 11),
						(7, CONVERT(DATE, '02-04-2014', 105), 7),
						(8, CONVERT(DATE, '15-12-2020', 105), 8),
						(9, CONVERT(DATE, '08-09-2017', 105), 8);

--------------------------------------------------------------------------------------------------------------

--- B. Product 
---------------

CREATE TABLE Product (Product_ID INT PRIMARY KEY, Product_Name VARCHAR(MAX), Price INT);
						    
INSERT INTO Product (Product_ID, Product_Name, Price) VALUES
							(1, 'Dal Makani', 160),
							(2, 'Shahi Panner', 170),
							(3, 'Butter Chicken', 340),
							(4, 'Aloo Gobi', 150),
							(5, 'Chole Bhature', 100),
							(6, 'Fish Curry', 380),
							(7, 'Chicken Tikka', 300),
							(8, 'Mutton Biryani', 450),
							(9, 'Veg Pulao', 200),
							(10, 'Mango Lassi', 80),
							(11, 'Gulab Jamun', 100);


--------------------------------------------------------------------------------------------------------------

--- C. Username 
------------------

CREATE TABLE User_Name (User_ID INT PRIMARY KEY, Names VARCHAR(MAX));
								
INSERT INTO User_Name (User_ID, Names) VALUES
						(1, 'Anshul'),
						(2, 'Rohan'),
						(3, 'Shreya'),
						(4, 'Priya'),
						(5, 'Aryan'),
						(6, 'Sara'),
						(7, 'Sahil'),
						(8, 'Tanvi'),
						(9, 'Ritika'),
						(10, 'Gaurav');


--------------------------------------------------------------------------------------------------------------
								
--- D. Users 
--------------

CREATE TABLE Users (User_ID INT PRIMARY KEY, Signup_Date DATE);
			
INSERT INTO Users (User_ID, Signup_Date) VALUES
						(1, CONVERT(DATE, '02-09-2014', 105)),
						(2, CONVERT(DATE, '15-01-2015', 105)),
						(3, CONVERT(DATE, '11-04-2014', 105)),
						(4, CONVERT(DATE, '17-11-2015', 105)),
						(10, CONVERT(DATE, '02-01-2016', 105)),
						(9, CONVERT(DATE, '02-01-2016', 105)),
						(7, CONVERT(DATE, '02-04-2013', 105)),
						(8, CONVERT(DATE, '15-12-2013', 105)),
						(5, CONVERT(DATE, '08-09-2015', 105)),
						(6, CONVERT(DATE, '13-07-2014', 105));


--------------------------------------------------------------------------------------------------------------

--- C. Goldusers_Signup
---------------------------

CREATE TABLE  Goldusers_Signup (User_ID INT PRIMARY KEY, Gold_Signup_Date DATE);
						
INSERT INTO Goldusers_Signup (User_ID, Gold_Signup_Date) VALUES
									(1, CONVERT(DATE, '02-09-2014', 105)),
									(2, CONVERT(DATE, '15-01-2015', 105)),
									(3, CONVERT(DATE, '11-04-2014', 105)),
									(4, CONVERT(DATE, '17-11-2015', 105)),
									(10, CONVERT(DATE, '02-01-2016', 105)),
									(9, CONVERT(DATE, '02-01-2016', 105)),
									(7, CONVERT(DATE, '02-04-2013', 105)),
									(8, CONVERT(DATE, '15-12-2013', 105)),
									(5, CONVERT(DATE, '08-09-2015', 105)),
									(6, CONVERT(DATE, '13-07-2014', 105));	


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--- Q1. What is the total sales revenue generated by each product? 

SELECT P.Product_Name, SUM(P.Price) AS Total_Revenue FROM Sales S
JOIN Product P ON S.Product_ID = P.Product_ID
GROUP BY P.Product_Name
ORDER BY Total_Revenue DESC;

--------------------------------------------------------------------------------------------------------------

--- Q2. Which 3 product has the highest sales revenue? 

SELECT TOP 3 P.Product_Name, SUM(P.Price) AS Top_Total_Revenue FROM Sales S
JOIN Product P ON S.Product_ID = P.Product_ID
GROUP BY P.Product_Name
ORDER BY Top_Total_Revenue DESC;

--------------------------------------------------------------------------------------------------------------

--- Q3. How many users have signed up for the service and has taken the gold membership? 

SELECT COUNT(DISTINCT G.User_ID) AS Goldusers_Signed_Up FROM Goldusers_Signup G
JOIN Users U ON G.User_ID = U.User_ID

--------------------------------------------------------------------------------------------------------------

--- Q4. What is the revenue generated from gold users? 

SELECT SUM(P.Price) AS Goldusers_Revenue FROM Sales S
JOIN Goldusers_Signup G ON G.User_ID = S.User_ID
JOIN Product P ON P.Product_ID = S.Product_ID
GROUP BY G.User_ID;

 --------------------------------------------------------------------------------------------------------------

--- Q5. What is the total revenue generated from gold users? 

SELECT SUM(P.Price) AS Goldusers_Total_Revenue FROM Sales S
JOIN Goldusers_Signup G ON G.User_ID = S.User_ID
JOIN Product P ON P.Product_ID = S.Product_ID;

--------------------------------------------------------------------------------------------------------------

--- Q6. Which users has been a gold user for the How much of time?

SELECT USER_ID, Gold_Signup_Date, DATEDIFF(DAY,Gold_Signup_Date,GETDATE()) 
AS Goldusers_Time_In_Days
FROM Goldusers_Signup;

--------------------------------------------------------------------------------------------------------------

--- Q7. What is the most popular product among gold users?

SELECT TOP 1 P.Product_Name, COUNT(*) AS Popular_Product FROM Sales S
JOIN Goldusers_Signup G ON G.User_ID = S.User_ID
JOIN Product P ON P.Product_ID = S.Product_ID
GROUP BY P.Product_Name
ORDER BY Popular_Product DESC

--------------------------------------------------------------------------------------------------------------

--- Q8. What is the total sales revenue generated in each year? 

SELECT YEAR(S.Created_Date) AS Sales_Year, SUM(P.Price) AS Total_Sales_Revenue FROM Sales S
JOIN Product P ON P.Product_ID = S.Product_ID
GROUP BY YEAR(S.Created_Date)
ORDER BY Sales_Year;

--------------------------------------------------------------------------------------------------------------

--- Q9. How has the sales revenue changed over the years? 

SELECT Sales_Year, Total_Sales_Revenue, Total_Sales_Revenue - LAG(Total_Sales_Revenue) OVER (ORDER BY Sales_Year) Revenue_Change_Over_Year
FROM(
		SELECT YEAR(S.Created_Date) AS Sales_Year, SUM(P.Price) AS Total_Sales_Revenue FROM Sales S
		JOIN Product P ON P.Product_ID = S.Product_ID
		GROUP BY YEAR(S.Created_Date)
) AS Revenue_By_Year;

--------------------------------------------------------------------------------------------------------------

--- Q10. What is the average Gold-signup compare to just sign up for the users?

SELECT AVG( DATEDIFF(DAY, U.Signup_Date, G.Gold_Signup_Date)) AS AVG_Days_To_Gold_signup
FROM Goldusers_Signup G
JOIN Users U ON G.User_ID = U.User_ID;

--------------------------------------------------------------------------------------------------------------

--- Q11. How many gold members users have order how many numbers of time ? 

SELECT S.User_ID, COUNT(*) AS Total_Orders FROM Sales S
JOIN Goldusers_Signup G ON G.User_ID = S.User_ID
GROUP BY S.User_ID

--------------------------------------------------------------------------------------------------------------

--- Q12. What is the total amount each customer spend on Online Food Delivery? 

SELECT S.User_ID, SUM(P.Price) AS Total_Amount_Spend FROM Sales S
JOIN Product P ON P.Product_ID = S.Product_ID
GROUP BY S.User_ID

--------------------------------------------------------------------------------------------------------------

--- Q13. What is the frequency of customer visits to the online platform? 

SELECT USER_ID, COUNT(DISTINCT Created_Date) AS Frequency_By_Visited_Date FROM Sales
GROUP BY USER_ID

--------------------------------------------------------------------------------------------------------------

--- Q14. What was the first order purchase by each customer ?

SELECT S.User_ID, S.Created_Date AS First_Order_Date, P.Product_Name FROM Sales S
JOIN Product P ON P.Product_ID = S.Product_ID
WHERE S.Created_Date = ( SELECT MIN(S2.Created_Date) FROM Sales S2 WHERE S2.User_ID = S.User_ID);

--------------------------------------------------------------------------------------------------------------

--- Q15. What is the most purchase item on the menu and how many times was it purchased by all customers? 

SELECT TOP (1)  P.Product_Name, COUNT(*) AS Most_Purchase FROM Sales S
JOIN Product P ON P.Product_ID = S.Product_ID
GROUP BY P.Product_Name
ORDER By Most_Purchase DESC;

--------------------------------------------------------------------------------------------------------------

--- Q16. Which item was most popular for each customer ?

SELECT  S.User_ID, 
			P.Product_Name, 
			COUNT(*) AS Most_Popular_Item 
FROM Sales S
JOIN Product P ON P.Product_ID = S.Product_ID
GROUP BY S.User_ID, P.Product_Name
HAVING COUNT(*) = (
    SELECT TOP 1 COUNT(*)
    FROM Sales S2
    WHERE S2.User_ID = S.User_ID
    GROUP BY S2.product_id
    ORDER BY COUNT(*) DESC
);

--------------------------------------------------------------------------------------------------------------

--- Q17. Which item was purchase first by the customer after they become a member ?

SELECT S.User_ID, 
		 S.Created_Date AS First_Item_Purchase, 
		 P.Product_Name FROM Sales S
JOIN Goldusers_Signup G ON G.User_ID = S.User_ID
JOIN Product P ON P.Product_ID = S.Product_ID
WHERE S.Created_Date = ( SELECT MIN(S2.Created_Date) 
								FROM Sales S2 
								WHERE S2.User_ID = S.User_ID AND 
										 S2.Created_Date = G.Gold_Signup_Date);

--------------------------------------------------------------------------------------------------------------

--- Q18.Which item was purchase before the customer become a member ?

SELECT 
    S.User_ID,
    S.created_date AS first_order_before_gold,
    P.product_name
FROM Sales S
JOIN Product P ON S.product_id = P.product_id
JOIN GoldUsers_Signup G ON S.User_ID = G.User_ID
WHERE S.created_date = (SELECT MAX(S2.created_date)
                              FROM Sales S2
                              WHERE S2.User_ID = S.User_ID
                              AND S2.created_date < G.gold_signup_date);

--------------------------------------------------------------------------------------------------------------

--- Q19. What is the total orders and amount spent for each member before they become a member ? 

SELECT 
    G.User_ID,
    COUNT(S.User_ID) AS Total_Orders_Before_Gold,
    SUM(P.price) AS Total_Amount_Before_Gold
FROM GoldUsers_Signup G
JOIN Sales S ON G.User_ID = S.User_ID
JOIN Product P ON S.Product_ID = P.Product_ID
WHERE S.Created_Date < G.Gold_Signup_Date
GROUP BY G.User_ID;

--------------------------------------------------------------------------------------------------------------

--- Q20. Rank all the transactions for each member whenever they are a XYZ gold member for every non gold member Transaction marks as na ?

SELECT 
    S.User_ID,
    S.User_ID,
    S.Created_Date,
    P.Product_Name,
    CASE 
        WHEN S.Created_Date >= G.Gold_Signup_Date THEN 
            CAST(ROW_NUMBER() OVER (
                PARTITION BY S.User_ID 
                ORDER BY S.Created_Date
            ) AS VARCHAR)
        ELSE 'NA'
    END AS Gold_Transaction_Rank
FROM Sales S
JOIN Product P ON S.Product_ID = P.Product_ID
LEFT JOIN GoldUsers_Signup G ON S.User_ID = G.User_ID;

-------------------------------------------------------------END-------------------------------------------------------------------------------------------------------------------------------------------------------------























