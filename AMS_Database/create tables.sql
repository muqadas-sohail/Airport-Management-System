CREATE TABLE PASSENGER (
    PassengerID varchar(5) COLLATE utf8mb4_bin NOT NULL,
    FirstName varchar(20),
    LastName varchar(20),
    HouseNumber int(3), 
    Street varchar(50),
    City varchar(50),
    Postcode varchar(10) COLLATE utf8mb4_bin,
    DOB date,
    ContactNo varchar(11), 
    Email varchar(50),
    PassportNo varchar(9) COLLATE utf8mb4_bin,
    Nationality varchar(50), 
    PRIMARY KEY (PassengerID),
    CONSTRAINT `CHK_Pass_ID` CHECK (PassengerID REGEXP '^[A-Z]{2}[0-9]{3}$'), #start with 2 initials, followed by 3 digits
    CONSTRAINT `CHK_Postcode` CHECK (Postcode REGEXP '^[A-Z]{1,2}[0-9][0-9A-Z]? [0-9][ABD-HJLNP-UW-Z]{2}$'), #UK postcode format - must be uppercase, 
    #																										must have space, does not accept certain letters in second part
    CONSTRAINT `CHK_Email` CHECK (Email REGEXP '^[a-zA-Z0-9._%+-]+@(?:[a-zA-Z0-9-]+\.)+(?:com|co\.uk)$'), #must include @ and accepts .com or .co.uk
    CONSTRAINT `CHK_ContactNo` CHECK (ContactNo REGEXP '^07[0-9]*$') #must  begin with 07 and be 11 digits long
);

CREATE TABLE AIRLINE ( 
	AirlineID int NOT NULL auto_increment,
    AirlineName varchar(30),
    Origin varchar(50),
    IATACode varchar(3) COLLATE utf8mb4_bin,
    ICAOCode varchar(4) COLLATE utf8mb4_bin, 
    BaggageAllowance int,
    PRIMARY KEY (AirlineID),
	CONSTRAINT `CHK_IATA_Code` CHECK (IATACode REGEXP '^[A-Z]{3}$'), #3 uppercase letters
	CONSTRAINT `CHK_ICAO_Code` CHECK (ICAOCode REGEXP '^[A-Z]{4}$') #4 uppercase letters
    );
    
CREATE TABLE TERMINAL (
	TerminalID varchar(2) COLLATE utf8mb4_bin NOT NULL,
    CONSTRAINT `CHK_Terminal_ID` CHECK (TerminalID REGEXP '^T[1-4]{1}+$'), #must be uppercase T with number 1 to 4
    PRIMARY KEY (TerminalID)
    );
    
CREATE TABLE SECURITY_ZONE (
	SecurityZoneID int NOT NULL auto_increment,
    ZoneName varchar(30),
    PRIMARY KEY (SecurityZoneID)
    );

CREATE TABLE EMPLOYEE (
    EmployeeID varchar(5) COLLATE utf8mb4_bin NOT NULL,
    FirstName varchar(20),
    LastName varchar(20),
    HouseNumber int(3), 
    Street varchar(50),
    City varchar(50),
    Postcode varchar(10) COLLATE utf8mb4_bin,
    DOB date,
    ContactNo varchar(11), 
    WorkEmail varchar(50),
    PersonalEmail varchar(50),
    PRIMARY KEY (EmployeeID),
    CONSTRAINT `CHK_Emp_ID` CHECK (EmployeeID REGEXP '^[A-Z]{2}[0-9]{3}$'), #start with 2 initials, followed by 3 digits
	CONSTRAINT `CHK_Emp_Postcode` CHECK (Postcode REGEXP '^[A-Z]{1,2}[0-9][0-9A-Z]? [0-9][ABD-HJLNP-UW-Z]{2}$'), #UK postcode format - must be uppercase, 
    #																										must have space, does not accept certain letters in second part
    CONSTRAINT `CHK_EmpWork_Email` CHECK (WorkEmail REGEXP '^[a-zA-Z0-9._%+-]+@outlook\\.com$'), #must include @outlook.com 
    CONSTRAINT `CHK_EmpPersonal_Email` CHECK (PersonalEmail REGEXP '^[a-zA-Z0-9._%+-]+@(?:[a-zA-Z0-9-]+\.)+(?:com|co\.uk)$'), #must include @ and accepts .com or .co.uk
    CONSTRAINT `CHK_Emp_ContactNo` CHECK (ContactNo REGEXP '^07[0-9]*$') #must  begin with 07 and be 11 digits long
);

CREATE TABLE SECURITY_OFFICER (
    EmployeeID varchar(5) COLLATE utf8mb4_bin NOT NULL,
    ManagerID varchar(5) COLLATE utf8mb4_bin,
    PRIMARY KEY (EmployeeID),
    CONSTRAINT `CHK_EmpSO_ID` CHECK (EmployeeID REGEXP '^SO|MA[0-9]{3}$'), #start with SO or MA, followed by 3 digits
    CONSTRAINT `CHK_MAN_ID` CHECK (ManagerID REGEXP '^MA[0-9]{3}$'), #start with MA, followed by 3 digits
    FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEE(EmployeeID),
    FOREIGN KEY (ManagerID) REFERENCES SECURITY_OFFICER(EmployeeID)
);

CREATE TABLE AIRLINE_STAFF (
	EmployeeID varchar(5) COLLATE utf8mb4_bin NOT NULL,
	PassportNo varchar(9) COLLATE utf8mb4_bin,
    AirlineID int NOT NULL,
    PRIMARY KEY (EmployeeID),
    CONSTRAINT `CHK_EmpAL_ID` CHECK (EmployeeID REGEXP '^AL[0-9]{3}$'), #start with AL, followed by 3 digits
    FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEE(EmployeeID),
    FOREIGN KEY (AirlineID) REFERENCES AIRLINE(AirlineID)
);

CREATE TABLE AIRPORT_STAFF (
	EmployeeID varchar(5) COLLATE utf8mb4_bin NOT NULL,
    PRIMARY KEY (EmployeeID),
    CONSTRAINT `CHK_EmpAP_ID` CHECK (EmployeeID REGEXP '^AP[0-9]{3}$'), #start with AP, followed by 3 digits
    FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEE(EmployeeID)
);

CREATE TABLE GATE (
	GateID int NOT NULL auto_increment,
	GateStatus varchar(10),
    TerminalID varchar(2) COLLATE utf8mb4_bin NOT NULL,
    PRIMARY KEY (GateID),
    FOREIGN KEY (TerminalID) REFERENCES TERMINAL(TerminalID)
);

CREATE TABLE FLIGHT (
	FlightID varchar(5) COLLATE utf8mb4_bin NOT NULL, 
	DepartureAirport varchar(4) COLLATE utf8mb4_bin,
	ArrivalAirport varchar(4) COLLATE utf8mb4_bin,
	DepartureDate_Time datetime, 
    ArrivalDate_Time datetime,
    Distance float(7, 2),
    AircraftType varchar(20),
	TotalSeats int,
    Transfer varchar(3),
    FlightStatus varchar(10),
    FlightType varchar(15),
    GateID int NOT NULL,
    PRIMARY KEY (FlightID),
    CONSTRAINT `CHK_Fli_ID` CHECK (FlightID REGEXP '^[A-Z]{2}[0-9]{3}$'), #start with 2 initials, followed by 3 digits
    FOREIGN KEY (GateID) REFERENCES GATE(GateID)
    );
    
CREATE TABLE TICKET (
	TicketID int NOT NULL auto_increment,
    Class varchar(10), 
    Price float(6, 2),
    Seat varchar(4),
    MealPreference varchar(10),
    PassengerID varchar(6) COLLATE utf8mb4_bin NOT NULL,
    AirlineID int NOT NULL,
    PRIMARY KEY (TicketID),
    FOREIGN KEY (PassengerID) REFERENCES PASSENGER(PassengerID),
    FOREIGN KEY (AirlineID) REFERENCES AIRLINE(AirlineID)
);
    
CREATE TABLE BOARDING_PASS (
	BoardingPassID int NOT NULL auto_increment,
    TicketID int NOT NULL, 
    FlightID varchar(6) COLLATE utf8mb4_bin NOT NULL,
    FOREIGN KEY (TicketID) REFERENCES TICKET(TicketID),
    FOREIGN KEY (FlightID) REFERENCES FLIGHT(FlightID),
    PRIMARY KEY (BoardingPassID, TicketID)
);
    
CREATE TABLE BAGGAGE (
	BaggageID int NOT NULL auto_increment,
    Weight float(4, 2),
    BaggageType varchar(10), 
    BaggageStatus varchar(10),
    BoardingPassID int NOT NULL,
    PRIMARY KEY (BaggageID),
	FOREIGN KEY (BoardingPassID) REFERENCES BOARDING_PASS(BoardingPassID)
);
    
CREATE TABLE SEC_SHIFT (
	ShiftID int NOT NULL auto_increment,
    ShiftDate date,
    StartTime time,
    EndTime time,
    EmployeeID varchar(6) COLLATE utf8mb4_bin NOT NULL,
    SecurityZoneID int NOT NULL,
    PRIMARY KEY (ShiftID),
    FOREIGN KEY (EmployeeID) REFERENCES EMPLOYEE(EmployeeID),
    FOREIGN KEY (SecurityZoneID) REFERENCES SECURITY_ZONE(SecurityZoneID)
);
    
CREATE TABLE APS_SCHEDULE (
	ScheduleID int NOT NULL auto_increment,
    ScheduleDate date,
    StartTime time,
    EndTime time,
    EmployeeID varchar(6) COLLATE utf8mb4_bin NOT NULL,
    GateID int NOT NULL,
    PRIMARY KEY (ScheduleID),
    FOREIGN KEY (EmployeeID) REFERENCES AIRPORT_STAFF(EmployeeID),
    FOREIGN KEY (GateID) REFERENCES GATE(GateID)
);