----------------------------------------------------------------------
/*TASK 1 */

----------------------------------------------------------------------
/*Drop Tables */

DROP TABLE IF EXISTS customer CASCADE;

DROP TABLE IF EXISTS orders CASCADE;

DROP TABLE IF EXISTS order_details CASCADE;

DROP TABLE IF EXISTS product CASCADE;

DROP TABLE IF EXISTS warehouse CASCADE;

DROP TABLE IF EXISTS store CASCADE;


----------------------------------------------------------------------
/*Create Tables */

CREATE TABLE customer
(customer_ID SMALLINT NOT NULL,
customer_forenames VARCHAR (25) NOT NULL,
customer_surname VARCHAR (25) NOT NULL,
customer_email VARCHAR (30) NOT NULL,
customer_houseno VARCHAR (25) NOT NULL,
customer_streetname VARCHAR (25) NOT NULL,
customer_town VARCHAR (25),
customer_city VARCHAR (25),
customer_county VARCHAR (25) NOT NULL,
customer_pcode VARCHAR (8) NOT NULL,
customer_tphone VARCHAR(12) NOT NULL,
customer_dob DATE NOT NULL,
customer_bankname VARCHAR (25),
customer_banksortno VARCHAR (6),
customer_bankaccountno VARCHAR(8),
customer_bankstreetno VARCHAR(25),
customer_bankstreet VARCHAR (25),
customer_banktown VARCHAR (25),
customer_bankcity VARCHAR (25),
customer_bankpostcode VARCHAR (25),
PRIMARY KEY(customer_ID));




CREATE TABLE orders
(order_ID SMALLINT NOT NULL,
customer_ID SMALLINT NOT NULL REFERENCES customer(customer_ID),
orderdate DATE NOT NULL,
ordertime TIME NOT NULL,
PRIMARY KEY(order_ID));




CREATE TABLE store
(store_ID SMALLINT NOT NULL,
store_name VARCHAR (25) NOT NULL,
store_streetno VARCHAR(25),
store_streetname VARCHAR (25) NOT NULL,
store_town VARCHAR (25),
store_city VARCHAR (25),
store_county VARCHAR (25),
store_pcode VARCHAR(11) NOT NULL,
store_tphone VARCHAR (12) NOT NULL,
PRIMARY KEY(store_ID));





CREATE TABLE warehouse
(warehouse_ID SMALLINT NOT NULL,
store_ID SMALLINT NOT NULL REFERENCES store(store_ID),
warehouse_town VARCHAR (25) NOT NULL,
warehouse_pcode VARCHAR (8) NOT NULL,
warehouse_tphone VARCHAR (12) NOT NULL,
PRIMARY KEY(warehouse_ID));




CREATE TABLE product 
(product_ID SMALLINT NOT NULL,
warehouse_ID SMALLINT NOT NULL REFERENCES warehouse(warehouse_ID),
product_name VARCHAR (200) NOT NULL,
product_cost DECIMAL NOT NULL,
product_type CHAR (1) NOT NULL,
product_description VARCHAR (200),
PRIMARY KEY(product_ID));




CREATE TABLE order_details
(orderdetails_ID SMALLINT NOT NULL,
order_ID SMALLINT NOT NULL REFERENCES orders(order_ID),
product_ID SMALLINT NOT NULL REFERENCES product(product_ID),
cost_to_deliver DECIMAL,
delivery_date DATE,
price_paid DECIMAL NOT NULL,
size_of_item CHAR(1) NOT NULL,
PRIMARY KEY(orderdetails_ID));


----------------------------------------------------------------------
/*Inserting Data*/

INSERT INTO customer
VALUES (001, 'Joe', 'Brown', 'jb123@gmail.com', '32', 'King Street', NULL, 'Liverpool', 'Merseyside', 'L1 0AA', '07856532345', to_date('13-JAN-1990', 'DD-MON-YYYY'), 'Halifax', '012345', '12345678', 'New House', 'Chester Street', Null,'Chester', 'CH1 1AS');

INSERT INTO customer
VALUES(002, 'Sally', 'Jenkins', 'sj2021@yahoo.com', 'Sun House', 'Old Avenue',NULL, 'Hereford', 'Herefordshire','HR1 1AH', '07569832455', to_date('07-NOV-1982', 'DD-MON-YYYY' ), 'Monzo', '987654', '98765432', '5', 'Appold Street', NULL, 'London', 'EC2A 2AG');


INSERT INTO customer
VALUES(003, 'James' ,'Edwards', 'james_1010@outlook.com', '73a', 'New Road','Bethesda', 'Bangor', 'Gwynedd','LL57 7SD', '07945632244', to_date('21-DEC-2000', 'DD-MON-YYYY' ), 'Natwest', '563748', '87564321', '135', 'Bishopsgate', NULL, 'London', 'EC2M 3UR');

INSERT INTO customer
VALUES (004, 'Alice', 'Nero', 'anero_2000@hotmaill.com', '21', 'Oak Street','Queensferry', NULL, 'Flintshire','CH5 3AE', '07853426709', to_date('30-OCT-1970', 'DD-MON-YYYY' ), 'HSBC', '983465', '18594768', '8', 'Canada Square', NULL, 'London', 'E14 5HQ');





INSERT INTO orders 
VALUES (001, 001, to_date('10-AUG-2021', 'DD-MON-YYYY'), '09:10:00');

INSERT INTO orders 
VALUES (002,002, to_date('13-AUG-2021', 'DD-MON-YYYY'), '12:25:45');

INSERT INTO orders 
VALUES (003,001, to_date('13-AUG-2021', 'DD-MON-YYYY'), '13:35:54');

INSERT INTO orders 
VALUES (004,003, to_date('14-AUG-2021', 'DD-MON-YYYY'), '15:43:54');

INSERT INTO orders 
VALUES (005,004, to_date('14-AUG-2021', 'DD-MON-YYYY'), '16:32:43');

INSERT INTO orders 
VALUES (006,002, to_date('15-AUG-2021', 'DD-MON-YYYY'), '18:12:23');





INSERT INTO store
VALUES (001, 'London Store', '10', 'Oxford Street', NULL, 'London', NULL, 'W1D 1BS', '08006712547');

INSERT INTO store
VALUES (002, 'Birmingham Store', '34', 'New Street', NULL, 'Birmingham', 'West Midlands','B1 2DH', '08006274453');




INSERT INTO warehouse
VALUES (001, 001, 'Derby', 'DE2 3FD', '08008645875');

INSERT INTO warehouse
VALUES (002, 001, 'Birmingham', 'B15 5FG', '08007628364');

INSERT INTO warehouse
VALUES (003, 002, 'Glasgow', 'G41 5GH', '080013483354' );





INSERT INTO product 
VALUES (00012, 001, 'Beginner Keyboard', 35.00, 'I', 'Basic keyboard for new players'); 

INSERT INTO product
VALUES  (00017, 002, 'Learn Jazz Guitar Book', 10.99, 'M', 'Book to jearn jazz guitar');

INSERT INTO product
VALUES (00034, 003, 'Bass Guitar Strings', 24.00, 'I', 'Bass Guitar strings');

INSERT INTO product
VALUES (00057, 001, 'How to Play Cello DVD', 20.00, 'M', 'Instructional video on how to play the Cello');

INSERT INTO product
VALUES (00453, 003, 'Squire Electric Guitar', 102.30, 'I', 'Beginneer electric guitar');

INSERT INTO product
VALUES (00567, 002, 'Electric Drum Kit', 300.00, 'I', 'Electric drum kit for professionals');

INSERT INTO product
VALUES (02345, 003, 'The Complete Works of Mozart', 50.00, 'M', 'Boxset of all the classical works of Mozart');





INSERT INTO order_details
VALUES (001, 001, 00012, 10.00,to_date('15-AUG-2021', 'DD-MON-YYYY'), 45.00, 'L');

INSERT INTO order_details
VALUES (002, 002, 00017, 0.00, to_date('15-AUG-2021', 'DD-MON-YYYY'), 10.99, 'S');

INSERT INTO order_details
VALUES (003, 003, 00034, 6.00, to_date('16-AUG-2021', 'DD-MON-YYYY'), 30.00, 'S');

INSERT INTO order_details
VALUES (004, 004, 00057, 0.00, to_date('16-AUG-2021', 'DD-MON-YYYY'), 20.00, 'S');

INSERT INTO order_details
VALUES (005, 005, 00057, 0.00, to_date('17-AUG-2021', 'DD-MON-YYYY'), 20.00, 'S');

INSERT INTO order_details
VALUES (006, 006, 00453, 10.00, to_date('17-AUG-2021', 'DD-MON-YYYY'), 112.30, 'L');



----------------------------------------------------------------------
/*Worthwile enhancements to the current system */

----------------------------------------------------------------------
/*Procedure to find the cost of the product from the order_details table */

CREATE OR REPLACE PROCEDURE cost_of_products(orderID SMALLINT)
LANGUAGE 'plpgsql' 
AS
$BODY$
DECLARE
total DECIMAL;
BEGIN
SELECT price_paid - cost_to_deliver
INTO STRICT total
FROM order_details
WHERE orderID = order_ID;
RAISE NOTICE 'The cost of the product in that order is %', total;
EXCEPTION
WHEN NO_DATA_FOUND THEN 
RAISE EXCEPTION 'That order number does not exist';
END;
$BODY$
  
/*Call with valid data*/
CALL cost_of_products(cast(001 as SMALLINT));

/*Call with invalid data*/
CALL cost_of_products(cast(100 as SMALLINT));




----------------------------------------------------------------------
/*Procedure to find the VAT of a product*/


CREATE OR REPLACE PROCEDURE product_vat(productID SMALLINT)
LANGUAGE 'plpgsql' 
AS
$BODY$
DECLARE
vat DECIMAL;
prod_name VARCHAR (200);
BEGIN
SELECT product_cost / 5, product_name
INTO STRICT vat, prod_name
FROM product
WHERE productID = product_ID;
RAISE NOTICE 'The VAT of % is £%', prod_name ,vat;
EXCEPTION
WHEN NO_DATA_FOUND THEN 
RAISE EXCEPTION 'That product does not exist';
END;
$BODY$


/*Call with valid data*/  
CALL product_vat(CAST(00034 as SMALLINT));


/*Call with invalid data*/  
CALL product_vat(CAST(00111 as SMALLINT));

----------------------------------------------------------------------
/*Procedure to find order details */

CREATE OR REPLACE PROCEDURE order_details(orderID SMALLINT)
LANGUAGE 'plpgsql' 
AS
$BODY$
DECLARE
firstname VARCHAR(25);
surname VARCHAR (25);
order_date DATE;
name_of_prod VARCHAR (200);
BEGIN
SELECT c.customer_forenames, c.customer_surname, p.product_name, o.orderdate
INTO STRICT firstname, surname, name_of_prod, order_date
FROM customer c, orders o, product p, order_details od
WHERE orderID = o.order_ID AND c.customer_ID = o.customer_ID AND o.order_ID = od.order_ID AND p.product_ID = od.product_ID;
RAISE NOTICE '% % ordered % on %', firstname, surname, name_of_prod, order_date;
EXCEPTION WHEN NO_DATA_FOUND THEN
RAISE EXCEPTION 'That order was not found';
END;
$BODY$

/*Call with valid data*/
CALL order_details(CAST(004 as SMALLINT));

/*Call with invalid data*/
CALL order_details(CAST(0015 as SMALLINT));



----------------------------------------------------------------------
/*Procedure to show daily orders */

CREATE OR REPLACE PROCEDURE show_daily_orders(order_date DATE)
LANGUAGE 'plpgsql' AS
$BODY$
DECLARE
orders_cursor CURSOR FOR SELECT * FROM orders
WHERE order_date = orderdate;
BEGIN
FOR oc in orders_cursor LOOP
RAISE NOTICE '% % % %', oc.order_ID, oc.customer_ID, oc.orderdate, oc.ordertime;
END LOOP;
END;
$BODY$

CALL show_daily_orders('15-AUG-2021');



----------------------------------------------------------------------
/*Task 1:b(I) Procedure to add customer*/

CREATE OR REPLACE PROCEDURE ADD_CUSTOMER(customer_ID SMALLINT, customer_forenames VARCHAR(25), customer_surname VARCHAR(25),
										 customer_email VARCHAR (30),customer_houseno VARCHAR (25),customer_streetname VARCHAR (25),
										customer_town VARCHAR (25),customer_city VARCHAR (25),customer_county VARCHAR (25),
										customer_pcode VARCHAR (8),customer_tphone VARCHAR(12),customer_dob DATE)
LANGUAGE 'plpgsql'
AS
$BODY$
DECLARE
BEGIN
INSERT INTO customer
VALUES  (customer_ID, customer_forenames, customer_surname, customer_email, 
		 customer_houseno, customer_streetname, customer_town, customer_city, customer_county,
		 customer_pcode, customer_tphone, customer_dob);
RAISE NOTICE '% % has been added to the database', customer_forenames, customer_surname;
END;
$BODY$
    

CALL ADD_CUSTOMER((cast(005 as smallint)), 'John', 'Evans', 'je@yahoo.co.uk', '34', 'Queen Street', NULL, 'Manchester', 'Greater Manchester', 'M2 6DF', '07845675872', to_date('12-FEB-1967', 'DD-MON-YYYY'));



----------------------------------------------------------------------
/*Task 1: b(II) Procedure to buy a product*/

CREATE OR REPLACE PROCEDURE buy_product(cust_no SMALLINT, prod_no SMALLINT)
LANGUAGE 'plpgsql'
AS
$BODY$
DECLARE 
customer_order SMALLINT;
customer_name VARCHAR(25);
product VARCHAR(200);
product_no SMALLINT;
cost_deliver DECIMAL;
price DECIMAL;
item CHAR(1);
random SMALLINT;

BEGIN
SELECT c.customer_ID, c.customer_surname, p.product_name, p.product_ID, od.cost_to_deliver, od.price_paid,od.size_of_item, (select random() * 100 + 10) 
INTO customer_order, customer_name, product, product_no, cost_deliver, price, item, random
FROM customer c, product p, orders o, order_details od
WHERE c.customer_ID = cust_no AND o.customer_ID = cust_no AND p.product_ID = prod_no;
INSERT INTO orders VALUES (random, customer_order, NOW(), NOW());
INSERT INTO order_details VALUES (random, random, product_no, cost_deliver, NULL , price, item);
RAISE NOTICE 'Customer % has been added and bought %', customer_name, product;
EXCEPTION
WHEN NO_DATA_FOUND THEN
RAISE EXCEPTION 'No data found';
END;
$BODY$

CALL buy_product(CAST(002 as SMALLINT), CAST(00453 as SMALLINT));


