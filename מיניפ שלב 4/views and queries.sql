--view 1:--

CREATE VIEW device_info AS
SELECT 
    d.device_number,
    d.device_model,
    d.instructions,
    d.hall_number,
    d.gym_number,
    h.schedule AS hall_schedule,
    g.address AS gym_address,
    g.gym_name AS gym_name,
    l.lessonid,
    l.classid,
    l.start_date AS lesson_start_date,
    gc.classname
FROM 
    device d
LEFT JOIN hall h ON d.hall_number = h.hall_number AND d.gym_number = h.gym_number
LEFT JOIN gym g ON d.gym_number = g.gym_number
LEFT JOIN used_in ui ON d.device_number = ui.device_number
LEFT JOIN lesson l ON ui.class_number = l.classid
LEFT JOIN gym_class gc ON l.classid = gc.classid;

select * from device_info

drop view device_info


   --query 1:--

SELECT 
    gym_name,
    COUNT(DISTINCT device_number) AS total_devices,
    COUNT(DISTINCT classid) AS classes_using_devices
FROM 
    device_info
GROUP BY 
    gym_name
ORDER BY 
    total_devices DESC;
    
    
    --query 2:--
    
SELECT 
    di.gym_name,
    di.device_number,
    di.device_model,
    di.hall_number
FROM 
    device_info di
WHERE 
    di.lessonid IS NULL
    OR di.lesson_start_date > SYSDATE
GROUP BY 
    di.gym_name,
    di.device_number,
    di.device_model,
    di.hall_number
ORDER BY 
    di.gym_name,
    di.device_number;
    
    
    
    
--view 2:--

CREATE VIEW class_info2 AS
SELECT 
    l.lessonid,
    l.classid,
    l.rating,
    l.start_date,
    l.gym_number,
    l.roomnum,
    l.personid AS trainer_personid,
    p.first_name || ' ' || p.last_name trainer_full_name,
    gc.classname,
    gc.capacity,
    gc.maxage,
    gc.minage,
    gc.duration,
    t.speciality AS trainer_specialty,
    t.salary AS trainer_salary,
    t.experience AS trainer_experience,
    t.license AS trainer_license,
    pp.phone AS trainer_phone,
    mc.MEDICAL_CONSTRAINS
FROM 
    lesson l
 join person p on p.personid = l.personid
 JOIN gym_class gc ON l.classid = gc.classid
 JOIN trainer t ON l.personid = t.personid
 JOIN person_phone pp ON pp.personid = t.personid
 JOIN GYM_CLASS_MEDICAL_CONSTRAINS mc ON mc.classid = gc.classid

select * from class_info2


   --query 1:--


SELECT 
    ci.classname,
    count(DISTINCT ci.lessonid) as number_of_lessons,
    AVG(ci.rating) AS avg_rating,
    trainer_personid,
    ci.trainer_full_name,
    ci.gym_number,
    AVG(ci.duration) AS avg_duration,
    count(DISTINCT ci.MEDICAL_CONSTRAINS) AS num_medical_constraints,
    min(ci.start_date) AS closest_class_date
FROM 
    class_info2 ci
WHERE
    ci.start_date >= TRUNC(SYSDATE)
GROUP BY 
    ci.classname, ci.trainer_personid, ci.gym_number, ci.trainer_full_nam
ORDER BY 
    avg_rating DESC, closest_class_date DESC




--query 2:--

SELECT 
        classid,
        gym_number,
        classname,
        CASE 
            WHEN minage < 18 THEN 'Youth (under 18)'
            WHEN minage BETWEEN 18 AND 30 THEN 'Young Adult (18-30)'
            WHEN minage BETWEEN 31 AND 50 THEN 'Adult (31-50)'
            ELSE 'Senior (51+)'
        END AS age_category,
        minage,
        maxage,
    min(start_date) AS closest_class_date,
        duration,
        AVG(rating) AS avg_rating
    FROM class_info2
    WHERE
    start_date >= TRUNC(SYSDATE)
    GROUP BY classid, gym_number, classname, minage, maxage, duration
