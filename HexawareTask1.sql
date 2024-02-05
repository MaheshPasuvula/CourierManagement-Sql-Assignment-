create database Assignment;
DROP DATABASE ASSIGNMENT

Create Table UserDetails(
  UserID int identity(1,1) Primary key,
  Name varchar(255) not null,
  Email varchar(255) Unique not null,
  Password varchar(255),
  ContactNumber varchar(10),
  Address Text
  );
  insert into UserDetails(Name,Email,Password,ContactNumber,Address) values('Mahesh','maheshnlvp@gmail.com','Mahesh@978','9390011724','Hyderabad');
    insert into UserDetails(Name,Email,Password,ContactNumber,Address) values('Umesh','umeeshnlvp@gmail.com','Umesh@978','9395511724','Hyderabad');
      insert into UserDetails(Name,Email,Password,ContactNumber,Address) values('Suresh','sureshnlvp@gmail.com','Suresh@978','9123411724','Kolkata');
    insert into UserDetails(Name,Email,Password,ContactNumber,Address) values('Ganesh','ganeshnlvp@gmail.com','Ganesh@978','9395511123','Vijayawada');
    insert into UserDetails(Name,Email,Password,ContactNumber,Address) values('Govind','govindnlvp@gmail.com','Govind@978','9395012724','Amaravati');
    insert into UserDetails(Name,Email,Password,ContactNumber,Address) values('John','johnlvp@gmail.com','John@978','9392211724','Banglore');
    insert into UserDetails(Name,Email,Password,ContactNumber,Address) values('Uday','udaynlvp@gmail.com','Uday@978','9395511324','Srikakulum');
    insert into UserDetails(Name,Email,Password,ContactNumber,Address) values('Jagadeesh','jagadeeshnlvp@gmail.com','Jagadeesh@978','9395511742','Mysore');
    insert into UserDetails(Name,Email,Password,ContactNumber,Address) values('Amar','amarnlvp@gmail.com','Amar@978','9334511724','Hyderabad');
    insert into UserDetails(Name,Email,Password,ContactNumber,Address) values('Srikanth','srikanthnlvp@gmail.com','Srikanth@978','9395545724','Mahabubnagar');
    insert into UserDetails(Name,Email,Password,ContactNumber,Address) values('Surya','suryanlvp@gmail.com','Sutya@978','9395511234','Rangareddy');

   select * from UserDetails;

Create Table CourierServices
(
 ServiceID int Primary Key,
 ServiceName varchar(100),
 Cost decimal(8,2)
 );

insert into CourierServices values (1, 'Standard', 10.99)
 insert into CourierServices values (2, 'Express', 25.99)
 insert into CourierServices values (3, 'Next Day', 35.50)
insert into CourierServices values  (4, 'International', 50.00)
 insert into CourierServices values (5, 'Economy', 15.99)
 insert into CourierServices values  (6, 'Priority', 30.99)
 insert into CourierServices values  (7, 'Same Day', 45.00)
 insert into CourierServices values  (8, 'Two-Day', 20.50)
  insert into CourierServices values (9, 'Overnight', 40.00)
 insert into CourierServices values  (10, 'Ground', 18.75);

 select * from CourierServices;

Create Table Employee
(
EmployeeID int Primary Key,
Name varchar(255),
Email varchar(255) unique,
ContactNumber varchar(20),
Role varchar(50),
Salary decimal(10,2)
);

insert into Employee values (1,'Alice','alice@gmail.com','9879067854','Manager',50000);
insert into Employee values (2,'John','john@gmail.com','9879061254','Dispatcher',40000);
insert into Employee values (3,'Jagadeesh','jagadeesh@gmail.com','9879067834','Warehouse staff',20000);
insert into Employee values (4,'Johnwesly','johnwesly@gmail.com','9249067854','Dispatcher',35000);
insert into Employee values (5,'Vasudev','vasudev@gmail.com','9862067854','Manager',60000);
insert into Employee values (6,'Giridhar','giridhar@gmail.com','9871567854','Driver',30000);
insert into Employee values (7,'Johnsena','johnsena@gmail.com','9823067854','Deliveryboy',25000);
insert into Employee values (8,'Naresh','naresh@gmail.com','9874567854','Deliveryboy',25000);
insert into Employee values (9,'Harish','harish@gmail.com','9479067854','Dispatcher',40000);
insert into Employee values (10,'vijay','vijay@gmail.com','9835167854','Driver',30000);
insert into Employee values (11,'mark johnson','mark@gmail.com','9835237854','Driver',30000);
select * from Employee;


Create Table Courier
(
 CourierID int identity(1000,1) Primary Key,
 SenderID int Not null,--added SenderID column to maintain relation with UserDetailstable
 SenderName varchar(255) Not null,
 SenderAddress Text,
 ReceiverName varchar(255),
 ReceiverAddress Text,
 ServiceID int ,--added serviceID column to maintain relation with Customerservice table
 Weight decimal(5,2),
 Status varchar(50),
 TrackingNumber varchar(20) unique not null,
 DeliveryDate Date,
 DeliveredEmployeeID int,--added EmployeeID column to maintain relation with Employeetable
 Foreign Key(DeliveredEmployeeID) References Employee(EmployeeID) on delete cascade on update cascade,
 Foreign Key(ServiceID) References CourierServices(ServiceID) on delete cascade on update cascade,
 Foreign Key(SenderID) References UserDetails(UserID) on delete cascade on update cascade
 );

 insert into Courier(SenderID,SenderName,SenderAddress,ReceiverName,ReceiverAddress,ServiceID,Weight,Status,TrackingNumber,DeliveryDate, DeliveredEmployeeID) values 
     (1,'Mahesh','Hyderabad','Umesh','Hyderabad',2,500,'delivered','23456','2022/01/23',7);
 insert into Courier(SenderID,SenderName,SenderAddress,ReceiverName,ReceiverAddress,ServiceID,Weight,Status,TrackingNumber,DeliveryDate, DeliveredEmployeeID) values 
     (2,'Umesh','Hyderabad','Ganesh','Vijayawada',2,375,'Processing','23457','2024/02/23',NULL);
 insert into Courier(SenderID,SenderName,SenderAddress,ReceiverName,ReceiverAddress,ServiceID,Weight,Status,TrackingNumber,DeliveryDate, DeliveredEmployeeID) values 
     (1,'Mahesh','Hyderabad','Ganesh','Vijayawada',1,700,'delivered','23458','2023/01/23',8);
 insert into Courier(SenderID,SenderName,SenderAddress,ReceiverName,ReceiverAddress,ServiceID,Weight,Status,TrackingNumber,DeliveryDate, DeliveredEmployeeID) values 
     (3,'Suresh','Kolkata','Govind','Amaravati',3,567.78,'delivered','23459','2022/03/23',8);
 insert into Courier(SenderID,SenderName,SenderAddress,ReceiverName,ReceiverAddress,ServiceID,Weight,Status,TrackingNumber,DeliveryDate, DeliveredEmployeeID) values 
     (6,'John','Bangalore','Ganesh','Vijayawada',5,555.79,'cancelled','23460',NULL,NULL);
 insert into Courier(SenderID,SenderName,SenderAddress,ReceiverName,ReceiverAddress,ServiceID,Weight,Status,TrackingNumber,DeliveryDate, DeliveredEmployeeID) values 
     (10,'Srikanth','Mahabubnagar','Surya','Rangareddy',5,123.43,'delivered','23461','2021/04/13',7);
 insert into Courier(SenderID,SenderName,SenderAddress,ReceiverName,ReceiverAddress,ServiceID,Weight,Status,TrackingNumber,DeliveryDate, DeliveredEmployeeID) values 
     (9,'Amar','Hyderabad','Jagadeesh','Mysore',7,412.36,'Cancelled','23462',NULL,NULL);
 insert into Courier(SenderID,SenderName,SenderAddress,ReceiverName,ReceiverAddress,ServiceID,Weight,Status,TrackingNumber,DeliveryDate, DeliveredEmployeeID) values 
     (10,'Srikanth','Mahabubnagar','Jagadeesh','Mysore',9,372.34,'Processing','23463','2024/02/23',NULL);
 insert into Courier(SenderID,SenderName,SenderAddress,ReceiverName,ReceiverAddress,ServiceID,Weight,Status,TrackingNumber,DeliveryDate, DeliveredEmployeeID) values 
     (1,'Mahesh','Hyderabad','Umesh','Hyderabad',9,500,'Cancelled','23464',NULL,NULL);
 insert into Courier(SenderID,SenderName,SenderAddress,ReceiverName,ReceiverAddress,ServiceID,Weight,Status,TrackingNumber,DeliveryDate, DeliveredEmployeeID) values 
     (6,'John','Bangalore','Umesh','Hyderabad',10,500,'Processing','23465','2024/04/23',NULL);
 
 select * from Employee;
 select * from Courier;




Create Table Location 
(
 LocationID int Primary Key,
 LocationName varchar(100),
 Address Text
 );

 insert into Location values(1,'Hyderabad','h.no:3-60,street:Kukatpally');
  insert into Location values(2,'Vijayawada','h.no:4-60,street:Gandhinagar');
   insert into Location values(3,'Mahabubnagar','h.no:7-40,street:Jawaharlalcolony');
 insert into Location values(4,'Khammam','h.no:6-40,street:Siidiqnagar');
 insert into Location values(5,'Wanaparthy','h.no:7-60,street:Gandhichowk');
 insert into Location values(6,'Hyderabad','h.no:3-60,street:Tolicheq');
 insert into Location values(7,'Hyderabad','h.no:8-32,street:Gachibowli');
 insert into Location values(8,'Mahabubnagar','h.no:4-20,street:Gandhinagar');
 insert into Location values(9,'Khammam','h.no:4-60,street:Houseboardcolony');
 insert into Location values(10,'Hyderabad','h.no:6-60,street:Kukatpally');
  insert into Location values(11,'Amaravati','h.no:5-60,street:Rithubazar');
 insert into Location values(12,'Rangareddy','h.no:8-60,street:Kothapeta');
 insert into Location values(13,'Mysore','h.no:5-60,street:santhinagar');



 select * from Location;
 Create Table Payment
 (
   PaymentID int Primary Key,
   CourierID int,
   LocationID int,
   Amount decimal(10,2),
   PaymentDate Date,
   Foreign Key (CourierID) References Courier(CourierID) on delete cascade on update cascade,
   Foreign Key (LocationID) References Location(LocationID) on delete cascade on update cascade
   );
   insert into Payment values (1,1000,1,450.85,'2021-12-23');
   insert into Payment values (2,1001,2,3000,NUll);
   insert into Payment values (3,1003,11,450.85,'2022-03-13');
   insert into Payment values (4,1004,2,null,null);
   insert into Payment values (5,1005,12,745,'2021-04-01');
   insert into Payment values (6,1006,13,NULL,NULL);
   insert into Payment values (7,1007,13,4500.85,'2024-02-01');
   insert into Payment values (8,1008,6,NULL,NULL);
   insert into Payment values (9,1009,6,4500,'2024-02-01');
   insert into Payment values (10,1002,2,5600,'2023-01-23');
   







   select * from UserDetails;
   select * from Payment;
   select * from Courier;
   select * from Location;

                                                          /*TASK 2*/

/*1. List all customers */
 select * from UserDetails;

 /*2. List all orders for a specific customer(specific sender) */
 select * from Courier where SenderName='Mahesh';
 select * from Courier where SenderName='Umesh';

 /*3. List all couriers */
 select * from Courier;

 /*4. List all packages for a specific order(specific receiver:) */
  select * from Courier where ReceiverName='Ganesh';

 /*5. List all deliveries for a specific courier */
 select * from Courier 
 where ServiceID=2;

 /*6. List all undelivered packages: */
 select * from Courier where status<>'delivered';

 /*7. List all packages that are scheduled for delivery today(2024/02/23): */
     select * from Courier where DeliveryDate='2024/02/23';

/*8. List all packages with a specific status:*/
    select * from Courier where status='delivered';
/*9. Calculate the total number of packages for each courier. */
    select  ServiceID,count(CourierID)as CountofCouriers from Courier
	group by ServiceID;
/*10.Find the average delivery time for each courier */
  select AVG(DatePart(day,DeliveryDate))as AverageDeliverydays from Courier ;

  /*11. List all packages with a specific weight range(375.00 to 540.00) */
  select * from Courier where Weight between 375 and 540;

  /*12. Retrieve employees whose names contain 'John' */
  select * from Employee where Name Like '%john%';
 
 /*13. Retrieve all courier records with payments greater than $50. */
 select * from Courier c
 join Payment p
 on p.CourierID=c.CourierID
 where p.Amount>50;

                      /*TASK 3 */

/*14. Find the total number of couriers handled by each employee.*/

       select DeliveredEmployeeID,Count(CourierID)as NumberofCouriersDelivered
	   from Courier
	   Group by DeliveredEmployeeID
	   Having DeliveredEmployeeID is Not NULL;
/*15.Calculate the total revenue generated by each location */
    select LocationID,Sum(Amount) as TotalAmount
	from Payment
	Group by LocationID;

/*16. Find the total number of couriers delivered to each location. */

 select LocationID,Count(CourierID)
 from Payment p
Group by LocationID


 /*17.Find the courier with the highest average delivery time: */
  select top(1)AVG(DatePart(day,DeliveryDate))
  from Courier
  Group by CourierID
  order by AVG(DatePart(day,DeliveryDate)) desc;

 /*18. Find Locations with Total Payments Less Than a Certain Amount*/
  select LocationID,Sum(Amount)
  from Payment
  Group by LocationID
  Having SUM(Amount)<5000;

  /*19. Calculate Total Payments per Location */
  select LocationID,Sum(Amount)
  from Payment
  Group by LocationID

  /*20.Retrieve couriers who have received payments totaling more than $1000 in a specific location 
(LocationID = X):*/
select CourierID,sum(Amount)
from Payment
WHERE LocationID=6
Group BY CourierID
HAVING SUM(Amount)>1000;

/*21.. Retrieve couriers who have received payments totaling more than $1000 after a certain date 
(PaymentDate > 'YYYY-MM-DD'):*/

select CourierID,PaymentDate,Sum(Amount)
from Payment 
group by CourierID,PaymentDate
Having SUM(Amount)>1000 and PaymentDate>'2022/01/23';

/*22.Retrieve locations where the total amount received is more than $5000 before a certain date 
(PaymentDate < 'YYYY-MM-DD') */

select LocationID ,PaymentDate,Sum(Amount)
from Payment 
Group by LocationID,PaymentDate
Having Sum(Amount)>5000 and PaymentDate<'2023/01/23';

              /*Task 4*/
/* 23. Retrieve Payments with Courier Information*/

select * from Courier c
 join Payment p
on c.CourierID=p.CourierID;

/*24.. Retrieve Payments with Location Information */
  select * from Location l
 join Payment p
on l.LocationID=p.LocationID;

/*25.. Retrieve Payments with Courier and Location Information*/
 select * from Courier c
 join Payment p
 on p.CourierID=c.CourierID
 join Location l
 on l.LocationID=p.LocationID;

 /*26.. List all payments with courier details*/
 select c.CourierID,p.Amount from Courier c
 right join Payment p
on c.CourierID=p.CourierID;

/*27. Total payments received for each courier*/
select cs.ServiceName,Sum(p.Amount) from CourierServices cs
left join Courier c
on cs.ServiceID=c.ServiceID
left join Payment p
on p.CourierID=c.CourierID
Group by cs.ServiceName
 
 /*28. List payments made on a specific date */
 select p.Amount,p.PaymentDate
 from Payment p
 where p.PaymentDate='2023/01/23';

 /*29.Get Courier Information for Each Payment */
 select * from  Payment p
 left join Courier c
 on p.CourierID=c.CourierID

 /*30. Get Payment Details with Location */
 select * from  Location l
 join Payment p
 on l.LocationID=p.LocationID;

 /*31. Calculating Total Payments for Each Courier*/
  select c.CourierID,SUM(p.Amount) from Courier c
  left join Payment p
  on p.CourierID= c.CourierID
  Group by c.CourierID;
  /*32.List Payments Within a Date Range */
  select * from Payment p
  where p.PaymentDate between '2021-01-01' and '2022-12-31';
  /*33.Retrieve a list of all users and their corresponding courier records, including cases where there are 
no matches on either side */
 select * from UserDetails ud
 full outer join Courier c
 on ud.UserID=c.SenderID;

 /*34.Retrieve a list of all couriers and their corresponding services, including cases where there are no 
matches on either side */
select * from Courier c
 full outer join CourierServices cs
 on c.ServiceID=cs.ServiceID;

 /*35.Retrieve a list of all employees and their corresponding payments, including cases where there are 
no matches on either side */
 select e.Name,c.CourierID,sum(p.Amount)as CorrespondPayments from Employee e
 full outer join Courier c
 on c.DeliveredEmployeeID=e.EmployeeID
 full outer join Payment p
 on p.CourierID=c.CourierID
 Group by e.Name,c.CourierID;

 /*36.. List all users and all courier services, showing all possible combinations. */
    select * from UserDetails
	Cross join CourierServices;
/*37.. List all employees and all locations, showing all possible combinations: */
  select * from Employee
  Cross join Location;

  /*38.. Retrieve a list of couriers and their corresponding sender information (if available)*/
    select c.CourierID,c.SenderName,c.SenderAddress,ud.Email,ud.Password,ud.ContactNumber from Courier c
	join UserDetails ud
	on c.SenderID=ud.UserID;

/*39.Retrieve a list of couriers and their corresponding receiver information (if available): */
	 select c.CourierID,c.ReceiverName,C.ReceiverAddress from Courier c;

/*40.. Retrieve a list of couriers along with the courier service details (if available): */
	 select c.CourierID,cs.* from Courier c
	 join CourierServices cs
	 on c.ServiceID=cs.ServiceID

 /*41.. Retrieve a list of employees and the number of couriers assigned to each employee: */
	  select e.Name,Count(c.courierID) from Employee e
	  left join Courier c
	  on e.EmployeeID=c.DeliveredEmployeeID
	  Group By e.Name;
	  
/*42. Retrieve a list of locations and the total payment amount received at each location */
	   select l.LocationName,sum(p.Amount) from Location l
	   left join Payment p
	   on l.LocationID=p.LocationID
	   Group by l.LocationName;   

 /*43. Retrieve all couriers sent by the same sender (based on SenderName). */
	   select c.courierId,c.SenderName from Courier c
	     where c.SenderName='Mahesh';
	    
	    
 /*44. List all employees who share the same role. */
	    select e.Name from Employee e
		where e.Role='Driver';

	   /*45.Retrieve all payments made for couriers sent from the same location.*/
	    select c.CourierID,p.* from Courier c
		join Payment p
		on c.CourierID=p.CourierID
		where p.LocationID=2;
	   /*46.. Retrieve all couriers sent from the same location (based on SenderAddress */
	   select * from Courier c
	    where c.SenderAddress Like 'Hyderabad%';
/*47.List employees and the number of couriers they have delivered:*/
	   select e.EmployeeID,e.Name,count(c.courierID) from Employee e
	    left join Courier c
		on c.DeliveredEmployeeID=e.EmployeeID
		Group by e.EmployeeID,e.Name;
	   
/*48.. Find couriers that were paid an amount greater than the cost of their respective courier services */
	    select c.CourierID,cs.ServiceName,p.Amount,cs.cost from Courier c
		 join CourierServices cs
		 on c.ServiceID=cs.ServiceID
		 join Payment p
		 on p.CourierID =c.CourierID
		 where p.Amount>cs.Cost and c.status='Delivered';

/*49.. Find couriers that have a weight greater than the average weight of all couriers */
		  select * from Courier c
		  where c.weight>(select avg(weight) from Courier);
/*50.Find the names of all employees who have a salary greater than the average salary */
		  select e.Name from Employee e
		  where e.Salary>(select avg(e.Salary) from Employee e);
/*51.Find the total cost of all courier services where the cost is less than the maximum cost */
		  select sum(cs.cost) from CourierServices cs
		  where cs.cost <ANY(select cs.cost from CourierServices cs);
/*52.Find all couriers that have been paid for */
		   select * from Courier c
		   where c.CourierID not in(select c.CourierID from Courier c where c.DeliveredEmployeeID is Null);
		  
/*53.Find the locations where the maximum payment amount was made */
		  select TOP(1)p.LocationID,sum(p.Amount) as MaximumPayment from Payment p
		  group by LocationID
		  order by sum(p.Amount) desc;
/*54.Find all couriers whose weight is greater than the weight of all couriers sent by a specific sender 
           (e.g., 'SenderName'): */

		select * from Courier c
		where c.weight>ALL
		(select sum(weight) from Courier c
		   where c.SenderName='Srikanth'
		   group by c.SenderName)

		  
		  

   select * from UserDetails;
   select * from Payment;
   select * from Courier;
   select * from Employee;
   select * from CourierServices;
   select * from Location;
