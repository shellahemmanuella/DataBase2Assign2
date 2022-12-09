CREATE DATABASE Ecommerce_GroceryDb;

CREATE TABLE grocery_stores(
	G_no int not null primary key,
	G_name varchar(255) not null unique,
	G_location varchar(255) not null,
	G_email varchar(255) not null unique,
	G_contact varchar(255) not null unique
	
);



CREATE TABLE grocery_employees(
	Employee_id varchar(5) not null primary key,
	Employee_name varchar(255) not null,
	Job_title varchar(255) not null,
	Employee_email varchar(255) not null,
	Employee_contact varchar(255) not null,
	G_no int not null,
	foreign key(G_no) references grocery_stores(G_no)

);

CREATE TABLE grocery_vendors(
	Vendor_no int not null primary key,
	Vendor_name varchar(255) not null,
	Vendor_email varchar(255) not null,
	Vendor_contact varchar(255) not null,
	Vendor_address varchar(255) not null,
	G_no int not null,
	foreign key(G_no) references grocery_stores(G_no)
	
);

CREATE TABLE buyers(
	Buyer_id int not null primary key,
	Buyer_name varchar(255) not null,
	Buyer_email varchar(255) not null unique,
	Buyer_contact varchar(255) not null,
	Buyer_address varchar(255) not null,
	Buyer_password varchar(10) not null

);

CREATE TABLE users(
	User_id int not null primary key,
	User_name varchar(255) not null,
	User_type varchar(255) not null
);

CREATE TABLE categories(
	Category_id int not null primary key,
	Category_name varchar(255) not null,
	Category_type varchar(255) not null,
	Category_quantity varchar(255) not null,
	Category_description varchar(255) null,
	Category_status varchar(255) not null,
	Vendor_no int not null,
	foreign key(Vendor_no) references grocery_vendors(Vendor_no)
	
);

CREATE TABLE products(
	Product_id int not null primary key,
	Product_name varchar(255) not null,
	Product_price decimal not null,
	Product_quantity varchar(255) null,
	Product_description varchar(255) null,
	Postedby varchar(255) null,
	Recipe_detail varchar(255) null,
	Vendor_no int not null,
	foreign key(Vendor_no) references grocery_vendors(Vendor_no),
	Category_id int not null,
	foreign key(Category_id) references categories(Category_id),
	Employee_id varchar(5) not null,
	foreign key (Employee_id) references grocery_employees(Employee_id)

);


CREATE TABLE wishlists(
	
	Product_id int not null,
	foreign key(Product_id) references products(Product_id),
	Category_id int not null,
	foreign key(Category_id) references categories(Category_id),
	Buyer_id int not null,
	foreign key(Buyer_id) references Buyers(Buyer_id),
	name_of_the_product varchar(255) not null,
	like_status varchar(255) not null,
	view_status varchar(255) not null,
	rating_number int not null
);

CREATE TABLE orders(
	Order_id int not null primary key,
	Product_id int not null,
	foreign key(Product_id) references products(Product_id),
	Category_id int not null,
	foreign key(Category_id) references categories(Category_id),
	Buyer_id int not null,
	foreign key(Buyer_id) references buyers(Buyer_id),	
	Quantity varchar(255) not null,
	Total_Price decimal not null,
	Order_date date not null,
	Order_status varchar(255) not null
	
);


CREATE TABLE payments(
	Payment_id int not null primary key,
	Category_id int not null,
	foreign key(Category_id) references categories(Category_id),
	Product_id int not null,
	foreign key(Product_id) references products(Product_id),	
	Order_id int not null,
	foreign key(Order_id) references orders(Order_id),
	Buyer_id int not null,
	foreign key(Buyer_id) references buyers(Buyer_id),
	Amount_paid decimal not null,
	Pay_date date not null,
	Pay_status varchar(255) not null
);

CREATE TABLE transaction_reports(
	TransReport_id int not null primary key,
	Employee_id varchar(5) not null,
	foreign key (Employee_id) references grocery_employees(Employee_id),
	Order_id int not null,
	foreign key(Order_id) references orders(Order_id),
	Category_id int not null,
	foreign key(Category_id) references categories(Category_id),
	Product_id int not null,
	foreign key(Product_id) references products(Product_id),
	Payment_id int not null,
	foreign key (Payment_id) references payments(Payment_id),
	Transaction_status varchar(255) not null
	
);

CREATE TABLE deliveries(
	Delivery_id int not null primary key,
	Delivery_personName varchar(255) not null,
	Delivery_personContact varchar(255) not null,
	Buyer_id int not null,
	foreign key(Buyer_id) references buyers(Buyer_id),
	Order_id int not null,
	foreign key(Order_id) references orders(Order_id),
	Category_id int not null,
	foreign key(Category_id) references categories(Category_id),
	Product_id int not null,
	foreign key(Product_id) references products(Product_id),
	Payment_id int not null,
	foreign key (Payment_id) references payments(Payment_id),
	Delivery_date date not null
	
);

INSERT INTO grocery_stores (G_no, G_name,G_location,G_email, G_contact)
VALUES (01, 'Jude Emmerson Grocery Shop', 'Ntinda-Kiwaatule Road', 'jegs@gmail.com', '+256-705161711');


INSERT INTO grocery_employees(
	Employee_id ,
	Employee_name ,
	Job_title ,
	Employee_email ,
	Employee_contact ,
	G_no )
VALUES (
	'a0001','Emmanuella','Administrator','shellah@jegs.org','+256-703291678',01
);

INSERT INTO grocery_vendors(
	Vendor_no ,
	Vendor_name ,
	Vendor_email ,
	Vendor_contact ,
	Vendor_address ,
	G_no )
VALUES (
	001,'Michie','michie@gmail.com','+255-7908765','Nairobi',01
);

INSERT INTO buyers(
	Buyer_id ,
	Buyer_name ,
	Buyer_email,
	Buyer_contact ,
	Buyer_address ,
	Buyer_password
)
VALUES (201,'Jerrimiah','jer1@yahoo.com','+91-34567832','Bukoto','*********');

INSERT INTO users(
	User_id ,
	User_name ,
	User_type

)

VALUES(
	900,'Emmanuella','Admin'

),
(
	901,'Michie','Vendor'
),
(
	902,'Jerrimiah','Buyer'
)

;


INSERT INTO categories(
	Category_id ,
	Category_name ,
	Category_type ,
	Category_quantity ,
	Category_description ,
	Category_status ,
	Vendor_no )
VALUES(
	300,'Meat','Beef','1000 tonnes','the best quality','available',001

);

INSERT INTO 
	products(
	Product_id ,
	Product_name ,
	Product_price ,
	Product_quantity ,
	Product_description ,
	Postedby ,
	Recipe_detail ,
	Vendor_no ,
	Category_id ,	
	Employee_id 
)

VALUES(
	00001,'The Best Goatsmeat','$9.0','500g','half-kilogramme pack','Michie','from exotic breed goats',001,300,'a0001'
);


INSERT INTO 
	products(
	Product_id ,
	Product_name ,
	Product_price ,
	Product_quantity ,
	Product_description ,
	Postedby ,
	Recipe_detail ,
	Vendor_no ,
	Category_id ,	
	Employee_id 
)

VALUES(
	00002,'The Best Beef','$10.0','500g','half-kilogramme pack','Emmanuella','from exotic breed cattle',001,300,'a0001'
);


INSERT INTO wishlists(
	
	Product_id,
	Category_id ,
	Buyer_id ,	
	name_of_the_product ,
	like_status ,
	view_status ,
	rating_number)

VALUES (
	00001,300,201,'The Best Meat','liked','viewed',5
);

INSERT INTO orders(
	Order_id ,
	Product_id ,
	Category_id ,
	Buyer_id ,
	Quantity ,
	Total_Price ,
	Order_date ,
	Order_status)

VALUES (
	501,00001,300,201,'500kg','$4500.0','2022-11-13','confirmed'
);

INSERT INTO  payments(
	Payment_id ,
	Category_id ,
	Product_id ,	
	Order_id ,
	Buyer_id ,
	Amount_paid ,
	Pay_date ,
	Pay_status)
VALUES(
	601,300,00001,501,201,'$4500','2022-11-15','paid'
);

INSERT INTO transaction_reports(
	TransReport_id ,
	Employee_id ,
	Order_id ,
	Category_id ,
	Product_id ,
	Payment_id,
	Transaction_status)

VALUES(
	700,'a0001',501,300,00001,601,'approved'
);

INSERT INTO deliveries(
	Delivery_id ,
	Delivery_personName ,
	Delivery_personContact ,
	Buyer_id ,
	Order_id ,
	Category_id ,
	Product_id, 
	Payment_id,
	Delivery_date)

VALUES(
	10001,'Mikeyson','+256-723344923',201,501,300,00001,601,'2022-11-15'
);

SELECT * FROM orders;

SELECT * FROM products 
WHERE Postedby ='Emmanuella';

SELECT * FROM products
WHERE Postedby = 'Michie';

SELECT * FROM users;

SELECT * FROM users
WHERE User_type='Vendor';

SELECT * FROM users
WHERE User_type='Admin' AND User_type='Buyer';











 



















