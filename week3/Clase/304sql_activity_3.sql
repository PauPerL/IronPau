

#1 Get a list of districts ordered by the number of clients (descending order). Name the columns as: District_name and Number_of_clients respectively.

SELECT 
    A2 AS district_name,
    COUNT(DISTINCT client_id) AS Number_of_clients
FROM
    district
        LEFT JOIN client
		ON district.A1 = client.district_id
GROUP BY A2
ORDER BY Number_of_clients DESC;

#2 Get a list of regions ordered by the number of clients (descending order). Name the columns as: Region_name and Number_of_clients respectively.

select * from district;


SELECT 
    A3 as Region_name,
    COUNT(DISTINCT client_id) AS Number_of_clients
FROM
    district
        LEFT JOIN
    client ON district.A1 = client.district_id
GROUP BY Region_name
ORDER BY Number_of_clients DESC;

#3 Get the number of accounts opened by district and year. 
# Name the columns as: District_name, Year and Accounts_opened. Order the results by District_name and Year.

SELECT 
    d.A2 AS District_name,
    left(a.date, 2) as Year,
    COUNT(DISTINCT a.account_id) as  Accounts_opened
FROM
    account a
        LEFT JOIN  district d
        ON d.A1 = a.district_id
GROUP BY District_name, Year
ORDER BY District_name, Year;
