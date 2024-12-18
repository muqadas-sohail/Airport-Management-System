#Hash Partitioned table
CREATE TABLE TICKET (
	TicketID int NOT NULL,
    Class varchar(10), 
    Price float(6, 2),
    Seat varchar(4),
    MealPreference varchar(10),
    PassengerID varchar(6) COLLATE utf8mb4_bin NOT NULL,
    AirlineID int NOT NULL
)
PARTITION BY HASH(TicketID)
PARTITIONS 2;

#Insert more data
INSERT INTO TICKET (TicketID, Class, Price, Seat, MealPreference, PassengerID, AirlineID)
VALUES
(1, 'economy', 50.00, 'A1', 'none', 'JD001', '1'), (2, 'business', 75.00, 'B2', 'vegan', 'PS002', '2'), (3, 'first', 100.00, 'C3', 'vegan', 'JJ003', '3'),
(4, 'economy', 60.00, 'D4', 'vegetarian', 'MW004', '4'), (5, 'business', 80.00, 'E5', 'vegan', 'ED005', '5'), (6, 'first', 120.00, 'F6', 'vegan', 'DB006', '5'),
(7, 'economy', 55.00, 'G7', 'vegan', 'ET007', '4'), (8, 'business', 85.50, 'H8', 'none', 'CJ008', '3'), (9, 'economy', 110.00, 'I9', 'none', 'SC009', '2'),
(10, 'economy', 70.00, 'J10', 'vegetarian', 'DW010', '1'), (11, 'business', 90.00, 'K11', 'none', 'OW011', '1'), (12, 'first', 130.00, 'L12', 'vegan', 'WS012', '2'),
(13, 'economy', 65.00, 'M13', 'none', 'GL013', '3'), (14, 'business', 95.00, 'N14', 'vegetarian', 'AA014', '4'), (15, 'first', 115.00, 'O15', 'vegan', 'LH015', '5'),
(16, 'economy', 75.00, 'P16', 'none', 'MA016', '5'), (17, 'business', 100.00, 'Q17', 'vegetarian', 'SC017', '4'), (18, 'first',  140.00, 'R18', 'vegan', 'CL018', '3'),
(19, 'economy', 80.00, 'S19', 'vegetarian', 'PP019', '2'), (20, 'business', 105.00, 'T20', 'vegan', 'YT020', '1'), (21, 'first', 250.00, 'A1', 'none', 'JD001', '1'),
(22, 'economy', 75.00, 'B2', 'vegan', 'PS002', '2'), (23, 'first', 100.00, 'C3', 'none', 'JJ003', '3'), (24, 'economy', 60.00, 'D4', 'vegetarian', 'MW004', '4'),
(25, 'business', 80.00, 'E5', 'vegan', 'ED005', '5'), (26, 'first', 120.00, 'F6', 'vegan', 'DB006', '5'), (27, 'economy', 55.00, 'G7', 'vegan', 'ET007', '4'),
(28, 'business', 85.50, 'H8', 'none', 'CJ008', '3'), (29, 'economy', 110.00, 'I9', 'none', 'SC009', '2'), (30, 'economy', 70.00, 'E10', 'vegetarian', 'DW010', '1'),
(31, 'business', 90.00, 'K11', 'none', 'OW011', '1'), (32, 'first', 250.00, 'L12', 'vegan', 'WS012', '2'), (33, 'economy', 65.00, 'M13', 'none', 'GL013', '3'),
(34, 'business', 95.00, 'N14', 'vegetarian', 'AA014', '3'), (35, 'first', 115.00, 'O15', 'vegan', 'LH015', '5'), (36, 'economy', 75.00, 'P16', 'none', 'MA016', '5'),
(37, 'business', 100.00, 'Q17', 'vegetarian', 'SC017', '4'), (38, 'first',  140.00, 'R18', 'vegan', 'CL018', '3'), (39, 'economy', 80.00, 'S19', 'vegetarian', 'PP019', '2'),
(40, 'business', 105.00, 'T20', 'none', 'YT020', '1'), (41, 'economy', 100.00, 'O15', 'none', 'LH015', '2'), (42, 'economy', 75.00, 'P16', 'vegan', 'MA016', '1'),
(43, 'business', 100.00, 'Q17', 'vegetarian', 'SC017', '4'), (44, 'first',  240.00, 'R18', 'none', 'CL018', '3'), (45, 'economy', 80.00, 'S19', 'vegetarian', 'PP019', '2'),
(46, 'business', 105.00, 'T20', 'none', 'YT020', '1'), (47, 'first', 100.00, 'C3', 'vegan', 'JJ003', '3'), (48, 'economy', 60.00, 'D4', 'vegetarian', 'MW004', '4'),
(49, 'business', 80.00, 'E5', 'vegan', 'ED005', '5'), (50, 'first', 120.00, 'F6', 'vegan', 'DB006', '5'), (51, 'economy', 55.00, 'G7', 'vegan', 'ET007', '4'),
(52, 'business', 85.50, 'H8', 'none', 'CJ008', '3'); 

#Queries
EXPLAIN SELECT Class, AVG(Price) AS AveragePrice
FROM TICKET
GROUP BY Class
HAVING AveragePrice > 80.00;

EXPLAIN SELECT t.PassengerID, t.Class,
    COUNT(DISTINCT b.FlightID) AS NumberOfFlights,
    AVG(t.Price) AS AverageTicketPrice,
    MAX(t.Price) AS MaxTicketPrice
FROM TICKET t
JOIN BOARDING_PASS b ON t.TicketID = b.TicketID
WHERE t.Class = 'economy' 
GROUP BY t.PassengerID, t.Class
HAVING NumberOfFlights > 2
ORDER BY AverageTicketPrice DESC;

#Retrieve the top 3 airlines with the highest average ticket prices:
EXPLAIN SELECT A.AirlineName, ROUND(AVG(T.Price)) AS AvgTicketPrice
FROM AIRLINE A
JOIN TICKET T ON A.AirlineID = T.AirlineID
GROUP BY A.AirlineName
ORDER BY AvgTicketPrice DESC
LIMIT 3;

#Nested query that retrieves the details of passengers who have booked tickets for flights with flightIDs beginning with 'QA': 
EXPLAIN SELECT PassengerID, FirstName, LastName
FROM PASSENGER
WHERE PassengerID IN (
    SELECT DISTINCT P.PassengerID
    FROM PASSENGER P
    JOIN TICKET T ON P.PassengerID = T.PassengerID
    JOIN AIRLINE A ON T.AirlineID = A.AirlineID
    WHERE A.AirlineName LIKE 'QA%'
);