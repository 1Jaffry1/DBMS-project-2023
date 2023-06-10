
-- 1 research teams divided based on research activity
SELECT `Researcher`.* , `Research Activity`.`ACT-ID` FROM `Researcher`
JOIN `Agreement`
ON `Researcher`.RID = `Agreement`.RID
JOIN `Research Activity`
ON `Agreement`.`ACT-ID` = `Research Activity`.`ACT-ID`
ORDER BY `Research Activity`.`ACT-ID`

-- 1 or research teams members count in each research activity

SELECT COUNT(0) as researchers_count , `Research Activity`.`ACT-ID` FROM `Researcher`
JOIN `Agreement`
ON `Researcher`.RID = `Agreement`.RID
JOIN `Research Activity`
ON `Agreement`.`ACT-ID` = `Research Activity`.`ACT-ID`
GROUP BY `Research Activity`.`ACT-ID`

-- 2 research teams divided based on research activity topics
SELECT `Researcher`.* , `Topic`.`Topic` FROM `Researcher`
JOIN `Agreement`
ON `Researcher`.RID = `Agreement`.RID
JOIN `Research Activity`
ON `Agreement`.`ACT-ID` = `Research Activity`.`ACT-ID`
JOIN `Has_topic`
ON `Research Activity`.`ACT-ID` = Has_topic.`Act-ID`
JOIN Topic
ON Has_topic.TopicID = Topic.TopicID
ORDER BY Topic.Topic