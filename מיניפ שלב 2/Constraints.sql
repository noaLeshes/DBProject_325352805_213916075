-- Constraint 1 --
commit;

alter table trainee
add constraint limit_age_trainee
check (age >= 14)

insert into trainee (subscription, training_plan, health, payment_details, age, joining_date, person_id) 
values ('Basic Membership', 'Sun-Tue Body Sculpt Mon-Wed Spinning', 'Full Health', 'credit card', 11, to_date('21-03-2024', 'dd-mm-yyyy'), 111111111);

select * from trainee


-- Constraint 2 --
commit;

alter table CLASS_LESSON 
modify capacity default 10;

insert into CLASS_LESSON (start_date, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('30-05-2024', 'dd-mm-yyyy'), 'Age:40+  Gender:male  Fitness Level:Intermediate  Medical Conditions:not forpeople with back pain'' +', 
'Body Sculpt', 5000, to_date('11-09-2024', 'dd-mm-yyyy'), 'Tuesday', '16:22', 328828217, 38, 2);

select * from class_lesson
 
-- Constraint 3 --
commit;

alter table person
modify phone number(10) NOT NULL;

insert into PERSON (person_id, gender, full_name, address, email)
values (222222222, 'Female', 'Cris Colb', '00 Sachs Alley', 'ccolb0@tiny.cc');

select * from person



-- Constraint 4 --
-- Create/Recreate primary, unique and foreign key constraints 
alter table USED_IN
  add primary key (CLASS_NUMBER, DEVICE_NUMBER)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table USED_IN
  add foreign key (DEVICE_NUMBER)
  references DEVICE (DEVICE_NUMBER);
alter table USED_IN
  add foreign key (CLASS_NUMBER)
  references CLASS_LESSON (CLASS_NUMBER) on delete cascade;
  
  
  
-- Constraint 5 --
-- Create/Recreate primary, unique and foreign key constraints 
alter table TAKES
  add primary key (PERSON_ID, CLASS_NUMBER)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table TAKES
  add foreign key (PERSON_ID)
  references TRAINEE (PERSON_ID);
alter table TAKES
  add foreign key (CLASS_NUMBER)
  references CLASS_LESSON (CLASS_NUMBER) on delete cascade;
