#Retrieve the top 3 airlines with the highest average ticket prices:
SELECT A.AirlineName, ROUND(AVG(T.Price)) AS AvgTicketPrice
FROM AIRLINE A
JOIN TICKET T ON A.AirlineID = T.AirlineID
GROUP BY A.AirlineName
ORDER BY AvgTicketPrice DESC
LIMIT 3;

#Retrieve the top 2 security zones with the highest number of shifts:
SELECT SZ.ZoneName, COUNT(SS.ShiftID) AS ShiftCount
FROM SECURITY_ZONE SZ
LEFT JOIN SEC_SHIFT SS ON SZ.SecurityZoneID = SS.SecurityZoneID
GROUP BY SZ.ZoneName
ORDER BY ShiftCount DESC
LIMIT 2;

#List the gates with more than 1 flight, along with the total number of flights departing from that gate in 2023, ordered by the number of flights:
SELECT g.GateID, COUNT(f.FlightID) AS NumFlights
FROM GATE g
LEFT JOIN FLIGHT f ON g.GateID = f.GateID
WHERE YEAR(f.DepartureDate_Time) = 2023
GROUP BY g.GateID
HAVING NumFlights > 1  
ORDER BY NumFlights DESC;

#Nested query to find the employees who have worked in security zones where flights have been delayed:
SELECT EmployeeID, FirstName, LastName
FROM EMPLOYEE
WHERE EmployeeID IN (
    SELECT DISTINCT S.EmployeeID
    FROM SEC_SHIFT S
    JOIN FLIGHT F ON F.FlightID = (
        SELECT DISTINCT BP.FlightID
        FROM BOARDING_PASS BP
        WHERE BP.BoardingPassID = S.ShiftID
    )
    WHERE F.FlightStatus = 'delayed'
);

#Nested query that retrieves the details of passengers who have booked tickets for flights with flightIDs beginning with 'QA': 
SELECT PassengerID, FirstName, LastName
FROM PASSENGER
WHERE PassengerID IN (
    SELECT DISTINCT P.PassengerID
    FROM PASSENGER P
    JOIN TICKET T ON P.PassengerID = T.PassengerID
    JOIN AIRLINE A ON T.AirlineID = A.AirlineID
    WHERE A.AirlineName LIKE 'QA%'
);

#Find the total number of flights departing from each terminal in May, ordered by terminal ID:
SELECT G.TerminalID, COUNT(F.FlightID) AS TotalFlights
FROM GATE G
JOIN FLIGHT F ON G.GateID = F.GateID
WHERE MONTH(F.DepartureDate_Time) = 5  
GROUP BY G.TerminalID
ORDER BY G.TerminalID;

#Retrieve the number of security officers assigned to each security zone:
SELECT SZ.ZoneName, COUNT(SO.EmployeeID) AS NumSecurityOfficers
FROM SECURITY_ZONE SZ
LEFT JOIN SEC_SHIFT SS ON SZ.SecurityZoneID = SS.SecurityZoneID
LEFT JOIN SECURITY_OFFICER SO ON SS.EmployeeID = SO.EmployeeID
GROUP BY SZ.ZoneName;

#Retrieve all flights where the aircraft type contains the word 'Boeing' and display the corresponding departure and arrival airports:
SELECT FlightID, DepartureAirport, ArrivalAirport
FROM FLIGHT
WHERE AircraftType LIKE '%Boeing%';

#Nested Query to find all security officers working in the 'cctv-room' security zone and display their names and email addresses:
SELECT FirstName, LastName, WorkEmail
FROM EMPLOYEE
WHERE EmployeeID IN (
    SELECT EmployeeID
    FROM SECURITY_OFFICER
    WHERE EmployeeID IN (
        SELECT EmployeeID
        FROM SEC_SHIFT
        WHERE SecurityZoneID = (
            SELECT SecurityZoneID
            FROM SECURITY_ZONE
            WHERE ZoneName = 'cctv-room'
        )
    )
);

#Nested Query to find Airport Staff with the most schedules:
SELECT EmployeeID, FirstName, LastName, ScheduleCount
FROM (
    SELECT E.EmployeeID, E.FirstName, E.LastName, COUNT(AP.ScheduleID) AS ScheduleCount
    FROM EMPLOYEE E
    LEFT JOIN APS_SCHEDULE AP ON E.EmployeeID = AP.EmployeeID
    WHERE E.EmployeeID LIKE 'AP%'
    GROUP BY E.EmployeeID
) AS EmployeeSchedules
ORDER BY ScheduleCount DESC;

#Find the total number of checked-in baggage items for each flight:
SELECT bp.FlightID, COUNT(b.BaggageID) AS CheckedInBaggageCount
FROM BOARDING_PASS bp
JOIN BAGGAGE b ON bp.BoardingPassID = b.BoardingPassID
GROUP BY bp.FlightID;

#List the security officers along with the total number of shifts they have worked, ordered by the number of shifts:
SELECT so.EmployeeID, e.FirstName, e.LastName, COUNT(s.ShiftID) AS ShiftCount
FROM SECURITY_OFFICER so
JOIN EMPLOYEE e ON so.EmployeeID = e.EmployeeID
LEFT JOIN SEC_SHIFT s ON e.EmployeeID = s.EmployeeID
GROUP BY so.EmployeeID
ORDER BY ShiftCount DESC;

#Find the average baggage weight for each flight and retrieves only those flights where the average baggage 
# weight exceeds a certain threshold:
SELECT F.FlightID, ROUND(AVG(B.Weight)) AS AvgBaggageWeight
FROM FLIGHT F
JOIN BOARDING_PASS BP ON F.FlightID = BP.FlightID
JOIN BAGGAGE B ON BP.BoardingPassID = B.BoardingPassID
GROUP BY F.FlightID
HAVING AvgBaggageWeight > 20;

#Nested Query to identify Employees Working in All Security Zones:
SELECT EmployeeID, FirstName, LastName
FROM EMPLOYEE
WHERE EmployeeID IN (
    SELECT s1.EmployeeID
    FROM SEC_SHIFT s1
    WHERE NOT EXISTS (
        SELECT sz.SecurityZoneID
        FROM SECURITY_ZONE sz
        WHERE NOT EXISTS (
            SELECT s2.SecurityZoneID
            FROM SEC_SHIFT s2
            WHERE s2.EmployeeID = s1.EmployeeID AND s2.SecurityZoneID = sz.SecurityZoneID
        )
    )
);

#Nested Query to find Security Officers with the most shifts:
SELECT EmployeeID, FirstName, LastName, ShiftCount
FROM (
    SELECT E.EmployeeID, E.FirstName, E.LastName, COUNT(s.ShiftID) AS ShiftCount
    FROM EMPLOYEE E
    LEFT JOIN SEC_SHIFT s ON E.EmployeeID = s.EmployeeID
    WHERE E.EmployeeID LIKE 'SO%'
    GROUP BY E.EmployeeID
) AS EmployeeShifts
ORDER BY ShiftCount DESC;

#Recursive relationship query to retrieve the Manager ID, first name and last name for the Employee with ID 'SO003'
SELECT E.EmployeeID AS Employee_ID, M.EmployeeID AS Manager_ID, M.FirstName AS Manager_FirstName, M.LastName AS Manager_LastName
FROM EMPLOYEE E
JOIN SECURITY_OFFICER S ON E.EmployeeID = S.EmployeeID
LEFT JOIN EMPLOYEE M ON S.ManagerID = M.EmployeeID
WHERE E.EmployeeID = 'SO003';
