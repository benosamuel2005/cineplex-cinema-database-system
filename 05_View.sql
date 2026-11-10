CREATE VIEW BookingDetailsView AS
SELECT 
    B.BookingID AS Booking_ID,
    C.FirstName + ' ' + C.LastName AS Customer_Name,
    F.Title AS Film_Name,
    S.ShowingDateTime AS Show_Time,
    B.TotalAmount AS Total_Amount
FROM Booking B
JOIN Customer C ON B.CustomerID = C.CustomerID
JOIN Showing S ON B.ShowingID = S.ShowingID
JOIN Film F ON S.FilmID = F.FilmID;