-- Insert Booking
CREATE PROCEDURE InsertBooking
    @CustomerID INT,
    @ShowingID INT,
    @Amount DECIMAL(8,2),
    @Status VARCHAR(20)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO Booking (CustomerID, ShowingID, TotalAmount, Status)
        VALUES (@CustomerID, @ShowingID, @Amount, @Status);

        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        PRINT 'Error inserting booking';
    END CATCH
END;
GO

-- Delete Booking
CREATE PROCEDURE DeleteBooking
    @BookingID INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        DELETE FROM Booking WHERE BookingID = @BookingID;

        COMMIT;
    END TRY
    BEGIN CATCH
        ROLLBACK;
        PRINT 'Error deleting booking';
    END CATCH
END;
GO

-- Search Between Dates
CREATE PROCEDURE SearchBookingsByDate
    @StartDate DATETIME,
    @EndDate DATETIME
AS
BEGIN
    SELECT * FROM Booking
    WHERE BookingDateTime BETWEEN @StartDate AND @EndDate;
END;
GO

-- LIKE Search
CREATE PROCEDURE SearchCustomerByName
    @Name VARCHAR(50)
AS
BEGIN
    SELECT * FROM Customer
    WHERE FirstName LIKE '%' + @Name + '%';
END;
GO