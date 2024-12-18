#To improve performance of the first query that retrieves the top 3 airlines with the highest average ticket prices.
CREATE INDEX idx_Airline_AirlineName ON AIRLINE(AirlineName);

#Beneficial for second query that retrieves the top 2 security zones with the highest number of shifts.
CREATE INDEX idx_SecurityZone_ZoneName ON SECURITY_ZONE(ZoneName);


