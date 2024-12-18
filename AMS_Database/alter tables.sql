ALTER TABLE GATE
ADD CONSTRAINT `CHK_Gate_Status` CHECK (GateStatus IN ('opened', 'closed', 'waiting'));

ALTER TABLE FLIGHT
ADD CONSTRAINT `CHK_Flight_Transfer` CHECK (Transfer IN ('yes', 'no')),
ADD CONSTRAINT `CHK_Flight_Status` CHECK (FlightStatus IN ('delayed', 'arrived', 'departed', 'landed')),
ADD CONSTRAINT `CHK_Flight_Type` CHECK (FlightType IN ('domestic', 'international'));

ALTER TABLE BAGGAGE
ADD CONSTRAINT `CHK_Baggage_Type` CHECK (BaggageType IN ('carry-on', 'checked')),
ADD CONSTRAINT `CHK_Baggage_Status` CHECK (BaggageStatus IN ('checked-in', 'loaded', 'carousel'));

ALTER TABLE TICKET
ADD CONSTRAINT `CHK_Ticket_Class` CHECK (Class IN ('economy', 'business', 'first')),
ADD CONSTRAINT `CHK_Meal_Pref` CHECK (MealPreference IN ('vegetarian', 'vegan', 'none'));

ALTER TABLE SECURITY_ZONE
ADD CONSTRAINT `CHK_Zone_Name` CHECK (ZoneName IN ('cctv-room', 'border-control', 'passenger-check', 'baggage-check'));