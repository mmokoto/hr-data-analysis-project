
-- Create database
CREATE DATABASE IF NOT EXISTS hr_analytics;
USE hr_analytics;

-- Create table
CREATE TABLE IF NOT EXISTS hr_data_cleaned (
    EmpID INT,
    Age INT,
    AgeGroup VARCHAR(20),
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
    Gender VARCHAR(10),
    HourlyRate INT,
    JobInvolvement INT,
    JobLevel INT,
    JobRole VARCHAR(50),
    JobSatisfaction INT,
    MaritalStatus VARCHAR(20),
    MonthlyIncome DECIMAL(10,2),
    SalarySlab VARCHAR(20),
    MonthlyRate INT,
    NumCompaniesWorked INT,
    Over18 VARCHAR(5),
    OverTime VARCHAR(5),
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
    YearsWithCurrManager INT,
    PromotionStatus VARCHAR(10)
);

-- Sample Queries:

-- 1. Count of employees ready for promotion
SELECT COUNT(*) AS ReadyForPromotion
FROM hr_data_cleaned
WHERE PromotionStatus = 'Ready';

-- 2. Average income by performance rating
SELECT PerformanceRating, AVG(MonthlyIncome) AS AvgIncome
FROM hr_data_cleaned
GROUP BY PerformanceRating;

-- 3. Promotion readiness by JobRole
SELECT JobRole, COUNT(*) AS ReadyCount
FROM hr_data_cleaned
WHERE PromotionStatus = 'Ready'
GROUP BY JobRole
ORDER BY ReadyCount DESC;

-- 4. Salary comparison for high performers
SELECT JobRole, AVG(MonthlyIncome) AS AvgHighPerfIncome
FROM hr_data_cleaned
WHERE PerformanceRating = 4
GROUP BY JobRole
ORDER BY AvgHighPerfIncome ASC;

-- 5. Pay-performance alignment check
SELECT JobRole, PerformanceRating, AVG(MonthlyIncome) AS AvgIncome
FROM hr_data_cleaned
GROUP BY JobRole, PerformanceRating
ORDER BY JobRole, PerformanceRating;
