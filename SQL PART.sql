use hos;
SELECT * FROM `hospitalisation details`;
update `hospitalisation details`
set `Customer ID` = REPLACE(`Customer ID`,'?','');
update `hospitalisation details`
set `State ID` = REPLACE(`State ID`,'?','');
SET SQL_SAFE_UPDATES = 0;                    
update `medical examinations`
set smoker = REPLACE(smoker,'?','') ;
update `medical examinations`
set smoker = 'Unknown'
where smoker='';
update `hospitalisation details`
set `State ID` = 'Unknown'
where `State ID`='';
delete from `hospitalisation details`
where `Customer ID`='';
update `hospitalisation details`
set month = REPLACE(month,'?','');
update `hospitalisation details`
set month = 'jan'
where month='';
update `hospitalisation details`
set `Hospital tier` = REPLACE(`Hospital tier`,'?','');
update `hospitalisation details`
set `Hospital tier` = 'tier - 1'
where `Hospital tier`='';
update `hospitalisation details`
set `City tier` = REPLACE(`City tier`,'?','');
update `hospitalisation details`
set `City tier` = 'tier - 1'
where `City tier`='';
alter table `hospitalisation details`
add age int;
update `hospitalisation details`
set age =TIMESTAMPDIFF(YEAR, STR_TO_DATE(CONCAT(date, '-', month, '-', year), '%d-%b-%Y'), CURDATE());
SELECT * FROM `medical examinations`;
update `medical examinations`
set `NumberOfMajorSurgeries` = 0
where `NumberOfMajorSurgeries`='No major surgery';
select * from `medical examinations` m left join `hospitalisation details` h
on m.`Customer ID`=h.`Customer ID`;
select count(`Customer ID`) from `medical examinations`
where NumberOfMajorSurgeries >0
group by `Cancer history`
having `Cancer history` ='yes';
select `City tier`,`Hospital tier`,round(avg(charges),2) as Average_charge from `hospitalisation details`
group by `City tier`,`Hospital tier`
order by `City tier`,`Hospital tier`;
SELECT 
    ROUND(avg(m.BMI),2) as avg_BMI,
    ROUND(AVG(age), 0) AS avg_age,
    ROUND(AVG(charges), 2) AS avg_chrge,
    ROUND(AVG(children), 0) AS avg_child
FROM
    `hospitalisation details` as p  join `medical examinations` m on
    p.`Customer ID`=m.`Customer ID`
where HBA1C >5.7 and `Heart Issues`='yes'
group by `Heart Issues`;
 
 




