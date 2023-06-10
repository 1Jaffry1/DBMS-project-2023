
-- 1 find researchers for specific institute
SELECT `Researcher`.* , Institute.`Name` as institute_name FROM `Institute`
JOIN `edRecord`
ON `Institute`.InstID = `edRecord`.Inst_id
JOIN `Researcher`
ON `edRecord`.RID = `Researcher`.RID
JOIN `Agreement`
ON Researcher.RID = `Agreement`.`RID`
where Institute.InstID = 1

-- 2 get financial report for specific institute
SELECT `Finances`.* , Institute.`Name` as institute_name FROM `Institute`
JOIN `Finances`
ON `Institute`.InstID = `Finances`.InstID
where Institute.InstID = 1

-- 3 find research topic range for specific institute
SELECT DISTINCT(Topic.Topic) , Institute.`Name` as institute_name FROM `Institute`
JOIN `Sponsoring`
ON Institute.InstID = `Sponsoring`.InstID
JOIN `Research Activity`
ON Sponsoring.`ACT-ID` = `Research Activity`.`ACT-ID`
JOIN `Has_topic`
ON `Research Activity`.`ACT-ID` = Has_topic.`Act-ID`
JOIN Topic
ON Has_topic.TopicID = Topic.TopicID
where Institute.InstID = 1

-- 4 find all research activities for specific institute
SELECT `Research Activity`.* , Institute.`Name` as institute_name FROM `Institute`
JOIN `Sponsoring`
ON Institute.InstID = `Sponsoring`.InstID
JOIN `Research Activity`
ON Sponsoring.`ACT-ID` = `Research Activity`.`ACT-ID`
where Institute.InstID = 1