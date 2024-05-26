CREATE TABLE person
(
  person_id NUMERIC(10) NOT NULL,
  gender VARCHAR(15) NOT NULL,
  full_name VARCHAR(50) NOT NULL,
  phone NUMERIC(10) NOT NULL,
  address VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  PRIMARY KEY (person_id)
);

CREATE TABLE coach
(
  speciality VARCHAR(50) NOT NULL,
  salary NUMERIC(15) NOT NULL,
  experience VARCHAR(50) NOT NULL,
  person_id NUMERIC(10) NOT NULL,
  PRIMARY KEY (person_id),
  FOREIGN KEY (person_id) REFERENCES person(person_id)
);

CREATE TABLE trainee
(
  subscription VARCHAR(50) NOT NULL,
  training_plan VARCHAR(50) NOT NULL,
  health VARCHAR(50) NOT NULL,
  payment_details VARCHAR(50) NOT NULL,
  age NUMERIC(5) NOT NULL,
  joining_date DATE NOT NULL,
  person_id NUMERIC(10) NOT NULL,
  PRIMARY KEY (person_id),
  FOREIGN KEY (person_id) REFERENCES person(person_id)
);

CREATE TABLE gym
(
  address VARCHAR(50) NOT NULL,
  schedule VARCHAR(50) NOT NULL,
  gym_number NUMERIC(5) NOT NULL,
  gym_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (gym_number)
);

CREATE TABLE trains_in
(
  gym_number NUMERIC(5) NOT NULL,
  person_id NUMERIC(10) NOT NULL,
  PRIMARY KEY (gym_number, person_id),
  FOREIGN KEY (gym_number) REFERENCES gym(gym_number),
  FOREIGN KEY (person_id) REFERENCES trainee(person_id)
);

CREATE TABLE hall
(
  capacity NUMERIC(5) NOT NULL,
  schedule VARCHAR(50) NOT NULL,
  hall_number NUMERIC(5) NOT NULL,
  gym_number NUMERIC(5) NOT NULL,
  PRIMARY KEY (hall_number, gym_number),
  FOREIGN KEY (gym_number) REFERENCES gym(gym_number)
);

CREATE TABLE class_lesson
(
  start_date DATE NOT NULL,
  capacity NUMERIC(5) NOT NULL,
  terms VARCHAR(100) NOT NULL,
  class_name VARCHAR(15) NOT NULL,
  class_number NUMERIC(5) NOT NULL,
  finish_date DATE NOT NULL,
  class_day VARCHAR(15) NOT NULL,
  class_hour VARCHAR(15) NOT NULL,
  person_id NUMERIC(10) NOT NULL,
  hall_number NUMERIC(5) NOT NULL,
  gym_number NUMERIC(5) NOT NULL,
  PRIMARY KEY (class_number),
  FOREIGN KEY (person_id) REFERENCES coach(person_id),
  FOREIGN KEY (hall_number, gym_number) REFERENCES hall(hall_number, gym_number)
);

CREATE TABLE device
(
  device_model VARCHAR(50) NOT NULL,
  device_number NUMERIC(10) NOT NULL,
  instructions VARCHAR(50) NOT NULL,
  hall_number NUMERIC(5) NOT NULL,
  gym_number NUMERIC(5) NOT NULL,
  PRIMARY KEY (device_number),
  FOREIGN KEY (hall_number, gym_number) REFERENCES hall(hall_number, gym_number)
);

CREATE TABLE used_in
(
  class_number NUMERIC(5) NOT NULL,
  device_number NUMERIC(10) NOT NULL,
  PRIMARY KEY (class_number, device_number),
  FOREIGN KEY (class_number) REFERENCES class_lesson(class_number),
  FOREIGN KEY (device_number) REFERENCES device(device_number)
);

CREATE TABLE takes
(
  person_id NUMERIC(10) NOT NULL,
  class_number NUMERIC(5) NOT NULL,
  PRIMARY KEY (person_id, class_number),
  FOREIGN KEY (person_id) REFERENCES trainee(person_id),
  FOREIGN KEY (class_number) REFERENCES class_lesson(class_number)
);
