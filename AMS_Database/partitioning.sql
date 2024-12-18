#Partitioned table created 
CREATE TABLE SEC_SHIFT (
	ShiftID int,
    ShiftDate date,
    StartTime time,
    EndTime time,
    EmployeeID varchar(6) COLLATE utf8mb4_bin NOT NULL,
    SecurityZoneID int NOT NULL
) PARTITION BY RANGE (YEAR(ShiftDate)) (
    PARTITION p0 VALUES LESS THAN (2022),
    PARTITION p1 VALUES LESS THAN (2023),
    PARTITION p2 VALUES LESS THAN (2024),
    PARTITION p3 VALUES LESS THAN (2025)
);

#Insert more data
INSERT INTO SEC_SHIFT ()
VALUES 
(1, '2024-01-01', '08:00:00', '16:00:00', 'SO001', 1), (2, '2024-01-01', '10:00:00', '18:00:00', 'SO002', 2), (3, '2024-01-02', '08:00:00', '16:00:00', 'SO003', 3),
(4, '2024-01-02', '09:00:00', '17:00:00', 'SO004', 4), (5, '2024-01-03', '18:00:00', '02:00:00', 'SO005', 1), (6, '2024-01-03', '10:00:00', '18:00:00', 'SO006', 2),
(7, '2024-01-04', '22:00:00', '06:00:00', 'SO007', 3), (8, '2024-01-04', '09:00:00', '17:00:00', 'SO008', 4), (9, '2024-01-04', '18:00:00', '02:00:00', 'SO009', 1),
(10, '2024-01-05', '09:00:00', '17:00:000', 'SO010', 2), (11, '2024-01-05', '22:00:00', '06:00:000', 'SO011', 3), (12, '2024-01-05', '10:00:00', '18:00:000', 'SO012', 4), 
(13, '2024-01-06', '08:00:00', '16:00:00', 'SO013', 1), (14, '2024-01-06', '10:00:00', '18:00:00', 'SO014', 2), (15, '2024-01-07', '22:00:00', '06:00:00', 'SO015', 3),
(16, '2024-01-07', '08:00:00', '16:00:00', 'SO016', 4), (17, '2024-01-07', '18:00:00', '02:00:00', 'SO017', 1), (18, '2024-01-07', '22:00:00', '06:00:00', 'SO018', 2),
(19, '2024-01-08', '09:00:00', '17:00:00', 'SO019', 3), (20, '2024-01-08', '13:00:00', '21:00:00', 'SO020', 4), (21, '2024-01-08', '09:00:00', '17:00:00', 'SO021', 1),
(22, '2024-01-08', '08:00:00', '16:00:00', 'SO022', 2), (23, '2024-01-09', '22:00:00', '06:00:00', 'SO023', 3), (24, '2024-01-09', '18:00:00', '02:00:00', 'SO024', 4),
(25, '2024-01-10', '11:00:00', '19:00:00', 'SO025', 1), (26, '2024-01-10', '13:00:00', '21:00:00', 'SO001', 2), (27, '2024-01-10', '18:00:00', '02:00:00', 'SO002', 3),
(28, '2024-01-10', '09:00:00', '17:00:00', 'SO003', 4), (29, '2024-01-11', '10:00:00', '18:00:00', 'SO004', 1), (30, '2024-01-11', '11:00:00', '19:00:00', 'SO005', 2),
(31, '2024-01-12', '08:00:00', '16:00:00', 'SO006', 3), (32, '2024-01-12', '21:00:00', '05:00:00', 'SO007', 4), (33, '2024-01-12', '22:00:00', '06:00:00', 'SO007', 1),
(34, '2024-01-13', '08:00:00', '16:00:00', 'SO008', 2), (35, '2024-01-13', '13:00:00', '21:00:00', 'SO009', 3), (36, '2024-01-14', '09:00:00', '17:00:00', 'SO010', 4),
(37, '2024-01-14', '13:00:00', '21:00:00', 'SO011', 1), (38, '2024-01-14', '08:00:00', '16:00:00', 'SO012', 2), (39, '2024-01-14', '22:00:00', '06:00:00', 'SO013', 3),
(40, '2024-01-15', '11:00:00', '19:00:00', 'SO014', 4), (41, '2024-01-15', '10:00:00', '18:00:00', 'SO015', 1), (42, '2024-01-16', '13:00:00', '21:00:00', 'SO016', 2),
(43, '2024-01-16', '11:00:00', '19:00:00', 'SO017', 3), (44, '2024-01-16', '21:00:00', '05:00:00', 'SO018', 4), (45, '2024-01-17', '13:00:00', '21:00:00', 'SO019', 1),
(46, '2024-01-17', '22:00:00', '06:00:00', 'SO020', 2), (47, '2024-01-17', '09:00:00', '17:00:00', 'SO021', 3), (48, '2024-01-18', '18:00:00', '02:00:00', 'SO022', 4),
(49, '2024-01-18', '11:00:00', '19:00:00', 'SO023', 1), (50, '2024-01-19', '13:00:00', '21:00:00', 'SO024', 2), (51, '2024-01-19', '09:00:00', '17:00:00', 'SO025', 3),
(52, '2024-01-19', '10:00:00', '18:00:00', 'SO001', 4), (53, '2024-01-20', '21:00:00', '05:00:00', 'SO002', 1), (54, '2024-01-20', '22:00:00', '06:00:00', 'SO003', 2),
(55, '2024-01-20', '08:00:00', '16:00:00', 'SO004', 3), (56, '2024-02-01', '08:00:00', '16:00:00', 'SO001', 2), (57, '2024-02-10', '08:00:00', '16:00:00', 'SO001', 3),
(58, '2024-02-11', '08:00:00', '16:00:00', 'SO001', 4), (59, '2024-02-10', '10:00:00', '14:00:00', 'SO003', 1), (60, '2024-02-20', '06:00:00', '12:00:00', 'SO003', 3),
(61, '2024-02-25', '22:00:00', '06:00:00', 'SO003', 4), (62, '2024-02-15', '10:00:00', '18:00:00', 'SO015', 2), (63, '2024-02-16', '10:00:00', '18:00:00', 'SO015', 3),
(64, '2024-02-17', '10:00:00', '18:00:00', 'SO015', 4), (65, '2023-01-01', '08:00:00', '16:00:00', 'SO001', 1), (66, '2023-01-01', '10:00:00', '18:00:00', 'SO002', 2),
(67, '2023-01-02', '08:00:00', '16:00:00', 'SO003', 3), (68, '2023-01-02', '09:00:00', '17:00:00', 'SO004', 4), (69, '2023-01-03', '18:00:00', '02:00:00', 'SO005', 1),
(70, '2023-01-03', '10:00:00', '18:00:00', 'SO006', 2), (71, '2023-01-04', '22:00:00', '06:00:00', 'SO007', 3), (72, '2023-01-04', '09:00:00', '17:00:00', 'SO008', 4),
(73, '2023-01-04', '18:00:00', '02:00:00', 'SO009', 1), (74, '2023-01-05', '09:00:00', '17:00:000', 'SO010', 2), (75, '2023-01-05', '22:00:00', '06:00:000', 'SO011', 3),
(76, '2023-01-05', '10:00:00', '18:00:000', 'SO012', 4), (77, '2023-01-06', '08:00:00', '16:00:00', 'SO013', 1), (78, '2023-01-06', '10:00:00', '18:00:00', 'SO014', 2),
(79, '2023-01-07', '22:00:00', '06:00:00', 'SO015', 3), (80, '2023-01-07', '08:00:00', '16:00:00', 'SO016', 4), (90, '2023-01-07', '18:00:00', '02:00:00', 'SO017', 1),
(91, '2023-01-07', '22:00:00', '06:00:00', 'SO018', 2), (92, '2023-01-08', '09:00:00', '17:00:00', 'SO019', 3), (93, '2023-01-08', '13:00:00', '21:00:00', 'SO020', 4), 
(94, '2023-01-08', '09:00:00', '17:00:00', 'SO021', 1), (95, '2023-01-08', '08:00:00', '16:00:00', 'SO022', 2), (96, '2023-01-09', '22:00:00', '06:00:00', 'SO023', 3),
(97, '2023-01-09', '18:00:00', '02:00:00', 'SO024', 4), (98, '2023-01-10', '11:00:00', '19:00:00', 'SO025', 1), (99, '2023-01-10', '13:00:00', '21:00:00', 'SO001', 2),
(100, '2023-01-10', '18:00:00', '02:00:00', 'SO002', 3), (101, '2023-01-10', '09:00:00', '17:00:00', 'SO003', 4), (102, '2023-01-11', '10:00:00', '18:00:00', 'SO004', 1),
(103, '2023-01-11', '11:00:00', '19:00:00', 'SO005', 2), (104, '2023-01-12', '08:00:00', '16:00:00', 'SO006', 3), (105, '2023-01-12', '21:00:00', '05:00:00', 'SO007', 4),
(106, '2023-01-12', '22:00:00', '06:00:00', 'SO007', 1), (107, '2023-01-13', '08:00:00', '16:00:00', 'SO008', 2), (110, '2023-01-13', '13:00:00', '21:00:00', 'SO009', 3),
(111, '2023-01-14', '09:00:00', '17:00:00', 'SO010', 4), (112, '2023-01-14', '13:00:00', '21:00:00', 'SO011', 1), (113, '2023-01-14', '08:00:00', '16:00:00', 'SO012', 2),
(114, '2023-01-14', '22:00:00', '06:00:00', 'SO013', 3), (115, '2023-01-15', '11:00:00', '19:00:00', 'SO014', 4), (116, '2023-01-15', '10:00:00', '18:00:00', 'SO015', 1),
(117, '2023-01-16', '13:00:00', '21:00:00', 'SO016', 2), (118, '2023-01-16', '11:00:00', '19:00:00', 'SO017', 3), (119, '2023-01-16', '21:00:00', '05:00:00', 'SO018', 4),
(120, '2023-01-17', '13:00:00', '21:00:00', 'SO019', 1), (121, '2023-01-17', '22:00:00', '06:00:00', 'SO020', 2), (122, '2023-01-17', '09:00:00', '17:00:00', 'SO021', 3),
(123, '2023-01-18', '18:00:00', '02:00:00', 'SO022', 4), (124, '2023-01-18', '11:00:00', '19:00:00', 'SO023', 1), (125, '2023-01-19', '13:00:00', '21:00:00', 'SO024', 2),
(126, '2023-01-19', '09:00:00', '17:00:00', 'SO025', 3), (127, '2023-01-19', '10:00:00', '18:00:00', 'SO001', 4), (128, '2023-01-20', '21:00:00', '05:00:00', 'SO002', 1),
(129, '2023-01-20', '22:00:00', '06:00:00', 'SO003', 2), (130, '2023-01-20', '08:00:00', '16:00:00', 'SO004', 3), (131, '2023-02-01', '08:00:00', '16:00:00', 'SO001', 2),
(132, '2023-02-10', '08:00:00', '16:00:00', 'SO001', 3), (133, '2023-02-11', '08:00:00', '16:00:00', 'SO001', 4), (134, '2023-02-10', '10:00:00', '14:00:00', 'SO003', 1),
(135, '2023-02-20', '06:00:00', '12:00:00', 'SO003', 3), (136, '2023-02-25', '22:00:00', '06:00:00', 'SO003', 4), (137, '2023-02-15', '10:00:00', '18:00:00', 'SO015', 2),
(138, '2023-02-16', '10:00:00', '18:00:00', 'SO015', 3), (139, '2023-02-17', '10:00:00', '18:00:00', 'SO015', 4), (140, '2020-01-01', '08:00:00', '16:00:00', 'SO001', 1),
(141, '2020-01-01', '10:00:00', '18:00:00', 'SO002', 2), (142, '2020-01-02', '08:00:00', '16:00:00', 'SO003', 3), (143, '2020-01-02', '09:00:00', '17:00:00', 'SO004', 4),
(144, '2020-01-03', '18:00:00', '02:00:00', 'SO005', 1), (145, '2020-01-03', '10:00:00', '18:00:00', 'SO006', 2), (150, '2020-01-04', '22:00:00', '06:00:00', 'SO007', 3),
(151, '2020-01-04', '09:00:00', '17:00:00', 'SO008', 4), (152, '2020-01-04', '18:00:00', '02:00:00', 'SO009', 1), (153, '2020-01-05', '09:00:00', '17:00:000', 'SO010', 2),
(154, '2020-01-05', '22:00:00', '06:00:000', 'SO011', 3), (155, '2020-01-05', '10:00:00', '18:00:000', 'SO012', 4), (156, '2020-01-06', '08:00:00', '16:00:00', 'SO013', 1),
(157, '2020-01-06', '10:00:00', '18:00:00', 'SO014', 2), (158, '2020-01-07', '22:00:00', '06:00:00', 'SO015', 3), (159, '2020-01-07', '08:00:00', '16:00:00', 'SO016', 4),
(160, '2020-01-07', '18:00:00', '02:00:00', 'SO017', 1), (161, '2020-01-07', '22:00:00', '06:00:00', 'SO018', 2), (162, '2020-01-08', '09:00:00', '17:00:00', 'SO019', 3),
(163, '2020-01-08', '13:00:00', '21:00:00', 'SO020', 4), (164, '2020-01-08', '09:00:00', '17:00:00', 'SO021', 1), (165, '2020-01-08', '08:00:00', '16:00:00', 'SO022', 2),
(166, '2020-01-09', '22:00:00', '06:00:00', 'SO023', 3), (167, '2020-01-09', '18:00:00', '02:00:00', 'SO024', 4), (168, '2020-01-10', '11:00:00', '19:00:00', 'SO025', 1),
(169, '2020-01-10', '13:00:00', '21:00:00', 'SO001', 2), (170, '2020-01-10', '18:00:00', '02:00:00', 'SO002', 3), (171, '2020-01-10', '09:00:00', '17:00:00', 'SO003', 4),
(172, '2020-01-11', '10:00:00', '18:00:00', 'SO004', 1), (173, '2020-01-11', '11:00:00', '19:00:00', 'SO005', 2), (174, '2020-01-12', '08:00:00', '16:00:00', 'SO006', 3),
(175, '2020-01-12', '21:00:00', '05:00:00', 'SO007', 4), (176, '2020-01-12', '22:00:00', '06:00:00', 'SO007', 1), (177, '2020-01-13', '08:00:00', '16:00:00', 'SO008', 2),
(178, '2020-01-13', '13:00:00', '21:00:00', 'SO009', 3), (179, '2020-01-14', '09:00:00', '17:00:00', 'SO010', 4), (180, '2020-01-14', '13:00:00', '21:00:00', 'SO011', 1),
(181, '2020-01-14', '08:00:00', '16:00:00', 'SO012', 2), (182, '2020-01-14', '22:00:00', '06:00:00', 'SO013', 3), (183, '2020-01-15', '11:00:00', '19:00:00', 'SO014', 4),
(184, '2020-01-15', '10:00:00', '18:00:00', 'SO015', 1), (185, '2020-01-16', '13:00:00', '21:00:00', 'SO016', 2), (186, '2020-01-16', '11:00:00', '19:00:00', 'SO017', 3),
(187, '2020-01-16', '21:00:00', '05:00:00', 'SO018', 4), (188, '2020-01-17', '13:00:00', '21:00:00', 'SO019', 1), (189, '2020-01-17', '22:00:00', '06:00:00', 'SO020', 2),
(190, '2020-01-17', '09:00:00', '17:00:00', 'SO021', 3), (191, '2020-01-18', '18:00:00', '02:00:00', 'SO022', 4), (192, '2020-01-18', '11:00:00', '19:00:00', 'SO023', 1),
(193, '2020-01-19', '13:00:00', '21:00:00', 'SO024', 2), (194, '2020-01-19', '09:00:00', '17:00:00', 'SO025', 3), (195, '2020-01-19', '10:00:00', '18:00:00', 'SO001', 4),
(196, '2020-01-20', '21:00:00', '05:00:00', 'SO002', 1), (197, '2020-01-20', '22:00:00', '06:00:00', 'SO003', 2), (198, '2020-01-20', '08:00:00', '16:00:00', 'SO004', 3),   
(199, '2020-02-01', '08:00:00', '16:00:00', 'SO001', 2), (200, '2020-02-10', '08:00:00', '16:00:00', 'SO001', 3), (201, '2020-02-11', '08:00:00', '16:00:00', 'SO001', 4),
(202, '2020-02-10', '10:00:00', '14:00:00', 'SO003', 1), (203, '2020-02-20', '06:00:00', '12:00:00', 'SO003', 3), (204, '2020-02-25', '22:00:00', '06:00:00', 'SO003', 4),
(205, '2020-02-15', '10:00:00', '18:00:00', 'SO015', 2), (206, '2020-02-16', '10:00:00', '18:00:00', 'SO015', 3), (207, '2020-02-17', '10:00:00', '18:00:00', 'SO015', 4);

#Queries
#Retrieve the top 2 security zones with the highest number of shifts:
EXPLAIN SELECT SZ.ZoneName, COUNT(SS.ShiftID) AS ShiftCount
FROM SECURITY_ZONE SZ
LEFT JOIN SEC_SHIFT SS ON SZ.SecurityZoneID = SS.SecurityZoneID
WHERE YEAR(SS.ShiftDate) = 2024
GROUP BY SZ.ZoneName
ORDER BY ShiftCount DESC
LIMIT 2;

#Nested Query to identify Employees Working in All Security Zones:
EXPLAIN SELECT EmployeeID, FirstName, LastName
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
            AND YEAR(s2.ShiftDate) = 2020
        )
    )
);