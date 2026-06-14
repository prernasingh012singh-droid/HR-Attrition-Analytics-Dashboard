CREATE TABLE employee_attrition (
    Age INT,
    Attrition VARCHAR(10),
    BusinessTravel VARCHAR(50),
    DailyRate INT,
    Department VARCHAR(50),
    DistanceFromHome INT,
    Education INT,
    EducationField VARCHAR(50),
    EmployeeCount INT,
    EmployeeNumber INT,
    EnvironmentSatisfaction INT,
    Gender VARCHAR(20),
    HourlyRate INT,
    JobInvolvement INT,
    JobLevel INT,
    JobRole VARCHAR(100),
    JobSatisfaction INT,
    MaritalStatus VARCHAR(20),
    MonthlyIncome INT,
    MonthlyRate INT,
    NumCompaniesWorked INT,
    Over18 VARCHAR(5),
    OverTime VARCHAR(10),
    PercentSalaryHike INT,
    PerformanceRating INT,
    RelationshipSatisfaction INT,
    StandardHours INT,
    StockOptionLevel INT,
    TotalWorkingYears INT,
    TrainingTimesLastYear INT,
    WorkLifeBalance INT,
    YearsAtCompany INT,
    YearsInCurrentRole INT,
    YearsSinceLastPromotion INT,
    YearsWithCurrManager INT
);

SELECT COUNT(*)
FROM employee_attrition;

SELECT * FROM employee_attrition
LIMIT 10;

SELECT COUNT(*) AS Total_Employees
FROM employee_attrition;

SELECT Attrition,
COUNT(*) AS Employee_Count
FROM employee_attrition
GROUP BY Attrition;

SELECT
ROUND(
100.0 * SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
/ COUNT(*),
2
) AS Attrition_Rate
FROM employee_attrition;

SELECT Department,
COUNT(*) AS Attrition_Count
FROM employee_attrition
WHERE Attrition='Yes'
GROUP BY Department
ORDER BY Attrition_Count DESC;

SELECT Gender,
COUNT(*) AS Attrition_Count
FROM employee_attrition
WHERE Attrition='Yes'
GROUP BY Gender;

SELECT OverTime,
COUNT(*) AS Attrition_Count
FROM employee_attrition
WHERE Attrition='Yes'
GROUP BY OverTime;

SELECT Department,
ROUND(AVG(MonthlyIncome),2) AS Avg_Salary
FROM employee_attrition
GROUP BY Department
ORDER BY Avg_Salary DESC;

SELECT EmployeeNumber,
JobRole,
MonthlyIncome
FROM employee_attrition
ORDER BY MonthlyIncome DESC
LIMIT 10;

SELECT JobRole,
COUNT(*) AS Attrition_Count
FROM employee_attrition
WHERE Attrition='Yes'
GROUP BY JobRole
ORDER BY Attrition_Count DESC;

SELECT MaritalStatus,
COUNT(*) AS Attrition_Count
FROM employee_attrition
WHERE Attrition='Yes'
GROUP BY MaritalStatus;

SELECT
YearsAtCompany,
COUNT(*) AS Employees_Left
FROM employee_attrition
WHERE Attrition='Yes'
GROUP BY YearsAtCompany
ORDER BY YearsAtCompany;

SELECT
JobSatisfaction,
COUNT(*) AS Attrition_Count
FROM employee_attrition
WHERE Attrition='Yes'
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;

SELECT
    Department,
    ROUND(
        100.0 * SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS Attrition_Percentage
FROM employee_attrition
GROUP BY Department
ORDER BY Attrition_Percentage DESC;

SELECT
    EducationField,
    COUNT(*) AS Attrition_Count
FROM employee_attrition
WHERE Attrition='Yes'
GROUP BY EducationField
ORDER BY Attrition_Count DESC;

SELECT
    BusinessTravel,
    COUNT(*) AS Attrition_Count
FROM employee_attrition
WHERE Attrition='Yes'
GROUP BY BusinessTravel
ORDER BY Attrition_Count DESC;

SELECT
    WorkLifeBalance,
    COUNT(*) AS Employees_Left
FROM employee_attrition
WHERE Attrition='Yes'
GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance;

SELECT
    JobSatisfaction,
    COUNT(*) AS Employees_Left
FROM employee_attrition
WHERE Attrition='Yes'
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;

SELECT
    JobRole,
    ROUND(AVG(MonthlyIncome),2) AS Avg_Salary
FROM employee_attrition
GROUP BY JobRole
ORDER BY Avg_Salary DESC;

SELECT
    Gender,
    ROUND(AVG(MonthlyIncome),2) AS Avg_Salary
FROM employee_attrition
GROUP BY Gender;

CREATE VIEW department_attrition_summary AS
SELECT
    Department,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(
        100.0 * SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS Attrition_Percentage
FROM employee_attrition
GROUP BY Department;

SELECT * FROM department_attrition_summary;