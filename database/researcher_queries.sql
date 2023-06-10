-- 1 research activity report for specific researcher
SELECT `Research Activity`.* , Researcher.Fname as researcher_firstName , Researcher.Lname as researcher_lastName FROM `Researcher`
JOIN `Agreement`
ON Researcher.RID = Agreement.RID
JOIN `Research Activity`
ON Agreement.`ACT-ID`= `Research Activity`.`ACT-ID`
where Researcher.RID = 1

-- 2 research activity report for specific researcher in a time period
SELECT `Research Activity`.* , Agreement.Role as role , Researcher.Fname as researcher_firstName , Researcher.Lname as researcher_lastName FROM `Researcher`
JOIN `Agreement`
ON Researcher.RID = Agreement.RID
JOIN `Research Activity`
ON Agreement.`ACT-ID`= `Research Activity`.`ACT-ID`
where Researcher.RID = 1 
AND `Research Activity`.`Start_Date` BETWEEN '2023-05-01' AND'2023-08-01' 
OR `Research Activity`.`End_Date` BETWEEN '2023-07-01' AND'2023-08-01'

-- 3 financial report for specific researcher (transactions in research activities)
SELECT DISTINCT(`Transaction`.NUM) , `Transaction`.* FROM `Researcher`
JOIN `Agreement`
ON Researcher.RID = Agreement.RID
JOIN `Research Activity`
ON Agreement.`ACT-ID`= `Research Activity`.`ACT-ID`
JOIN `Transaction`
ON `Research Activity`.`ACT-ID` = `Transaction`.`ACT-ID`
where `Transaction`.RID = 1 