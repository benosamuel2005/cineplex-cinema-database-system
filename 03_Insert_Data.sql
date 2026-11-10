-- Customer
INSERT INTO Customer VALUES
('Vivek','Menon','vivek@email.com','9999999999'),
('Rahul','Nair','rahul@email.com','8888888888'),
('Anu','Joseph','anu@email.com','7777777777'),
('Priya','Das','priya@email.com','6666666666'),
('Arjun','Kumar','arjun@email.com','5555555555');

-- Film
INSERT INTO Film VALUES
('Dune 2','Sci-Fi',165,'12A'),
('Avengers','Action',180,'PG-13'),
('Joker','Drama',122,'18'),
('Frozen','Animation',100,'U'),
('Oppenheimer','History',150,'15');

-- Screen
INSERT INTO Screen VALUES
('IMAX',200),
('3D',150),
('Standard',120),
('VIP',80),
('Standard',100);

-- Showing
INSERT INTO Showing VALUES
(1,1,'2026-04-10 10:00',12.50),
(2,2,'2026-04-10 13:00',10.00),
(3,3,'2026-04-10 16:00',11.00),
(4,4,'2026-04-10 18:00',9.00),
(5,5,'2026-04-10 21:00',13.00);

-- Booking
INSERT INTO Booking (CustomerID, ShowingID, TotalAmount, Status)
VALUES
(1,1,25.00,'Confirmed'),
(2,2,20.00,'Confirmed'),
(3,3,15.00,'Pending'),
(4,4,30.00,'Cancelled'),
(5,5,22.00,'Confirmed');

-- Ticket
INSERT INTO Ticket VALUES
(1,'A1',12.50),
(2,'B1',10.00),
(3,'C1',11.00),
(4,'D1',9.00),
(5,'E1',13.00);

-- Concession
INSERT INTO Concession VALUES
('Popcorn','Large popcorn',5.00),
('Cola','Soft drink',3.00),
('Nachos','Cheese nachos',4.50),
('Water','Mineral water',2.00),
('Chocolate','Snack bar',3.50);

-- Orders
INSERT INTO Orders (BookingID, TotalAmount) VALUES
(1,8.00),
(2,6.00),
(3,7.50),
(4,5.00),
(5,9.00);

-- Order_Item
INSERT INTO Order_Item VALUES
(1,1,1,5.00),
(2,2,2,3.00),
(3,3,1,5.00),
(4,4,2,3.00),
(5,5,1,5.00);