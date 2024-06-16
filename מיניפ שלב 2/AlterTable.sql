-- we didn't change the tables at all, and we were not sure if adding Delete on cascade is considered an alter or a constraint.
-- Alter 1 --
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



-- Alter 2 --
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
