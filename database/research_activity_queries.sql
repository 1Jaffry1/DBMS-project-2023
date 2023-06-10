
-- 1 all researchers that attended in a research activity in a specific date period
SELECT `Researcher`.* FROM `Research Activity`
JOIN `Agreement`
ON `Research Activity`.`ACT-ID` = `Agreement`.`ACT-ID`
JOIN `Researcher`
ON `Agreement`.RID = `Researcher`.RID
WHERE `Research Activity`.`Start_Date` BETWEEN '2023-05-01' AND'2023-08-01' 
OR `Research Activity`.`End_Date` BETWEEN '2023-07-01' AND'2023-08-01'

-- 2 financial transactions ordered by institute id
SELECT `Finances`.* FROM `Research Activity`
JOIN `Sponsoring`
ON `Research Activity`.`ACT-ID` = `Sponsoring`.`ACT-ID`
JOIN `Institute`
ON `Sponsoring`.InstID = `Institute`.InstID
JOIN `Finances`
ON `Institute`.InstID = `Finances`.InstID
ORDER BY `Finances`.InstID