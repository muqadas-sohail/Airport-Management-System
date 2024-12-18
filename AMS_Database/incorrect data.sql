INSERT INTO PASSENGER ()
VALUES
('DP021', 'Daniel', 'Pryce', 112, 'Petal St', 'Manchester', 'M1 4RT', '2001-07-18', '07541331925', 'dan.p@email.com', 'GB1352468', 'British');

INSERT INTO EMPLOYEE () 
VALUES  
('SF001', 'Jane', 'Merrick', 70, 'Birches Avenue', 'Liverpool', 'L4 1AB', '1979-12-22', '01902337879', 'SO001@outlook.com', 
	'jane.merrick@gmail.com');
    
INSERT INTO SECURITY_OFFICER()
VALUES
('SE011');

INSERT INTO AIRPORT_STAFF ()
VALUES
('AIR26');

INSERT INTO AIRLINE_STAFF ()
VALUES
('AS051', 'GB6549873', 1);

INSERT INTO FLIGHT ()
VALUES
('ER001', 'BHX', 'DEL', '2023-03-01 01:00:00', '2023-03-01 09:00:00', 1500.00, 'Boeing 737', 150, 'no', 'departed', 'national', 1);

INSERT INTO BAGGAGE (Weight, BaggageType, BaggageStatus, BoardingPassID)
VALUES
(23.05, 'checked','on flight', '1');

INSERT INTO AIRLINE (AirlineName, Origin, IATACode, ICAOCode, BaggageAllowance)
VALUES
('British Airways', 'united kingdom', 'LHR', 'egll', 23);

INSERT INTO TICKET (Class, Price, Seat, MealPreference, PassengerID, AirlineID)
VALUES
('economy', 50.00, 'A2', 'veg', 'JD001', '1');

INSERT INTO BOARDING_PASS (TicketID, FlightID)
VALUES
(1, 'LF001');

INSERT INTO GATE (GateStatus, TerminalID)
VALUES
('open', 'T1');

INSERT INTO TERMINAL ()
VALUES
('t7');

INSERT INTO SECURITY_ZONE (ZoneName)
VALUES
('metal detector');

INSERT INTO APS_SCHEDULE (ScheduleDate, StartTime, EndTime, EmployeeID, GateID)
VALUES 
('1 Feb 2024', '09:00:00', '17:00:00', 'AP026', 1);

INSERT INTO SEC_SHIFT (ShiftDate, StartTime, EndTime, EmployeeID, SecurityZoneID)
VALUES 
('2024-03-01', '8am', '4pm', 'SO001', 1);