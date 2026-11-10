-- Customer
CREATE TABLE Customer (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20)
);

-- Film
CREATE TABLE Film (
    FilmID INT IDENTITY(1,1) PRIMARY KEY,
    Title VARCHAR(100),
    Genre VARCHAR(50),
    DurationMinutes INT,
    Rating VARCHAR(10)
);

-- Screen
CREATE TABLE Screen (
    ScreenID INT IDENTITY(1,1) PRIMARY KEY,
    ScreenType VARCHAR(20),
    Capacity INT
);

-- Showing
CREATE TABLE Showing (
    ShowingID INT IDENTITY(1,1) PRIMARY KEY,
    FilmID INT NOT NULL,
    ScreenID INT NOT NULL,
    ShowingDateTime DATETIME,
    TicketPrice DECIMAL(6,2),

    FOREIGN KEY (FilmID) REFERENCES Film(FilmID) ON DELETE CASCADE,
    FOREIGN KEY (ScreenID) REFERENCES Screen(ScreenID) ON DELETE CASCADE
);

-- Booking
CREATE TABLE Booking (
    BookingID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    ShowingID INT NOT NULL,
    BookingDateTime DATETIME DEFAULT GETDATE(),
    TotalAmount DECIMAL(8,2),
    Status VARCHAR(20),

    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID) ON DELETE CASCADE,
    FOREIGN KEY (ShowingID) REFERENCES Showing(ShowingID) ON DELETE CASCADE
);

-- Ticket
CREATE TABLE Ticket (
    TicketID INT IDENTITY(1,1) PRIMARY KEY,
    BookingID INT NOT NULL,
    SeatNumber VARCHAR(10),
    Price DECIMAL(6,2),

    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID) ON DELETE CASCADE
);

-- Concession
CREATE TABLE Concession (
    ConcessionID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(50),
    Description VARCHAR(100),
    UnitPrice DECIMAL(6,2)
);

-- Orders
CREATE TABLE Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    BookingID INT,
    OrderDateTime DATETIME DEFAULT GETDATE(),
    TotalAmount DECIMAL(8,2),

    FOREIGN KEY (BookingID) REFERENCES Booking(BookingID) ON DELETE CASCADE
);

-- Order_Item (Bridge Table)
CREATE TABLE Order_Item (
    OrderItemID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT NOT NULL,
    ConcessionID INT NOT NULL,
    Quantity INT,
    UnitPrice DECIMAL(6,2),

    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE,
    FOREIGN KEY (ConcessionID) REFERENCES Concession(ConcessionID) ON DELETE CASCADE
);