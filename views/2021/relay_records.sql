CREATE VIEW `relay_records` AS
SELECT 
  'Q' AS `type`,
  `E`.`D_ABBV` AS `teamcode`,
  `E`.`DELEGATION` AS `teamname`,
  'A' AS `letter`,
  `E`.`GENDER` AS `gender`,
  MAX(`E`.`AGE`) AS `age`,
  `E`.`EVENT_SHOR` AS `event`,
  CONCAT(TIME_FORMAT(SEC_TO_TIME(`E`.`QUALIFYING`),'%i:%s'),'.00') AS `seed`,
  'M' AS `measure`,
  `E`.`division` AS `division`,
  '' AS `finish`,
  '' AS `status`,
  `E`.`TEAM` AS `note`,
  '' AS `spare1`,
  '' AS `spare2`,
  GROUP_CONCAT(
    SUBSTRING_INDEX(`E`.`NAME`,',',1),';',
    SUBSTRING_INDEX(`E`.`NAME`,',',-(1)),';',
    '',';',
    `E`.`GENDER`,';',
    DATE_FORMAT(`E`.`DOB`,'%m/%d/%Y'),';',
    `E`.`AGE`,';',
    '',';',
    `E`.`BIB` SEPARATOR ';') AS `Name_exp_16`
FROM `Entries` `E`
WHERE (`E`.`EVENT_TYPE` = 'Q')
GROUP BY `E`.`FIN_DIV`,`E`.`TEAM`
