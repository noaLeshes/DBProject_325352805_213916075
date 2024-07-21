-- Add/modify columns - PERSON
alter table PERSON rename column address to street;
alter table PERSON modify "street" null;
      -- insert data into PERSON
      INSERT INTO PERSON (PERSON_ID, BIRTH_DATE, FIRST_NAME, LAST_NAME, CITY, STREET, HOUSE_NUM, EMAIL, GENDER)
      SELECT PERSON_ID, 
            	 NULL, 
               NULL, 
               FULL_NAME, 
               'Unknown', 
               ADDRESS, 
               NULL, 
               EMAIL, 
               CASE 
                   WHEN GENDER = 'Female' THEN 'f'
                   WHEN GENDER = 'Male' THEN 'm'
                   ELSE NULL
               END
       FROM PERSON
       WHERE PERSON_ID NOT IN (SELECT PERSON_ID FROM PERSON2);






-- Add/modify columns - GYM_MEMBER 
alter table GYM_MEMBER add payment_details varchar2(50);
alter table GYM_MEMBER add age number(5);
alter table GYM_MEMBER add subscription varchar2(50);
alter table GYM_MEMBER add training_plan varchar2(50);
-- adjust foreign keys 
alter table gym_member
add constraint f_k_person_id
foreign key  (personid) references person(personid)
            -- insert data into GYM_MEMBER
            INSERT INTO gym_member (JOINDATE, LEAVEDATE, PERSONID, PAYMENT_DETAILS,age,subscription,training_plan)
            SELECT 
                t.joining_date,
                null,
                t.person_id,
                t.payment_details,
                t.age,
                t.subscription,
                t.training_plan
            FROM trainee t
            WHERE t.person_id NOT IN (SELECT personid FROM GYM_member);






-- Add/modify columns - GYM_CLASS
alter table GYM_CLASS add capacity number(5);
            -- insert data into GYM_CLASS
            INSERT INTO GYM_CLASS (classid , classname, minage, maxage, duration, capacity)
            SELECT class_number,
                   class_name,
                   CASE 
                         WHEN REGEXP_LIKE(TRIM(TERMS), 'Age:\s*([0-9]+)\s*[-]\s*([0-9]+)') THEN TO_NUMBER(REGEXP_SUBSTR(TRIM(TERMS), 'Age:\s*([0-9]+)\s*-\s*([0-9]+)', 1, 1, NULL, 1))
                         WHEN REGEXP_LIKE(TRIM(TERMS), 'Age:\s*([0-9]+)\s*\+') THEN TO_NUMBER(REGEXP_SUBSTR(TRIM(TERMS), 'Age:\s*([0-9]+)\s*\+', 1, 1, NULL, 1))
                          ELSE NULL
                   END AS MINAGE,
                   CASE 
                         WHEN REGEXP_LIKE(TRIM(TERMS), 'Age:\s*([0-9]+)\s*\+') THEN 99
                         WHEN REGEXP_LIKE(TRIM(TERMS), 'Age:\s*([0-9]+)\s*[-]\s*([0-9]+)') THEN TO_NUMBER(REGEXP_SUBSTR(TRIM(TERMS), 'Age:\s*[0-9]+\s*-\s*([0-9]+)', 1, 1, NULL, 1))
                         ELSE NULL
              END AS MAXAGE,
                   (FINISH_DATE - START_DATE) AS DURATION,
                   capacity
            FROM class_lesson
            WHERE class_number NOT IN (SELECT classid FROM GYM_CLASS);






 -- Add/modify columns - LESSON
alter table LESSON rename column lessondate to START_DATE;
alter table LESSON add gym_number number(5);
-- adjust foreign keys 
alter table lesson drop constraint SYS_C007227
alter table lesson
add constraint f_k_hall
foreign key  (ROOMNUM, gym_number) references hall(hall_number, gym_number)
            -- insert data into LESSON
            INSERT INTO lesson (start_date, lessonid, rating, classid, roomnum, personid, finish_date, class_day, class_hour, gym_number)
            SELECT 
                cl.start_date,
                (SELECT COALESCE(MAX(lessonid), 0) + ROW_NUMBER() OVER (ORDER BY cl.start_date) FROM lesson) AS lessonid,
                NULL AS rating,
                cl.class_number AS classid,
                cl.hall_number AS roomnum,
                cl.person_id AS personid,
                cl.finish_date AS finish_date,
                cl.class_day AS class_day,
                cl.class_hour AS class_hour,
                cl.gym_number AS gym_number
            FROM 
                class_lesson cl
            WHERE  
                cl.class_number  IN (SELECT classid FROM lesson)
            -- update data in LESSON
            UPDATE lesson l
            SET l.gym_number = (
                SELECT h.gym_number
                FROM hall h
                WHERE h.hall_number = l.roomnum)
            WHERE EXISTS (
                SELECT 1
                FROM hall h
                WHERE h.hall_number = l.roomnum);





-- Add/modify columns - TRAINER
alter table TRAINER add speciality varchar2(50);
alter table TRAINER add salary number(15);
-- adjust foreign keys 
alter table trainer
add constraint F_K_TPERSON_ID foreign key (PERSONID)
references PERSON (PERSONID);
            -- insert data into TRAINER
            INSERT INTO TRAINER (LICENSE, EXPERIENCE, PERSONID, SPECIALITY, SALARY)
            SELECT LICENSE,
                   TO_NUMBER(REGEXP_SUBSTR(EXPERIENCE, '^[0-9]+')), -- Extract the numeric part of the experience
                   PERSON_ID,
                   SPECIALITY,
                   SALARY
            FROM COACH
            WHERE PERSON_ID NOT IN (SELECT PERSONID FROM TRAINER);






-- Add/modify columns - TRAINS_IN
-- adjust foreign keys 
alter table trains_in drop constraint SYS_C007525 
alter table trains_in
add constraint f_k_gym_member
foreign key  (PERSON_ID) references gym_member(PERSONID)






-- Add/modify columns - USED_IN
-- adjust foreign keys 
alter table used_in drop constraint SYS_C007342 
alter table used_in
add constraint f_k_gym_class
foreign key  (class_number) references gym_class(classid)






-- Add/modify columns - PERSONPHONE
-- adjust foreign keys 
alter table person_phone
add constraint f_k_phone_person_id
foreign key  (personid) references person(personid)





-- Add/modify columns - HALL
            -- insert data into HALL
            INSERT INTO HALL (CAPACITY, SCHEDULE, HALL_NUMBER, GYM_NUMBER)
            SELECT 
                r.CAPACITY,
                null,
                r.ROOMNUM AS HALL_NUMBER,
                (SELECT GYM_NUMBER 
                 FROM (SELECT GYM_NUMBER FROM GYM ORDER BY DBMS_RANDOM.VALUE)
                 WHERE ROWNUM = 1) AS GYM_NUMBER
            FROM ROOM r
            WHERE NOT EXISTS (
                SELECT 1 
                FROM HALL h 
                WHERE h.HALL_NUMBER = r.ROOMNUM);





-- Add/modify columns - TAKES_LESSON
            -- insert data into TAKES_LESSON
            INSERT INTO takes_lesson (lessonid, classid, PERSONID)
            SELECT 
                l.lessonid,
                t.class_number,
                t.person_id
            FROM takes t
             inner join lesson l on t.class_number = l.classid
            WHERE t.person_id NOT IN (SELECT personid FROM GYM_member);

