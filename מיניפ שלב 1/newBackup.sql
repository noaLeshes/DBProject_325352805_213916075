prompt PL/SQL Developer import file
prompt Created on יום ראשון 26 מאי 2024 by USER
set feedback off
set define off
prompt Creating PERSON...
create table PERSON
(
  person_id NUMBER(10) not null,
  gender    VARCHAR2(15) not null,
  full_name VARCHAR2(50) not null,
  phone     NUMBER(10) not null,
  address   VARCHAR2(50) not null,
  email     VARCHAR2(50) not null
)
;
alter table PERSON
  add primary key (PERSON_ID)
;

prompt Creating COACH...
create table COACH
(
  speciality VARCHAR2(50) not null,
  salary     NUMBER(15) not null,
  experience VARCHAR2(50) not null,
  person_id  NUMBER(10) not null
)
;
alter table COACH
  add primary key (PERSON_ID)
;
alter table COACH
  add foreign key (PERSON_ID)
  references PERSON (PERSON_ID);

prompt Creating GYM...
create table GYM
(
  address    VARCHAR2(50) not null,
  schedule   VARCHAR2(50) not null,
  gym_number NUMBER(5) not null,
  gym_name   VARCHAR2(50) not null
)
;
alter table GYM
  add primary key (GYM_NUMBER)
 ;

prompt Creating HALL...
create table HALL
(
  capacity    NUMBER(5) not null,
  schedule    VARCHAR2(50) not null,
  hall_number NUMBER(5) not null,
  gym_number  NUMBER(5) not null
)
;
alter table HALL
  add primary key (HALL_NUMBER, GYM_NUMBER)
 ;
alter table HALL
  add foreign key (GYM_NUMBER)
  references GYM (GYM_NUMBER);

prompt Creating CLASS_LESSON...
create table CLASS_LESSON
(
  start_date   DATE not null,
  capacity     NUMBER(5) not null,
  terms        VARCHAR2(100) not null,
  class_name   VARCHAR2(15) not null,
  class_number NUMBER(5) not null,
  finish_date  DATE not null,
  class_day    VARCHAR2(15) not null,
  class_hour   VARCHAR2(15) not null,
  person_id    NUMBER(10) not null,
  hall_number  NUMBER(5) not null,
  gym_number   NUMBER(5) not null
)
;
alter table CLASS_LESSON
  add primary key (CLASS_NUMBER)
;
alter table CLASS_LESSON
  add foreign key (PERSON_ID)
  references COACH (PERSON_ID);
alter table CLASS_LESSON
  add foreign key (HALL_NUMBER, GYM_NUMBER)
  references HALL (HALL_NUMBER, GYM_NUMBER);

prompt Creating DEVICE...
create table DEVICE
(
  device_model  VARCHAR2(50) not null,
  device_number NUMBER(10) not null,
  instructions  VARCHAR2(50) not null,
  hall_number   NUMBER(5) not null,
  gym_number    NUMBER(5) not null
)
;
alter table DEVICE
  add primary key (DEVICE_NUMBER)
 ;
alter table DEVICE
  add foreign key (HALL_NUMBER, GYM_NUMBER)
  references HALL (HALL_NUMBER, GYM_NUMBER);

prompt Creating TRAINEE...
create table TRAINEE
(
  subscription    VARCHAR2(50) not null,
  training_plan   VARCHAR2(50) not null,
  health          VARCHAR2(50) not null,
  payment_details VARCHAR2(50) not null,
  age             NUMBER(5) not null,
  joining_date    DATE not null,
  person_id       NUMBER(10) not null
)
;
alter table TRAINEE
  add primary key (PERSON_ID)
  ;
alter table TRAINEE
  add foreign key (PERSON_ID)
  references PERSON (PERSON_ID);

prompt Creating TAKES...
create table TAKES
(
  person_id    NUMBER(10) not null,
  class_number NUMBER(5) not null
)
;
alter table TAKES
  add primary key (PERSON_ID, CLASS_NUMBER)
 ;
alter table TAKES
  add foreign key (PERSON_ID)
  references TRAINEE (PERSON_ID);
alter table TAKES
  add foreign key (CLASS_NUMBER)
  references CLASS_LESSON (CLASS_NUMBER);

prompt Creating TRAINS_IN...
create table TRAINS_IN
(
  gym_number NUMBER(5) not null,
  person_id  NUMBER(10) not null
)
;
alter table TRAINS_IN
  add primary key (GYM_NUMBER, PERSON_ID)
;
alter table TRAINS_IN
  add foreign key (GYM_NUMBER)
  references GYM (GYM_NUMBER);
alter table TRAINS_IN
  add foreign key (PERSON_ID)
  references TRAINEE (PERSON_ID);

prompt Creating USED_IN...
create table USED_IN
(
  class_number  NUMBER(5) not null,
  device_number NUMBER(10) not null
)
;
alter table USED_IN
  add primary key (CLASS_NUMBER, DEVICE_NUMBER)
  ;
alter table USED_IN
  add foreign key (CLASS_NUMBER)
  references CLASS_LESSON (CLASS_NUMBER);
alter table USED_IN
  add foreign key (DEVICE_NUMBER)
  references DEVICE (DEVICE_NUMBER);

prompt Disabling triggers for PERSON...
alter table PERSON disable all triggers;
prompt Disabling triggers for COACH...
alter table COACH disable all triggers;
prompt Disabling triggers for GYM...
alter table GYM disable all triggers;
prompt Disabling triggers for HALL...
alter table HALL disable all triggers;
prompt Disabling triggers for CLASS_LESSON...
alter table CLASS_LESSON disable all triggers;
prompt Disabling triggers for DEVICE...
alter table DEVICE disable all triggers;
prompt Disabling triggers for TRAINEE...
alter table TRAINEE disable all triggers;
prompt Disabling triggers for TAKES...
alter table TAKES disable all triggers;
prompt Disabling triggers for TRAINS_IN...
alter table TRAINS_IN disable all triggers;
prompt Disabling triggers for USED_IN...
alter table USED_IN disable all triggers;
prompt Disabling foreign key constraints for COACH...
alter table COACH disable constraint SYS_C007226;
prompt Disabling foreign key constraints for HALL...
alter table HALL disable constraint SYS_C007251;
prompt Disabling foreign key constraints for CLASS_LESSON...
alter table CLASS_LESSON disable constraint SYS_C007264;
alter table CLASS_LESSON disable constraint SYS_C007265;
prompt Disabling foreign key constraints for DEVICE...
alter table DEVICE disable constraint SYS_C007272;
prompt Disabling foreign key constraints for TRAINEE...
alter table TRAINEE disable constraint SYS_C007235;
prompt Disabling foreign key constraints for TAKES...
alter table TAKES disable constraint SYS_C007281;
alter table TAKES disable constraint SYS_C007282;
prompt Disabling foreign key constraints for TRAINS_IN...
alter table TRAINS_IN disable constraint SYS_C007244;
alter table TRAINS_IN disable constraint SYS_C007245;
prompt Disabling foreign key constraints for USED_IN...
alter table USED_IN disable constraint SYS_C007276;
alter table USED_IN disable constraint SYS_C007277;
prompt Deleting USED_IN...
delete from USED_IN;
commit;
prompt Deleting TRAINS_IN...
delete from TRAINS_IN;
commit;
prompt Deleting TAKES...
delete from TAKES;
commit;
prompt Deleting TRAINEE...
delete from TRAINEE;
commit;
prompt Deleting DEVICE...
delete from DEVICE;
commit;
prompt Deleting CLASS_LESSON...
delete from CLASS_LESSON;
commit;
prompt Deleting HALL...
delete from HALL;
commit;
prompt Deleting GYM...
delete from GYM;
commit;
prompt Deleting COACH...
delete from COACH;
commit;
prompt Deleting PERSON...
delete from PERSON;
commit;
prompt Loading PERSON...
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (661651573, 'Female', 'Cris Colbourn', 554854979, '00 Sachs Alley', 'ccolbourn0@tiny.cc');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (652621999, 'Female', 'Katharina Le Marquis', 566667146, '81 Melrose Crossing', 'kle1@hc360.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (949328161, 'Female', 'Maisey Guerreiro', 553952016, '4 Annamark Drive', 'mguerreiro2@yahoo.co.jp');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (997116426, 'Female', 'Magda Tomala', 544514028, '57035 Fair Oaks Junction', 'mtomala3@java.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (510896901, 'Male', 'Ronald Waldrum', 564146301, '03478 Mccormick Point', 'rwaldrum4@php.net');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (398712524, 'Female', 'Brande Hassekl', 596497883, '94966 Artisan Parkway', 'bhassekl5@tiny.cc');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (765824624, 'Male', 'Randolf Andresser', 594509665, '975 Autumn Leaf Park', 'randresser6@noaa.gov');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (725658881, 'Female', 'Nollie Pedrocchi', 510643837, '10922 Glacier Hill Place', 'npedrocchi7@twitpic.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (287056883, 'Female', 'Alene Bour', 586776369, '7209 Lawn Crossing', 'abour8@livejournal.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (894465652, 'Female', 'Indira Faircliff', 506143948, '947 Brentwood Street', 'ifaircliff9@squidoo.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (735014216, 'Male', 'Alexei Zink', 591612215, '91524 Mcbride Center', 'azinka@economist.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (430953154, 'Male', 'Chariot Cosin', 565048102, '41 Victoria Parkway', 'ccosinb@prnewswire.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (940153696, 'Male', 'Judas Najara', 562006755, '80 Warner Place', 'jnajarac@scribd.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (310135900, 'Male', 'Elmo Childerley', 549748505, '80 Sycamore Junction', 'echilderleyd@flavors.me');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (548380542, 'Female', 'Randee Scudder', 537135373, '6660 Starling Alley', 'rscuddere@sciencedirect.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (332700112, 'Male', 'Frederico Ashdown', 557078119, '29 Buell Point', 'fashdownf@barnesandnoble.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (631209336, 'Male', 'Allard Birds', 576848517, '5 Grayhawk Street', 'abirdsg@hao123.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (780381836, 'Female', 'Persis Seint', 508563771, '48905 Butterfield Plaza', 'pseinth@google.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (860618977, 'Male', 'Paul Boorn', 581664626, '9906 Gulseth Plaza', 'pboorni@java.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (358254239, 'Female', 'Eleonore Scorah', 568311251, '744 Troy Drive', 'escorahj@abc.net.au');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (642238011, 'Male', 'Kenny Halle', 564010281, '43 Logan Trail', 'khallek@mail.ru');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (394441189, 'Male', 'Garold Novkovic', 553327208, '170 Menomonie Lane', 'gnovkovicl@delicious.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (64054988, 'Male', 'Murdock Ackred', 537894380, '543 Ruskin Parkway', 'mackredm@fema.gov');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (988561837, 'Male', 'Raleigh Capewell', 598102192, '385 Delladonna Hill', 'rcapewelln@baidu.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (925118421, 'Male', 'Jorge Goldney', 575999143, '597 Schlimgen Circle', 'jgoldneyo@mayoclinic.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (225440261, 'Male', 'Maison Le Provest', 578682351, '026 Amoth Avenue', 'mlep@creativecommons.org');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (974885124, 'Male', 'Elijah Sarfatti', 537654720, '6 Superior Trail', 'esarfattiq@yale.edu');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (381474529, 'Male', 'Haily Davys', 550764787, '55 American Street', 'hdavysr@ihg.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (680741899, 'Male', 'Baryram Swannie', 562368622, '8584 Moulton Center', 'bswannies@flavors.me');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (685290986, 'Female', 'Licha Shimmans', 533184168, '0518 Maple Place', 'lshimmanst@domainmarket.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (779786218, 'Male', 'Valentijn Stubbings', 562163668, '10 Blue Bill Park Circle', 'vstubbingsu@tumblr.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (325851770, 'Female', 'Andriette Sturr', 582694767, '961 Mendota Hill', 'asturrv@marketwatch.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (992910786, 'Male', 'Conroy Ceney', 521564857, '36816 Columbus Drive', 'cceneyw@loc.gov');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (644624124, 'Female', 'Elfrida Pickburn', 531784464, '32469 Pierstorff Street', 'epickburnx@yelp.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (435490677, 'Female', 'Sondra Tatnell', 557868743, '28 Karstens Alley', 'statnelly@unicef.org');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (336899848, 'Female', 'Philly Tugman', 590630914, '758 8th Terrace', 'ptugmanz@discovery.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (320952651, 'Male', 'Brennen Ruppel', 573040250, '167 American Parkway', 'bruppel10@artisteer.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (695131325, 'Male', 'Dylan Conningham', 539064556, '70614 Pierstorff Avenue', 'dconningham11@slideshare.net');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (383155495, 'Male', 'Way Berrisford', 581000464, '76 Grayhawk Plaza', 'wberrisford12@yahoo.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (359987794, 'Female', 'Gwenora Ferrand', 568193684, '68711 Bluejay Road', 'gferrand13@geocities.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (316868247, 'Male', 'Lamond Rosenshine', 564975033, '529 Hooker Hill', 'lrosenshine14@prnewswire.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (552269406, 'Female', 'Kial Blore', 511682024, '49 Corben Street', 'kblore15@phpbb.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (314721452, 'Male', 'Wat Weadick', 577340180, '5831 Dovetail Parkway', 'wweadick16@examiner.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (956293618, 'Male', 'Francklin McKyrrelly', 536248826, '46 Magdeline Point', 'fmckyrrelly17@cdc.gov');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (741887707, 'Female', 'Gaby Filppetti', 530030443, '32988 Golf Course Terrace', 'gfilppetti18@smh.com.au');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (423130577, 'Male', 'Weber Dennick', 572289350, '340 Shoshone Court', 'wdennick19@oakley.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (842438188, 'Male', 'Winnie Vereker', 515232090, '24664 Calypso Court', 'wvereker1a@jigsy.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (330839612, 'Female', 'Terrie Kelsey', 519391950, '1 Talmadge Center', 'tkelsey1b@cdbaby.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (368841926, 'Female', 'Marissa Lemoir', 561783468, '7 Meadow Valley Way', 'mlemoir1c@mayoclinic.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (938379550, 'Male', 'Itch Crisford', 550764860, '3248 Pennsylvania Avenue', 'icrisford1d@tripod.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (239285470, 'Female', 'Gertrud Kiefer', 567633759, '1157 Oriole Parkway', 'gkiefer1e@fc2.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (891605799, 'Female', 'Geneva Wooler', 571315436, '75 Ruskin Terrace', 'gwooler1f@shop-pro.jp');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (110775613, 'Male', 'Benjie Caudelier', 569416211, '3 7th Plaza', 'bcaudelier1g@ebay.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (193732741, 'Male', 'Wilburt Maunders', 595481076, '53695 Dryden Road', 'wmaunders1h@senate.gov');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (156036583, 'Female', 'Corly Bault', 584105690, '897 Village Road', 'cbault1i@abc.net.au');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (449079582, 'Male', 'Aleksandr Whewell', 599612324, '31503 Merrick Point', 'awhewell1j@cpanel.net');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (144114535, 'Male', 'Alfonse MacAulay', 555018763, '45101 Fairview Street', 'amacaulay1k@free.fr');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (667364565, 'Male', 'Baillie Ackrill', 579897996, '42 Leroy Alley', 'backrill1l@ask.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (568076166, 'Female', 'Roanna Paddington', 502835626, '98519 Lukken Drive', 'rpaddington1m@wired.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (37515876, 'Female', 'Donelle Ovington', 526307966, '85 Twin Pines Hill', 'dovington1n@bbb.org');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (339825693, 'Female', 'Lurette Hourigan', 598911699, '86615 Sachs Plaza', 'lhourigan1o@google.co.uk');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (143450646, 'Male', 'Siward Pellamonuten', 511047001, '279 Gulseth Plaza', 'spellamonuten1p@vimeo.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (347409056, 'Female', 'Karine Nevison', 591501850, '10877 Valley Edge Park', 'knevison1q@mozilla.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (793882523, 'Male', 'Zackariah Daen', 552457777, '866 Valley Edge Parkway', 'zdaen1r@army.mil');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (792630158, 'Male', 'Win Goult', 574485402, '91 Nancy Parkway', 'wgoult1s@netvibes.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (363900520, 'Female', 'Flo Arnout', 598279056, '1422 Boyd Pass', 'farnout1t@jigsy.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (847414233, 'Female', 'Elladine Jereatt', 511213222, '3142 Scott Pass', 'ejereatt1u@wunderground.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (887018922, 'Female', 'Dolli Marchand', 564082121, '7686 Hoepker Alley', 'dmarchand1v@rediff.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (953556278, 'Female', 'Andriana Atkyns', 592372449, '1 Schurz Terrace', 'aatkyns1w@mapy.cz');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (204342963, 'Female', 'Sherilyn Dyet', 570580060, '8 Scott Plaza', 'sdyet1x@yahoo.co.jp');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (166730141, 'Male', 'Nikolas Testin', 567369320, '36 Oneill Crossing', 'ntestin1y@shareasale.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (84463938, 'Female', 'Olivette Chisolm', 593545711, '62776 Marcy Parkway', 'ochisolm1z@unesco.org');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (109184345, 'Female', 'Cordey Easeman', 505619254, '3270 Bellgrove Parkway', 'ceaseman20@state.tx.us');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (483523397, 'Male', 'Fields Corless', 543257133, '7 Coolidge Road', 'fcorless21@marketwatch.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (239567444, 'Male', 'Zaccaria Tschersich', 577360548, '7468 Clemons Point', 'ztschersich22@aol.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (285817671, 'Female', 'Tiena Newe', 592979466, '39429 Mayer Center', 'tnewe23@google.it');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (891395919, 'Female', 'Ruthie Wastling', 517526974, '57 Acker Way', 'rwastling24@nasa.gov');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (599267960, 'Female', 'Arlen Stallybrass', 587538489, '27 Laurel Plaza', 'astallybrass25@bbc.co.uk');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (694288312, 'Female', 'Dorotea Menaul', 537646076, '0 Pearson Drive', 'dmenaul26@hao123.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (246437667, 'Male', 'Jonah Hasard', 520659074, '87 Buhler Crossing', 'jhasard27@xing.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (448376914, 'Male', 'Biron Eidler', 524358982, '56 Jenifer Alley', 'beidler28@prweb.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (470115593, 'Female', 'Ardra Horrell', 526056377, '5844 Graedel Street', 'ahorrell29@webs.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (37357831, 'Male', 'Marcel Stook', 523324650, '633 Kennedy Court', 'mstook2a@ihg.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (629006255, 'Female', 'Fara Trengove', 528594114, '608 Hazelcrest Parkway', 'ftrengove2b@nyu.edu');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (298510709, 'Female', 'Loree Vondra', 590582548, '3 Annamark Center', 'lvondra2c@dion.ne.jp');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (8496983, 'Male', 'Muffin Penbarthy', 530177027, '2 Sutherland Place', 'mpenbarthy2d@umn.edu');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (757733421, 'Female', 'Hermina O''Collopy', 532895875, '18 Brickson Park Road', 'hocollopy2e@fastcompany.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (455203976, 'Female', 'Leda Julien', 511840389, '732 Eastlawn Plaza', 'ljulien2f@marketwatch.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (198104792, 'Male', 'Yulma Zorener', 570347909, '15794 Daystar Trail', 'yzorener2g@mediafire.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (32382720, 'Female', 'Marcie Schaffel', 524021567, '79 Buhler Lane', 'mschaffel2h@sourceforge.net');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (342560579, 'Female', 'Eliza Sutherel', 587869741, '0887 Autumn Leaf Center', 'esutherel2i@altervista.org');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (371437164, 'Male', 'Hilly Sweetnam', 581106485, '6 Lakeland Trail', 'hsweetnam2j@ft.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (177390651, 'Female', 'Karly Lonie', 550043805, '8244 Lukken Junction', 'klonie2k@earthlink.net');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (568933983, 'Female', 'Tasia Luparto', 533116954, '555 Knutson Trail', 'tluparto2l@home.pl');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (446464107, 'Male', 'Currie Boothebie', 562211339, '169 Superior Terrace', 'cboothebie2m@cargocollective.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (116443607, 'Female', 'Kakalina Parade', 537703768, '5 Dayton Road', 'kparade2n@paginegialle.it');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (710690978, 'Male', 'Cosme Slade', 508547287, '9421 Packers Avenue', 'cslade2o@usda.gov');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (636989011, 'Male', 'Tito Woller', 573512277, '31865 Ohio Point', 'twoller2p@prweb.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (399915317, 'Female', 'Jada Goad', 591572882, '04122 Truax Parkway', 'jgoad2q@opensource.org');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (724273801, 'Male', 'Whit MacNess', 504072365, '08 Sunfield Circle', 'wmacness2r@xrea.com');
commit;
prompt 100 records committed...
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (741535265, 'Female', 'Tiphany Orhtmann', 514941166, '4 Mallard Lane', 'torhtmann2s@vistaprint.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (504840339, 'Male', 'Sherlock O'' Kelleher', 517454491, '319 Sullivan Trail', 'so2t@usnews.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (752537794, 'Male', 'Haleigh Moroney', 507732364, '566 Miller Park', 'hmoroney2u@ocn.ne.jp');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (538284120, 'Female', 'Lorena Maryman', 513250392, '5 Schurz Street', 'lmaryman2v@paginegialle.it');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (298337319, 'Female', 'Dyann Driscoll', 578011687, '9 Sommers Drive', 'ddriscoll2w@unc.edu');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (552880750, 'Male', 'Dallas Verty', 573805424, '25 Red Cloud Terrace', 'dverty2x@xing.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (968989138, 'Male', 'Con Morando', 576577441, '02907 Ridgeway Parkway', 'cmorando2y@state.gov');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (622710490, 'Male', 'Benjamen Studdard', 514031350, '16927 Bartillon Hill', 'bstuddard2z@sfgate.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (739730077, 'Female', 'Shirley Mundie', 513069649, '55 Warbler Park', 'smundie30@webmd.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (882671374, 'Female', 'Vivi Halford', 590889043, '82126 Red Cloud Way', 'vhalford31@dion.ne.jp');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (675785571, 'Female', 'Fedora Swateridge', 575353627, '63 Service Court', 'fswateridge32@economist.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (984798679, 'Male', 'Gino Grieves', 574230765, '24 Buhler Point', 'ggrieves33@printfriendly.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (440550908, 'Male', 'Harry Monnery', 509117075, '92245 West Alley', 'hmonnery34@yolasite.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (872566906, 'Female', 'Cathrine Varty', 512409092, '4688 Talisman Point', 'cvarty35@4shared.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (366207701, 'Male', 'Jack Mellor', 539165329, '0 Service Center', 'jmellor36@vkontakte.ru');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (182203875, 'Male', 'Benedikt Kilfeather', 554483147, '7203 Morrow Crossing', 'bkilfeather37@microsoft.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (370343515, 'Male', 'Osmund Guenther', 518428444, '09770 Brown Parkway', 'oguenther38@prnewswire.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (628287659, 'Female', 'Carissa Boyett', 550579635, '1713 Spohn Center', 'cboyett39@reddit.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (270436980, 'Male', 'Barnabas Fusedale', 593670828, '670 Cottonwood Place', 'bfusedale3a@nih.gov');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (671524175, 'Female', 'Zilvia Sutton', 516594563, '7 Truax Point', 'zsutton3b@newsvine.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (153157217, 'Female', 'Sherie Wiggins', 553325138, '2420 Golf Course Avenue', 'swiggins3c@histats.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (948506677, 'Female', 'Vi Kochlin', 573782030, '934 Delladonna Avenue', 'vkochlin3d@google.com.hk');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (429548529, 'Male', 'Hayden Dennerly', 570281510, '7473 Eggendart Trail', 'hdennerly3e@java.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (552865242, 'Male', 'Roberto Espin', 561347280, '6146 Helena Trail', 'respin3f@shop-pro.jp');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (835544906, 'Female', 'Gypsy Metrick', 580313663, '778 Prairieview Parkway', 'gmetrick3g@flavors.me');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (666627230, 'Female', 'Drusy Humburton', 582291079, '1546 Kennedy Lane', 'dhumburton3h@usa.gov');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (806377008, 'Male', 'Phil Jaquet', 524664810, '3944 Drewry Junction', 'pjaquet3i@naver.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (126846720, 'Female', 'Doralyn Trelevan', 525104932, '24203 Crownhardt Junction', 'dtrelevan3j@icio.us');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (241535899, 'Female', 'Albertine Pilkinton', 578760369, '2 Chive Lane', 'apilkinton3k@cisco.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (428693989, 'Male', 'Baudoin D''Elias', 554043897, '2 Buell Plaza', 'bdelias3l@etsy.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (216040484, 'Male', 'Gaby Belward', 508332129, '2433 Linden Road', 'gbelward3m@google.nl');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (392131831, 'Female', 'Gilberte Attac', 587323923, '5423 Kipling Lane', 'gattac3n@stumbleupon.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (764516309, 'Female', 'Melanie Brandenburg', 555786210, '52 Holy Cross Point', 'mbrandenburg3o@alibaba.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (961698561, 'Female', 'Mari Thrush', 566642639, '4785 Nelson Center', 'mthrush3p@mapy.cz');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (88847666, 'Male', 'Langsdon Ewbanks', 546550690, '726 Upham Junction', 'lewbanks3q@trellian.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (706388337, 'Female', 'Sadye Voas', 518665525, '9198 Carey Terrace', 'svoas3r@twitpic.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (294207967, 'Male', 'Rodd Caldron', 536413915, '4 Longview Avenue', 'rcaldron3s@boston.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (89807477, 'Male', 'Freedman Tomaskunas', 541908272, '05 Independence Way', 'ftomaskunas3t@marketwatch.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (639230686, 'Male', 'Trstram Yackiminie', 591276229, '775 Larry Park', 'tyackiminie3u@rediff.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (544689165, 'Male', 'Duncan Wheelan', 537321647, '87233 Buena Vista Point', 'dwheelan3v@bravesites.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (9419613, 'Male', 'Webb Izaac', 554406498, '9 Weeping Birch Way', 'wizaac3w@weather.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (583024739, 'Female', 'Mariele Olenchikov', 533350046, '41271 Hermina Crossing', 'molenchikov3x@reference.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (100888066, 'Female', 'Adela Humbee', 576021524, '553 Comanche Pass', 'ahumbee3y@java.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (738103812, 'Male', 'Garwood Brixey', 585256690, '83 Carioca Park', 'gbrixey3z@icq.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (945225421, 'Male', 'Devy Von Hindenburg', 504059467, '42 North Pass', 'dvon40@admin.ch');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (278701404, 'Female', 'Darell Lauret', 578569231, '3 Mandrake Drive', 'dlauret41@china.com.cn');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (134275795, 'Female', 'Horatia Mettricke', 598473151, '8098 Red Cloud Circle', 'hmettricke42@booking.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (829031103, 'Female', 'Hattie Norssister', 541798717, '45962 Springs Alley', 'hnorssister43@rediff.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (309718237, 'Male', 'Greg Klimentyonok', 571485679, '29140 Buhler Junction', 'gklimentyonok44@usda.gov');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (367648866, 'Female', 'Sharity Strahan', 547458218, '6414 Del Sol Way', 'sstrahan45@yolasite.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (384007856, 'Male', 'Lucias Headan', 543221494, '161 Cardinal Crossing', 'lheadan46@so-net.ne.jp');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (223802756, 'Female', 'Cortney Hanniger', 530133030, '4 Anthes Plaza', 'channiger47@nytimes.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (611561804, 'Female', 'Devina Snoxill', 561897973, '8 Upham Trail', 'dsnoxill48@linkedin.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (66242318, 'Male', 'Cori Broadey', 538358859, '69 Hazelcrest Avenue', 'cbroadey49@unblog.fr');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (454145649, 'Female', 'Dorelia Espinha', 517442112, '22 New Castle Parkway', 'despinha4a@upenn.edu');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (872264579, 'Male', 'Kipp Doe', 594683181, '16272 Hazelcrest Street', 'kdoe4b@slashdot.org');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (325260082, 'Female', 'Leontine Ibbs', 571304924, '31811 Colorado Way', 'libbs4c@auda.org.au');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (971707781, 'Male', 'Padriac Netley', 510332827, '5 Oneill Point', 'pnetley4d@gmpg.org');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (573776102, 'Female', 'Berrie Meddows', 504506835, '154 Montana Plaza', 'bmeddows4e@independent.co.uk');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (972951644, 'Female', 'Fawn Gorring', 571560394, '8 Redwing Plaza', 'fgorring4f@buzzfeed.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (817112047, 'Female', 'Briny Shackel', 530535622, '59821 Alpine Trail', 'bshackel4g@github.io');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (946654322, 'Female', 'Ernaline Luety', 560163712, '52058 Aberg Park', 'eluety4h@furl.net');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (681776145, 'Female', 'Lonna Triner', 595600385, '848 Scott Trail', 'ltriner4i@addtoany.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (976071851, 'Male', 'Grannie Lofting', 590520558, '1661 Calypso Point', 'glofting4j@telegraph.co.uk');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (394381863, 'Female', 'Billi McGrale', 538043120, '468 Summit Hill', 'bmcgrale4k@sitemeter.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (166690748, 'Female', 'Layney O''Giany', 522092708, '8231 Milwaukee Road', 'logiany4l@diigo.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (224772173, 'Female', 'Corrina Bloyes', 568575165, '618 Cardinal Junction', 'cbloyes4m@stumbleupon.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (451950079, 'Female', 'Cindee Esposito', 528558109, '02144 Jana Circle', 'cesposito4n@dmoz.org');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (144149414, 'Female', 'Geraldine Lovemore', 563299293, '53 Westport Road', 'glovemore4o@wikia.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (150991526, 'Male', 'Sloane Fagence', 580444209, '474 Vidon Way', 'sfagence4p@oakley.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (38829226, 'Male', 'Ludovico Buffery', 537050681, '787 Glacier Hill Point', 'lbuffery4q@aol.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (764006453, 'Female', 'Brandea Matterdace', 507282457, '862 Anhalt Junction', 'bmatterdace4r@hc360.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (66126371, 'Male', 'Steffen Choppen', 517233548, '83794 Arizona Plaza', 'schoppen4s@patch.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (413903985, 'Male', 'Kippy Apfler', 513841420, '1748 Sullivan Court', 'kapfler4t@paypal.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (764892479, 'Female', 'Shela Zoppie', 507952547, '9 John Wall Alley', 'szoppie4u@yellowpages.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (33488688, 'Male', 'Wayland Colebrook', 567458896, '6665 Southridge Terrace', 'wcolebrook4v@nba.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (351195569, 'Female', 'Chelsea Headley', 593335377, '8 Norway Maple Alley', 'cheadley4w@pcworld.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (645260478, 'Female', 'Hermina Brandin', 536934084, '09657 Sherman Pass', 'hbrandin4x@usgs.gov');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (943030092, 'Male', 'Arte Ferreiro', 522659759, '33423 Manley Parkway', 'aferreiro4y@dailymail.co.uk');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (843698732, 'Male', 'Davidson Battista', 599759280, '10790 Packers Way', 'dbattista4z@mashable.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (289127380, 'Female', 'Marilin Manders', 521654357, '77 Pearson Center', 'mmanders50@wordpress.org');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (499823729, 'Female', 'Lelia Ridley', 502017371, '2 Lerdahl Crossing', 'lridley51@jiathis.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (33394455, 'Male', 'Fonz Pesic', 578809464, '45811 Express Parkway', 'fpesic52@state.gov');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (540996908, 'Male', 'Pietrek Sebire', 531019038, '7301 Kedzie Center', 'psebire53@baidu.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (983066233, 'Female', 'Tiffy Alstead', 529332557, '09 Del Mar Junction', 'talstead54@ft.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (360274647, 'Male', 'Julius Bernocchi', 584139470, '5 Jana Terrace', 'jbernocchi55@ebay.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (590577221, 'Female', 'Belle Merman', 568488820, '6 Fisk Avenue', 'bmerman56@sun.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (469692372, 'Female', 'Rosanna Stocker', 527382725, '4 Acker Crossing', 'rstocker57@opera.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (858396505, 'Male', 'Elton Twist', 510166726, '08979 1st Circle', 'etwist58@vimeo.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (526289796, 'Male', 'Marmaduke Shimon', 597492069, '53840 Briar Crest Crossing', 'mshimon59@a8.net');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (417554829, 'Male', 'Winfield Pobjay', 551223885, '54214 Hazelcrest Avenue', 'wpobjay5a@paginegialle.it');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (464542668, 'Male', 'Paxton Ruffell', 524573375, '42 Moose Alley', 'pruffell5b@domainmarket.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (136943451, 'Male', 'Derby Paddy', 593473811, '2 Norway Maple Pass', 'dpaddy5c@google.fr');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (281704629, 'Female', 'Madge Enrico', 534482036, '10022 Parkside Parkway', 'menrico5d@jiathis.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (833152003, 'Male', 'Galven Zieme', 573732187, '6275 David Crossing', 'gzieme5e@yelp.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (988123159, 'Female', 'Jodi Treweela', 512798270, '02832 Elmside Street', 'jtreweela5f@uol.com.br');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (842553885, 'Female', 'Ethelin Cordle', 583790759, '9203 Londonderry Drive', 'ecordle5g@ed.gov');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (941326323, 'Male', 'Dalli Simmen', 593726833, '3718 Clove Parkway', 'dsimmen5h@economist.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (425818193, 'Female', 'Frieda McDiarmid', 542352563, '41 Annamark Court', 'fmcdiarmid5i@bbc.co.uk');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (387031674, 'Female', 'Paige Anthiftle', 536090316, '7 Memorial Pass', 'panthiftle5j@economist.com');
commit;
prompt 200 records committed...
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (889114374, 'Male', 'Conrado Tellenbach', 578442782, '78 Melody Center', 'ctellenbach5k@rambler.ru');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (947865125, 'Female', 'Alena Stollsteimer', 559479219, '686 Surrey Street', 'astollsteimer5l@paginegialle.it');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (268184898, 'Female', 'Renate Roggieri', 565262596, '7116 Rusk Lane', 'rroggieri5m@engadget.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (364003048, 'Female', 'Bonny Leale', 567185237, '645 Oakridge Park', 'bleale5n@nps.gov');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (773097313, 'Male', 'Lief Buddle', 564662773, '10125 Ridgeview Park', 'lbuddle5o@mashable.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (230610385, 'Male', 'Julio Talks', 507738518, '4639 Meadow Valley Court', 'jtalks5p@deviantart.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (645557313, 'Female', 'Janeen Dibbin', 505631675, '2556 Karstens Avenue', 'jdibbin5q@sogou.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (629617477, 'Female', 'Toinette Robottom', 510100954, '75 Kensington Park', 'trobottom5r@unicef.org');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (651173695, 'Female', 'Fayth Pessler', 567101891, '7 Clemons Crossing', 'fpessler5s@360.cn');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (988696800, 'Female', 'Tish Pourveer', 585632799, '49984 Melody Center', 'tpourveer5t@wikispaces.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (15823020, 'Female', 'Ginevra Kinsella', 516588842, '333 Village Green Junction', 'gkinsella5u@typepad.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (72211924, 'Female', 'Cairistiona Lipsett', 592728079, '20 Linden Circle', 'clipsett5v@japanpost.jp');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (434146054, 'Male', 'Garner Cuffley', 520876908, '5 Menomonie Court', 'gcuffley5w@marriott.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (769271035, 'Female', 'Marcellina Mattiazzo', 535123522, '59940 Almo Avenue', 'mmattiazzo5x@pagesperso-orange.fr');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (348139398, 'Male', 'Gael Leadbetter', 530658310, '93 Gulseth Hill', 'gleadbetter5y@npr.org');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (76725560, 'Male', 'Nev Damant', 556226451, '27952 Clemons Avenue', 'ndamant5z@wunderground.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (535524729, 'Female', 'Celestyna Kenealy', 568746279, '74213 Bobwhite Parkway', 'ckenealy60@independent.co.uk');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (392375337, 'Female', 'Charlotte Evison', 518863607, '8 Dunning Crossing', 'cevison61@mediafire.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (141551187, 'Female', 'Rivy Beven', 549357860, '97476 6th Center', 'rbeven62@wisc.edu');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (855737641, 'Male', 'Jamey Stile', 501415425, '426 Carey Plaza', 'jstile63@squidoo.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (853980163, 'Female', 'Latashia Denniston', 556239962, '2 Northwestern Road', 'ldenniston64@mapy.cz');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (922954022, 'Male', 'Etienne Todari', 569309604, '2 Cordelia Circle', 'etodari65@ucla.edu');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (399425803, 'Male', 'Rutger Klosa', 518559463, '4467 Elka Lane', 'rklosa66@reverbnation.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (415525906, 'Male', 'Darrel Powe', 510191012, '8934 Union Street', 'dpowe67@jimdo.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (728518006, 'Female', 'Kendra Forre', 596071883, '88 Darwin Alley', 'kforre68@cnn.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (130427278, 'Female', 'Kiele Deem', 508116533, '06040 Roth Hill', 'kdeem69@accuweather.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (188553765, 'Male', 'Edwin Leindecker', 504133308, '8834 Warrior Park', 'eleindecker6a@mlb.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (321569191, 'Female', 'Oriana Kerswell', 509889263, '39 Porter Circle', 'okerswell6b@creativecommons.org');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (338258344, 'Female', 'Jordanna Bauduccio', 583986609, '23 Brentwood Court', 'jbauduccio6c@php.net');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (804626341, 'Female', 'Kellen Venus', 573205870, '69 Karstens Center', 'kvenus6d@newsvine.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (926205546, 'Female', 'Ashlee Berford', 530494655, '3167 Spenser Crossing', 'aberford6e@businesswire.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (807169056, 'Female', 'Fredericka Torres', 551630493, '3849 Briar Crest Terrace', 'ftorres6f@ucsd.edu');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (798861227, 'Female', 'Pierrette Krammer', 521475539, '324 Lotheville Court', 'pkrammer6g@go.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (89569439, 'Female', 'Ainslie Stoggles', 528405933, '46 Miller Alley', 'astoggles6h@moonfruit.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (928847941, 'Male', 'Duke MacKall', 585788383, '11 Hollow Ridge Park', 'dmackall6i@reddit.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (537871085, 'Male', 'Skelly Henrot', 506920925, '1 Dorton Terrace', 'shenrot6j@altervista.org');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (583370421, 'Male', 'Erasmus Greally', 560024850, '2 Mandrake Pass', 'egreally6k@list-manage.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (776488744, 'Male', 'Bevan Stubbeley', 524078222, '92781 Chinook Alley', 'bstubbeley6l@google.fr');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (273730719, 'Female', 'Robbyn Jancik', 594969414, '53 2nd Terrace', 'rjancik6m@webnode.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (119249472, 'Male', 'Dewitt Hellmore', 500488555, '8626 Ridgeway Junction', 'dhellmore6n@independent.co.uk');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (713889062, 'Female', 'Tove Jimpson', 507918212, '54 Utah Parkway', 'tjimpson6o@yandex.ru');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (804361204, 'Male', 'Lamond Giblett', 588384699, '3 Dunning Center', 'lgiblett6p@hugedomains.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (39350391, 'Male', 'Rafaellle Butson', 547792732, '8 Melrose Court', 'rbutson6q@bloglines.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (178340617, 'Male', 'Gustave Davana', 509770896, '209 Monica Avenue', 'gdavana6r@cocolog-nifty.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (181732831, 'Male', 'Kerwinn Kitson', 543132974, '39 Pierstorff Road', 'kkitson6s@state.gov');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (350892056, 'Female', 'Kerstin O''Hoey', 569525186, '9200 International Trail', 'kohoey6t@theglobeandmail.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (93985702, 'Male', 'Otto Gutierrez', 506880795, '93 Artisan Pass', 'ogutierrez6u@jimdo.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (201335184, 'Male', 'Denney Massei', 586308138, '86326 Burning Wood Hill', 'dmassei6v@yellowbook.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (882528796, 'Male', 'Dur Kasparski', 563216170, '99 Macpherson Parkway', 'dkasparski6w@vistaprint.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (936296296, 'Female', 'Goldarina Gilcriest', 527527078, '6934 Welch Plaza', 'ggilcriest6x@odnoklassniki.ru');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (404616118, 'Female', 'Gretchen Chevolleau', 572785645, '53 Chinook Alley', 'gchevolleau6y@tumblr.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (482913375, 'Male', 'Verge Ramsey', 529620517, '8 Crowley Hill', 'vramsey6z@disqus.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (857771070, 'Female', 'Wynn Edgerley', 535533918, '053 Bowman Trail', 'wedgerley70@smh.com.au');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (982086783, 'Female', 'Dido Sussex', 518329017, '932 Mockingbird Terrace', 'dsussex71@ifeng.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (39261873, 'Male', 'Kurtis Wigley', 571578739, '7 Talisman Lane', 'kwigley72@friendfeed.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (511648231, 'Male', 'Chalmers Mackett', 562152860, '6069 Corben Center', 'cmackett73@i2i.jp');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (88434151, 'Female', 'Xylina Mithon', 545900919, '3 Lakewood Gardens Crossing', 'xmithon74@bloglines.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (415774413, 'Female', 'Kati Ashfull', 568092359, '1996 Lukken Drive', 'kashfull75@ameblo.jp');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (946460524, 'Female', 'Nataline Schwander', 529784643, '6728 Ludington Avenue', 'nschwander76@lycos.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (453388492, 'Female', 'Kaylyn Penn', 585408085, '2684 Rigney Court', 'kpenn77@histats.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (602155382, 'Female', 'Minnie Growcock', 507621482, '7955 Nobel Junction', 'mgrowcock78@pagesperso-orange.fr');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (929633809, 'Female', 'Candida Guiden', 563027532, '4 Merry Point', 'cguiden79@oaic.gov.au');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (585401273, 'Female', 'Ferne Pellew', 567050949, '63057 Chive Alley', 'fpellew7a@spiegel.de');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (826426071, 'Male', 'Brodie Alwin', 570825202, '8 Steensland Parkway', 'balwin7b@theglobeandmail.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (442799071, 'Male', 'Pate Luck', 548183478, '73 Cambridge Hill', 'pluck7c@twitpic.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (624373181, 'Male', 'Boris Chupin', 511341217, '1944 Kipling Center', 'bchupin7d@edublogs.org');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (106359612, 'Female', 'Cookie Abela', 564834601, '8 Melby Road', 'cabela7e@youku.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (373958066, 'Female', 'Wylma Lafay', 518443775, '77 Sundown Pass', 'wlafay7f@reuters.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (441545484, 'Male', 'Giuseppe Dutch', 537401715, '38863 Upham Place', 'gdutch7g@wix.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (579480884, 'Male', 'Roldan Robbeke', 553772737, '0425 Cottonwood Court', 'rrobbeke7h@berkeley.edu');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (25576901, 'Male', 'Hewitt Brooking', 544936818, '4 Mccormick Center', 'hbrooking7i@google.pl');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (16269226, 'Male', 'Rowen Pavese', 564831347, '688 Sheridan Trail', 'rpavese7j@umn.edu');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (547169642, 'Female', 'Alis Barby', 534404165, '238 Marcy Lane', 'abarby7k@webs.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (394750974, 'Female', 'Meryl Dumelow', 562015355, '48 Badeau Drive', 'mdumelow7l@ihg.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (377236083, 'Female', 'Lorilyn Stickels', 585890574, '9 Homewood Drive', 'lstickels7m@stumbleupon.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (157283500, 'Male', 'Early Inglesfield', 513150228, '09 Meadow Valley Crossing', 'einglesfield7n@psu.edu');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (359920243, 'Female', 'Giralda Drezzer', 519961538, '78046 Katie Place', 'gdrezzer7o@barnesandnoble.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (152215435, 'Female', 'Buffy Durden', 574709590, '45159 Spenser Plaza', 'bdurden7p@hibu.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (103181861, 'Female', 'Miguelita Sarver', 581846896, '6 Dapin Lane', 'msarver7q@prnewswire.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (801085395, 'Male', 'Miguel Dudny', 504818913, '114 Eastwood Way', 'mdudny7r@macromedia.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (995868723, 'Female', 'Keelia Pinckard', 519223536, '0685 2nd Point', 'kpinckard7s@businessinsider.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (21528366, 'Male', 'Jan Waterhous', 563691369, '42766 Ridge Oak Trail', 'jwaterhous7t@last.fm');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (920369378, 'Female', 'Cicily Risebarer', 536044259, '0590 Dexter Alley', 'crisebarer7u@newsvine.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (919825025, 'Female', 'Myranda Huitt', 594410172, '935 Algoma Pass', 'mhuitt7v@symantec.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (621549352, 'Male', 'Abeu Bishop', 539829773, '513 Graedel Hill', 'abishop7w@paginegialle.it');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (505441782, 'Female', 'Rafaelita Sarch', 535096719, '05 Jenifer Court', 'rsarch7x@xrea.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (412606339, 'Male', 'Marco Purver', 531420225, '7114 Di Loreto Crossing', 'mpurver7y@bbc.co.uk');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (635962481, 'Female', 'Bobette Webbe', 597485095, '0 Anthes Trail', 'bwebbe7z@nyu.edu');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (792753892, 'Male', 'Mar Please', 523257939, '65 Kenwood Crossing', 'mplease80@mozilla.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (201957512, 'Male', 'Sterling Humburton', 576176676, '54 Green Hill', 'shumburton81@chronoengine.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (668964882, 'Female', 'Giralda McColl', 502343140, '70 Jana Way', 'gmccoll82@tinypic.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (541349659, 'Male', 'Trevor Spyby', 536104365, '83 Di Loreto Plaza', 'tspyby83@amazonaws.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (186971826, 'Male', 'Frans Reeson', 551524059, '35126 Brown Trail', 'freeson84@ocn.ne.jp');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (128838848, 'Male', 'Puff Lomaz', 525384217, '8 Lien Trail', 'plomaz85@bandcamp.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (829806948, 'Female', 'Jeana Adamec', 550320805, '19 Oxford Trail', 'jadamec86@usa.gov');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (418865652, 'Male', 'Padraig Cantera', 528227235, '56351 Hauk Alley', 'pcantera87@squarespace.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (513708263, 'Male', 'Pincas Debney', 502724723, '4781 Sutteridge Alley', 'pdebney88@barnesandnoble.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (402875368, 'Male', 'Amble Gladdis', 519977487, '1640 Doe Crossing Street', 'agladdis89@etsy.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (965564108, 'Female', 'Liva Swindle', 565861360, '430 Sauthoff Hill', 'lswindle8a@forbes.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (248130758, 'Female', 'Lita Hackin', 500532089, '52 Ruskin Drive', 'lhackin8b@xrea.com');
commit;
prompt 300 records committed...
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (39888125, 'Female', 'Bernardina Honeywood', 564589244, '56234 Red Cloud Terrace', 'bhoneywood8c@pen.io');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (975447400, 'Male', 'Colby De Winton', 551997998, '832 Fairfield Trail', 'cde8d@theatlantic.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (122333253, 'Male', 'Keir Giacomuzzi', 593463941, '51 Lakewood Street', 'kgiacomuzzi8e@ezinearticles.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (412042284, 'Male', 'Davidson Simak', 575944089, '80921 Leroy Point', 'dsimak8f@macromedia.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (949987099, 'Male', 'Dennison Stannislawski', 560164184, '9367 Knutson Crossing', 'dstannislawski8g@wikimedia.org');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (998544947, 'Male', 'Berk Hazelton', 546213733, '08806 Brickson Park Trail', 'bhazelton8h@zdnet.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (861976871, 'Female', 'Willamina Buey', 563968276, '39 Dovetail Junction', 'wbuey8i@mapquest.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (138202526, 'Male', 'Pavlov Furneaux', 548867276, '96 Talisman Drive', 'pfurneaux8j@istockphoto.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (730695553, 'Male', 'Sherman Pettit', 509670582, '337 Sundown Alley', 'spettit8k@biblegateway.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (301956654, 'Female', 'Jenelle Sivier', 510109582, '5 Manitowish Crossing', 'jsivier8l@free.fr');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (992774372, 'Male', 'Ollie Marquez', 565707278, '031 Pond Circle', 'omarquez8m@moonfruit.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (624776728, 'Female', 'Codie Ponte', 533147084, '736 Wayridge Street', 'cponte8n@shutterfly.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (948674690, 'Male', 'Cale Float', 513624202, '61983 Merchant Junction', 'cfloat8o@nba.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (328828217, 'Female', 'Orel Arlt', 598882061, '58949 Ramsey Pass', 'oarlt8p@forbes.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (988216871, 'Female', 'Lelah Marzelle', 501619265, '25974 Lighthouse Bay Park', 'lmarzelle8q@acquirethisname.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (446648459, 'Male', 'De witt Hubbert', 555692403, '50 Ramsey Center', 'dwitt8r@facebook.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (910834121, 'Female', 'Lauryn Ree', 552659521, '57 Beilfuss Place', 'lree8s@indiegogo.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (495800226, 'Female', 'Marketa Warlock', 546835374, '3602 Mariners Cove Terrace', 'mwarlock8t@ifeng.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (341491772, 'Male', 'Patty Moxstead', 525631887, '67 Huxley Lane', 'pmoxstead8u@dmoz.org');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (750005809, 'Male', 'Adham Grain', 582401251, '90956 Garrison Park', 'agrain8v@nba.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (121399588, 'Female', 'Aidan Linacre', 551965262, '840 Forest Dale Way', 'alinacre8w@dmoz.org');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (84279082, 'Male', 'Holmes Noar', 576118027, '0 Arkansas Court', 'hnoar8x@amazon.co.jp');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (666931958, 'Female', 'Randie Van Oord', 550161213, '28 Banding Park', 'rvan8y@house.gov');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (260388055, 'Female', 'Simonne Van der Krui', 591468492, '56 Clarendon Alley', 'svan8z@mozilla.org');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (375971023, 'Male', 'Wyatt Potebury', 534835439, '65 Nevada Pass', 'wpotebury90@marketwatch.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (376660032, 'Female', 'Elvina Wymer', 511339037, '70393 Golf Course Pass', 'ewymer91@google.de');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (48591713, 'Female', 'Flori Woodard', 546765516, '3540 Nobel Court', 'fwoodard92@shareasale.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (807894763, 'Male', 'Nathanial Wallage', 507457754, '43 Briar Crest Crossing', 'nwallage93@ning.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (286359632, 'Female', 'Shaun Bartoszinski', 574779891, '48 Macpherson Terrace', 'sbartoszinski94@businessweek.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (415551056, 'Female', 'Lyndsay Youle', 550539812, '93 American Ash Terrace', 'lyoule95@github.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (241943546, 'Male', 'Orion Mount', 511487011, '4097 South Plaza', 'omount96@macromedia.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (558102976, 'Male', 'Sampson Cuming', 503967162, '8 Killdeer Lane', 'scuming97@blog.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (973430375, 'Female', 'Kit Lowdeane', 519175511, '44229 Mandrake Court', 'klowdeane98@ocn.ne.jp');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (982111666, 'Female', 'Raphaela Smythe', 546409505, '36657 Michigan Point', 'rsmythe99@springer.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (938969949, 'Female', 'Ola Moyse', 542309936, '9755 Sycamore Point', 'omoyse9a@liveinternet.ru');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (101511557, 'Male', 'Marlo Bugbird', 594210062, '416 Nelson Plaza', 'mbugbird9b@nifty.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (60530810, 'Male', 'Lydon Hasluck', 578733687, '437 Spaight Place', 'lhasluck9c@163.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (791276222, 'Male', 'Ric Sandlin', 515611686, '60 Sloan Drive', 'rsandlin9d@epa.gov');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (950590951, 'Female', 'Brunhilda Hubatsch', 541202095, '2 Carey Way', 'bhubatsch9e@boston.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (817956644, 'Male', 'Gun Sidaway', 509250772, '149 Steensland Place', 'gsidaway9f@oakley.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (658003623, 'Female', 'Ethyl Widdup', 529829662, '493 Welch Place', 'ewiddup9g@surveymonkey.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (299858273, 'Female', 'Elfie Seven', 540185716, '654 Michigan Terrace', 'eseven9h@mozilla.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (570953575, 'Female', 'Renata Raecroft', 528980242, '53312 Scoville Junction', 'rraecroft9i@mapquest.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (357462084, 'Male', 'Eddy Wilmut', 593639193, '196 Springs Crossing', 'ewilmut9j@webeden.co.uk');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (509609652, 'Female', 'Angelita Dabbes', 537466258, '08027 Dawn Center', 'adabbes9k@virginia.edu');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (580100863, 'Male', 'Kaspar Somerled', 533203178, '2675 Graedel Court', 'ksomerled9l@nydailynews.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (132924806, 'Female', 'Anstice McParlin', 542305152, '744 Carpenter Junction', 'amcparlin9m@chron.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (541088236, 'Female', 'Merna Viollet', 576463764, '85486 Green Ridge Alley', 'mviollet9n@google.pl');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (876054889, 'Female', 'Almira Moyser', 591808282, '30835 Golf Trail', 'amoyser9o@kickstarter.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (572457673, 'Male', 'Ahmed Tangye', 504020395, '2 Redwing Lane', 'atangye9p@paypal.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (881119603, 'Female', 'Cindie Olyff', 586778739, '198 Nelson Junction', 'colyff9q@auda.org.au');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (735242053, 'Male', 'Paddie Gowling', 537926263, '2 Rigney Circle', 'pgowling9r@woothemes.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (819619845, 'Female', 'Charmian MacCumiskey', 593067259, '43361 Ilene Street', 'cmaccumiskey9s@stumbleupon.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (310393073, 'Male', 'Brant Bes', 567563154, '84856 Hudson Hill', 'bbes9t@japanpost.jp');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (115738810, 'Female', 'Ashlee Coggeshall', 583408378, '06 Sugar Parkway', 'acoggeshall9u@springer.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (633621883, 'Female', 'Alvira Rothera', 515100036, '08 Clyde Gallagher Avenue', 'arothera9v@globo.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (115386460, 'Male', 'Arnoldo Pierri', 509054947, '91 Fisk Parkway', 'apierri9w@ucoz.ru');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (17535897, 'Male', 'Krisha Cleyburn', 564165595, '804 7th Crossing', 'kcleyburn9x@amazon.de');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (29780120, 'Male', 'Griswold Heighway', 561273324, '44317 Walton Lane', 'gheighway9y@tinypic.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (311230449, 'Male', 'Berkley Mastrantone', 577898164, '3 Thierer Circle', 'bmastrantone9z@nationalgeographic.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (996571791, 'Female', 'Stacie McGairl', 510672877, '6044 Knutson Terrace', 'smcgairla0@usgs.gov');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (328947614, 'Female', 'Merridie Cowle', 525790981, '54990 Killdeer Center', 'mcowlea1@ucoz.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (949209198, 'Male', 'Templeton Songest', 528410888, '30878 Sycamore Way', 'tsongesta2@deviantart.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (22608321, 'Female', 'Constanta Willets', 514793811, '2831 Grasskamp Road', 'cwilletsa3@usnews.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (217984194, 'Female', 'Melanie Doldon', 520395064, '372 North Street', 'mdoldona4@e-recht24.de');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (167917099, 'Male', 'Jean Earland', 534116126, '12614 Banding Place', 'jearlanda5@acquirethisname.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (919189920, 'Male', 'Jake Oda', 540270281, '4 Wayridge Junction', 'jodaa6@51.la');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (187717448, 'Female', 'Joan Grieveson', 552733057, '72332 Autumn Leaf Center', 'jgrievesona7@columbia.edu');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (486610639, 'Male', 'Cameron Frame', 545022237, '3 Ryan Hill', 'cframea8@technorati.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (366187765, 'Male', 'Hugo Hovie', 561410462, '7289 Morning Road', 'hhoviea9@tripadvisor.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (449179265, 'Female', 'Moselle Abilowitz', 575386055, '17 Superior Avenue', 'mabilowitzaa@51.la');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (410879352, 'Female', 'Trude Coultass', 502004314, '4660 Packers Avenue', 'tcoultassab@dropbox.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (464739079, 'Male', 'Lorne McArthur', 514146801, '3 Brown Drive', 'lmcarthurac@surveymonkey.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (123980403, 'Female', 'Elke Rowthorne', 576487108, '7328 Forest Street', 'erowthornead@tuttocitta.it');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (411334427, 'Male', 'Bengt Osgar', 569794703, '0716 Laurel Center', 'bosgarae@nature.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (784259188, 'Male', 'Broderick Meininking', 593157249, '468 Lillian Court', 'bmeininkingaf@bigcartel.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (542198095, 'Female', 'Emeline Aughton', 597016994, '38 Melby Parkway', 'eaughtonag@stumbleupon.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (409121169, 'Male', 'Will Harsnipe', 596968824, '62 Rockefeller Hill', 'wharsnipeah@addtoany.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (165021958, 'Male', 'Orson Shireff', 509094964, '73159 Steensland Way', 'oshireffai@mediafire.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (91717809, 'Male', 'Iosep Borleace', 521242511, '52075 Bayside Road', 'iborleaceaj@si.edu');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (217841071, 'Male', 'Menard Pyzer', 559978777, '84711 Golf Center', 'mpyzerak@netvibes.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (621394627, 'Female', 'Thomasine Brabbs', 584584064, '8 Barby Circle', 'tbrabbsal@g.co');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (130849103, 'Male', 'Kevin Willford', 557476735, '27114 Toban Hill', 'kwillfordam@google.de');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (921773204, 'Male', 'Killy Minico', 547178829, '5438 Truax Alley', 'kminicoan@trellian.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (196424300, 'Male', 'Hebert Mowson', 533072856, '61540 Schurz Junction', 'hmowsonao@icq.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (589121482, 'Male', 'Red Wadesworth', 563142094, '094 Oriole Drive', 'rwadesworthap@webeden.co.uk');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (883305631, 'Male', 'Conant Kleehuhler', 531368746, '1377 Derek Park', 'ckleehuhleraq@prlog.org');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (77182502, 'Male', 'Hinze Dives', 589949846, '4 Thackeray Circle', 'hdivesar@technorati.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (321751750, 'Female', 'Odilia Cacacie', 573067484, '013 Carioca Place', 'ocacacieas@discovery.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (196401260, 'Male', 'Sylas MacDavitt', 500819131, '1081 Shopko Junction', 'smacdavittat@etsy.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (135273222, 'Female', 'Darda Avramov', 551119842, '5 Montana Crossing', 'davramovau@ox.ac.uk');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (368859698, 'Male', 'Harold Sallarie', 507286680, '4 Johnson Street', 'hsallarieav@disqus.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (94530323, 'Male', 'Lockwood Camoletto', 584834923, '3614 Dixon Parkway', 'lcamolettoaw@prlog.org');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (546060620, 'Female', 'Elke Tatters', 570307718, '84219 Truax Circle', 'etattersax@bluehost.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (367002722, 'Female', 'Kristan Arsmith', 510044824, '85081 Birchwood Hill', 'karsmithay@elegantthemes.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (974693044, 'Female', 'Tiffanie Arzu', 514444815, '1 Morrow Trail', 'tarzuaz@163.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (450378456, 'Female', 'Gabi Acland', 593426314, '48884 Pepper Wood Avenue', 'gaclandb0@ft.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (521005306, 'Male', 'Gerardo Penrith', 563038222, '1556 Lighthouse Bay Place', 'gpenrithb1@bravesites.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (43126911, 'Female', 'Abbey Vitler', 530490771, '781 Manitowish Way', 'avitlerb2@prweb.com');
insert into PERSON (person_id, gender, full_name, phone, address, email)
values (707467033, 'Female', 'Cally Gildea', 522430478, '67 Algoma Lane', 'cgildeab3@delicious.com');
commit;
prompt 400 records loaded
prompt Loading COACH...
insert into COACH (speciality, salary, experience, person_id)
values ('Rehabilitation', 10428, '15 years', 558102976);
insert into COACH (speciality, salary, experience, person_id)
values ('Weight Loss', 11484, '7 years', 165021958);
insert into COACH (speciality, salary, experience, person_id)
values ('Rehabilitation', 10283, '15 years', 404616118);
insert into COACH (speciality, salary, experience, person_id)
values ('Endurance Training', 9344, '9 years', 791276222);
insert into COACH (speciality, salary, experience, person_id)
values ('Rehabilitation', 9342, '8 years', 537871085);
insert into COACH (speciality, salary, experience, person_id)
values ('Endurance Training', 11133, '3 years', 332700112);
insert into COACH (speciality, salary, experience, person_id)
values ('Yoga', 7293, '3 years', 926205546);
insert into COACH (speciality, salary, experience, person_id)
values ('Bodybuilding', 10455, '7 years', 376660032);
insert into COACH (speciality, salary, experience, person_id)
values ('Bodybuilding', 7740, '24 years', 829806948);
insert into COACH (speciality, salary, experience, person_id)
values ('Nutrition Coaching', 11844, '15 years', 826426071);
insert into COACH (speciality, salary, experience, person_id)
values ('Pilates', 10556, '9 years', 652621999);
insert into COACH (speciality, salary, experience, person_id)
values ('Strength Training', 7778, '21 years', 792753892);
insert into COACH (speciality, salary, experience, person_id)
values ('Yoga', 10405, '11 years', 936296296);
insert into COACH (speciality, salary, experience, person_id)
values ('Nutrition Coaching', 9546, '21 years', 278701404);
insert into COACH (speciality, salary, experience, person_id)
values ('Cardio Fitness', 7333, '4 years', 398712524);
insert into COACH (speciality, salary, experience, person_id)
values ('Endurance Training', 7974, '8 years', 938969949);
insert into COACH (speciality, salary, experience, person_id)
values ('Weight Loss', 10269, '4 years', 965564108);
insert into COACH (speciality, salary, experience, person_id)
values ('Endurance Training', 10119, '11 years', 666931958);
insert into COACH (speciality, salary, experience, person_id)
values ('Bodybuilding', 8634, '13 years', 88847666);
insert into COACH (speciality, salary, experience, person_id)
values ('Bodybuilding', 11193, '22 years', 621394627);
insert into COACH (speciality, salary, experience, person_id)
values ('Endurance Training', 10482, '15 years', 919189920);
insert into COACH (speciality, salary, experience, person_id)
values ('Nutrition Coaching', 7829, '24 years', 482913375);
insert into COACH (speciality, salary, experience, person_id)
values ('Pilates', 8368, '8 years', 509609652);
insert into COACH (speciality, salary, experience, person_id)
values ('Bodybuilding', 11826, '25 years', 542198095);
insert into COACH (speciality, salary, experience, person_id)
values ('Strength Training', 11997, '17 years', 599267960);
insert into COACH (speciality, salary, experience, person_id)
values ('Nutrition Coaching', 11181, '3 years', 882528796);
insert into COACH (speciality, salary, experience, person_id)
values ('Endurance Training', 9509, '13 years', 270436980);
insert into COACH (speciality, salary, experience, person_id)
values ('Nutrition Coaching', 9110, '5 years', 451950079);
insert into COACH (speciality, salary, experience, person_id)
values ('Strength Training', 10632, '23 years', 644624124);
insert into COACH (speciality, salary, experience, person_id)
values ('Cardio Fitness', 10942, '18 years', 230610385);
insert into COACH (speciality, salary, experience, person_id)
values ('Cardio Fitness', 7687, '10 years', 666627230);
insert into COACH (speciality, salary, experience, person_id)
values ('Rehabilitation', 8210, '9 years', 91717809);
insert into COACH (speciality, salary, experience, person_id)
values ('Endurance Training', 10431, '23 years', 394441189);
insert into COACH (speciality, salary, experience, person_id)
values ('Yoga', 8118, '17 years', 707467033);
insert into COACH (speciality, salary, experience, person_id)
values ('Cardio Fitness', 9846, '22 years', 573776102);
insert into COACH (speciality, salary, experience, person_id)
values ('Pilates', 7277, '24 years', 66126371);
insert into COACH (speciality, salary, experience, person_id)
values ('Yoga', 11030, '6 years', 132924806);
insert into COACH (speciality, salary, experience, person_id)
values ('Weight Loss', 10922, '16 years', 521005306);
insert into COACH (speciality, salary, experience, person_id)
values ('Yoga', 7174, '24 years', 622710490);
insert into COACH (speciality, salary, experience, person_id)
values ('Pilates', 7401, '3 years', 552269406);
insert into COACH (speciality, salary, experience, person_id)
values ('Pilates', 8906, '3 years', 144114535);
insert into COACH (speciality, salary, experience, person_id)
values ('Weight Loss', 10921, '3 years', 239567444);
insert into COACH (speciality, salary, experience, person_id)
values ('Yoga', 11268, '22 years', 455203976);
insert into COACH (speciality, salary, experience, person_id)
values ('Strength Training', 10685, '21 years', 72211924);
insert into COACH (speciality, salary, experience, person_id)
values ('Pilates', 10085, '22 years', 394381863);
insert into COACH (speciality, salary, experience, person_id)
values ('Weight Loss', 8106, '24 years', 552880750);
insert into COACH (speciality, salary, experience, person_id)
values ('Rehabilitation', 8542, '4 years', 876054889);
insert into COACH (speciality, salary, experience, person_id)
values ('Strength Training', 8320, '19 years', 961698561);
insert into COACH (speciality, salary, experience, person_id)
values ('Rehabilitation', 7007, '9 years', 32382720);
insert into COACH (speciality, salary, experience, person_id)
values ('Bodybuilding', 9027, '4 years', 568933983);
insert into COACH (speciality, salary, experience, person_id)
values ('Endurance Training', 11452, '10 years', 446464107);
insert into COACH (speciality, salary, experience, person_id)
values ('Pilates', 11194, '12 years', 946654322);
insert into COACH (speciality, salary, experience, person_id)
values ('Pilates', 11058, '13 years', 115386460);
insert into COACH (speciality, salary, experience, person_id)
values ('Weight Loss', 10954, '19 years', 694288312);
insert into COACH (speciality, salary, experience, person_id)
values ('Nutrition Coaching', 9814, '8 years', 776488744);
insert into COACH (speciality, salary, experience, person_id)
values ('Nutrition Coaching', 10028, '15 years', 299858273);
insert into COACH (speciality, salary, experience, person_id)
values ('Nutrition Coaching', 7411, '4 years', 412606339);
insert into COACH (speciality, salary, experience, person_id)
values ('Weight Loss', 11036, '13 years', 109184345);
insert into COACH (speciality, salary, experience, person_id)
values ('Cardio Fitness', 8452, '7 years', 338258344);
insert into COACH (speciality, salary, experience, person_id)
values ('Rehabilitation', 8102, '15 years', 793882523);
insert into COACH (speciality, salary, experience, person_id)
values ('Pilates', 11975, '14 years', 387031674);
insert into COACH (speciality, salary, experience, person_id)
values ('Cardio Fitness', 7791, '14 years', 735242053);
insert into COACH (speciality, salary, experience, person_id)
values ('Bodybuilding', 11284, '5 years', 589121482);
insert into COACH (speciality, salary, experience, person_id)
values ('Rehabilitation', 10343, '17 years', 371437164);
insert into COACH (speciality, salary, experience, person_id)
values ('Bodybuilding', 9099, '17 years', 572457673);
insert into COACH (speciality, salary, experience, person_id)
values ('Strength Training', 8013, '18 years', 988561837);
insert into COACH (speciality, salary, experience, person_id)
values ('Strength Training', 8007, '9 years', 730695553);
insert into COACH (speciality, salary, experience, person_id)
values ('Strength Training', 11265, '12 years', 281704629);
insert into COACH (speciality, salary, experience, person_id)
values ('Yoga', 7522, '20 years', 16269226);
insert into COACH (speciality, salary, experience, person_id)
values ('Cardio Fitness', 8819, '25 years', 167917099);
insert into COACH (speciality, salary, experience, person_id)
values ('Pilates', 8770, '17 years', 741887707);
insert into COACH (speciality, salary, experience, person_id)
values ('Strength Training', 8728, '18 years', 464739079);
insert into COACH (speciality, salary, experience, person_id)
values ('Endurance Training', 9432, '3 years', 123980403);
insert into COACH (speciality, salary, experience, person_id)
values ('Endurance Training', 7442, '18 years', 792630158);
insert into COACH (speciality, salary, experience, person_id)
values ('Cardio Fitness', 8866, '7 years', 412042284);
insert into COACH (speciality, salary, experience, person_id)
values ('Strength Training', 9563, '25 years', 728518006);
insert into COACH (speciality, salary, experience, person_id)
values ('Nutrition Coaching', 8200, '17 years', 453388492);
insert into COACH (speciality, salary, experience, person_id)
values ('Bodybuilding', 11502, '10 years', 350892056);
insert into COACH (speciality, salary, experience, person_id)
values ('Cardio Fitness', 8019, '24 years', 764006453);
insert into COACH (speciality, salary, experience, person_id)
values ('Weight Loss', 7231, '14 years', 996571791);
insert into COACH (speciality, salary, experience, person_id)
values ('Weight Loss', 11996, '9 years', 843698732);
insert into COACH (speciality, salary, experience, person_id)
values ('Nutrition Coaching', 8671, '7 years', 370343515);
insert into COACH (speciality, salary, experience, person_id)
values ('Weight Loss', 10448, '17 years', 260388055);
insert into COACH (speciality, salary, experience, person_id)
values ('Strength Training', 10674, '6 years', 448376914);
insert into COACH (speciality, salary, experience, person_id)
values ('Bodybuilding', 9244, '12 years', 940153696);
insert into COACH (speciality, salary, experience, person_id)
values ('Bodybuilding', 11331, '11 years', 126846720);
insert into COACH (speciality, salary, experience, person_id)
values ('Cardio Fitness', 9010, '4 years', 89569439);
insert into COACH (speciality, salary, experience, person_id)
values ('Weight Loss', 7584, '20 years', 997116426);
insert into COACH (speciality, salary, experience, person_id)
values ('Nutrition Coaching', 9645, '8 years', 84463938);
insert into COACH (speciality, salary, experience, person_id)
values ('Strength Training', 11161, '7 years', 339825693);
insert into COACH (speciality, salary, experience, person_id)
values ('Endurance Training', 10164, '19 years', 367648866);
insert into COACH (speciality, salary, experience, person_id)
values ('Cardio Fitness', 8831, '6 years', 667364565);
insert into COACH (speciality, salary, experience, person_id)
values ('Nutrition Coaching', 8652, '11 years', 668964882);
insert into COACH (speciality, salary, experience, person_id)
values ('Weight Loss', 8002, '8 years', 399915317);
insert into COACH (speciality, salary, experience, person_id)
values ('Pilates', 8088, '23 years', 988696800);
insert into COACH (speciality, salary, experience, person_id)
values ('Cardio Fitness', 8690, '10 years', 285817671);
insert into COACH (speciality, salary, experience, person_id)
values ('Strength Training', 7193, '17 years', 415774413);
insert into COACH (speciality, salary, experience, person_id)
values ('Strength Training', 11375, '11 years', 358254239);
insert into COACH (speciality, salary, experience, person_id)
values ('Pilates', 8987, '17 years', 695131325);
insert into COACH (speciality, salary, experience, person_id)
values ('Yoga', 8446, '5 years', 984798679);
commit;
prompt 100 records committed...
insert into COACH (speciality, salary, experience, person_id)
values ('Strength Training', 11165, '23 years', 384007856);
insert into COACH (speciality, salary, experience, person_id)
values ('Nutrition Coaching', 7321, '15 years', 196424300);
insert into COACH (speciality, salary, experience, person_id)
values ('Weight Loss', 8124, '3 years', 328828217);
insert into COACH (speciality, salary, experience, person_id)
values ('Nutrition Coaching', 8865, '4 years', 982111666);
insert into COACH (speciality, salary, experience, person_id)
values ('Endurance Training', 8294, '22 years', 21528366);
insert into COACH (speciality, salary, experience, person_id)
values ('Rehabilitation', 11139, '10 years', 833152003);
insert into COACH (speciality, salary, experience, person_id)
values ('Strength Training', 11785, '23 years', 94530323);
insert into COACH (speciality, salary, experience, person_id)
values ('Yoga', 8447, '11 years', 115738810);
insert into COACH (speciality, salary, experience, person_id)
values ('Strength Training', 8344, '10 years', 973430375);
insert into COACH (speciality, salary, experience, person_id)
values ('Endurance Training', 10706, '21 years', 947865125);
insert into COACH (speciality, salary, experience, person_id)
values ('Strength Training', 10633, '11 years', 188553765);
insert into COACH (speciality, salary, experience, person_id)
values ('Weight Loss', 8121, '18 years', 368859698);
insert into COACH (speciality, salary, experience, person_id)
values ('Rehabilitation', 11175, '11 years', 611561804);
insert into COACH (speciality, salary, experience, person_id)
values ('Yoga', 9398, '17 years', 130427278);
insert into COACH (speciality, salary, experience, person_id)
values ('Bodybuilding', 10931, '21 years', 341491772);
insert into COACH (speciality, salary, experience, person_id)
values ('Rehabilitation', 9565, '24 years', 988123159);
insert into COACH (speciality, salary, experience, person_id)
values ('Rehabilitation', 9652, '10 years', 807169056);
insert into COACH (speciality, salary, experience, person_id)
values ('Rehabilitation', 11569, '18 years', 156036583);
insert into COACH (speciality, salary, experience, person_id)
values ('Bodybuilding', 11722, '11 years', 513708263);
insert into COACH (speciality, salary, experience, person_id)
values ('Nutrition Coaching', 7629, '25 years', 217841071);
insert into COACH (speciality, salary, experience, person_id)
values ('Nutrition Coaching', 9891, '20 years', 538284120);
insert into COACH (speciality, salary, experience, person_id)
values ('Cardio Fitness', 11827, '11 years', 29780120);
insert into COACH (speciality, salary, experience, person_id)
values ('Weight Loss', 11968, '25 years', 141551187);
insert into COACH (speciality, salary, experience, person_id)
values ('Bodybuilding', 7022, '5 years', 39888125);
insert into COACH (speciality, salary, experience, person_id)
values ('Strength Training', 8129, '4 years', 417554829);
insert into COACH (speciality, salary, experience, person_id)
values ('Pilates', 10889, '16 years', 725658881);
insert into COACH (speciality, salary, experience, person_id)
values ('Weight Loss', 9517, '15 years', 363900520);
insert into COACH (speciality, salary, experience, person_id)
values ('Weight Loss', 7147, '15 years', 122333253);
insert into COACH (speciality, salary, experience, person_id)
values ('Bodybuilding', 8789, '17 years', 89807477);
insert into COACH (speciality, salary, experience, person_id)
values ('Pilates', 8633, '11 years', 153157217);
insert into COACH (speciality, salary, experience, person_id)
values ('Bodybuilding', 8973, '9 years', 883305631);
insert into COACH (speciality, salary, experience, person_id)
values ('Nutrition Coaching', 11700, '24 years', 84279082);
insert into COACH (speciality, salary, experience, person_id)
values ('Weight Loss', 9888, '24 years', 394750974);
insert into COACH (speciality, salary, experience, person_id)
values ('Cardio Fitness', 10681, '10 years', 801085395);
insert into COACH (speciality, salary, experience, person_id)
values ('Bodybuilding', 11839, '15 years', 330839612);
insert into COACH (speciality, salary, experience, person_id)
values ('Bodybuilding', 9083, '23 years', 157283500);
insert into COACH (speciality, salary, experience, person_id)
values ('Bodybuilding', 11673, '19 years', 938379550);
commit;
prompt 137 records loaded
prompt Loading GYM...
insert into GYM (address, schedule, gym_number, gym_name)
values (' 3265 7th Lane', ' Sunday-Tuesday 10:00-20:00', 1, ' Fitness Planet');
insert into GYM (address, schedule, gym_number, gym_name)
values (' 4589 Maple Avenue', ' Monday-Friday 06:00-22:00', 2, ' Health Hub');
insert into GYM (address, schedule, gym_number, gym_name)
values (' 8910 Oak Street', ' Tuesday-Thursday 08:00-18:00', 3, ' Powerhouse Gym');
insert into GYM (address, schedule, gym_number, gym_name)
values (' 1234 Elm Road', ' Monday-Wednesday 09:00-21:00', 4, ' Fit & Fine');
insert into GYM (address, schedule, gym_number, gym_name)
values (' 5678 Pine Street', ' Friday-Sunday 07:00-19:00', 5, ' Strength Center');
insert into GYM (address, schedule, gym_number, gym_name)
values (' 9101 Birch Avenue', ' Wednesday-Saturday 06:30-21:30', 6, ' Elite Fitness');
insert into GYM (address, schedule, gym_number, gym_name)
values (' 2345 Cedar Blvd', ' Monday-Friday 05:00-23:00', 7, ' Gym Flex');
insert into GYM (address, schedule, gym_number, gym_name)
values (' 6789 Spruce Drive', ' Saturday-Sunday 10:00-18:00', 8, ' Endurance Gym');
insert into GYM (address, schedule, gym_number, gym_name)
values (' 3456 Poplar Way', ' Tuesday-Thursday 12:00-22:00', 9, ' Total Fitness');
insert into GYM (address, schedule, gym_number, gym_name)
values (' 7890 Aspen Court', ' Monday-Saturday 09:00-19:00', 10, ' Ultimate Gym');
insert into GYM (address, schedule, gym_number, gym_name)
values (' 4567 Redwood Lane', ' Thursday-Sunday 08:00-20:00', 11, ' Peak Performance');
insert into GYM (address, schedule, gym_number, gym_name)
values (' 1122 Cherry Lane', ' Monday-Thursday 07:00-21:00', 12, ' Iron Paradise');
insert into GYM (address, schedule, gym_number, gym_name)
values (' 3344 Beech Street', ' Tuesday-Friday 08:00-22:00', 13, ' Fitness World');
insert into GYM (address, schedule, gym_number, gym_name)
values (' 5566 Willow Avenue', ' Wednesday-Sunday 06:00-18:00', 14, ' Muscle Factory');
insert into GYM (address, schedule, gym_number, gym_name)
values (' 7788 Dogwood Drive', ' Thursday-Saturday 10:00-20:00', 15, ' Cardio Central');
insert into GYM (address, schedule, gym_number, gym_name)
values (' 9900 Chestnut Road', ' Monday-Wednesday 09:00-19:00', 16, ' Flex Fitness');
insert into GYM (address, schedule, gym_number, gym_name)
values (' 2233 Walnut Boulevard', ' Saturday-Monday 07:30-21:30', 17, ' Power Performance');
insert into GYM (address, schedule, gym_number, gym_name)
values (' 4455 Magnolia Court', ' Sunday-Tuesday 08:00-20:00', 18, ' Strength Station');
insert into GYM (address, schedule, gym_number, gym_name)
values (' 6677 Hickory Street', ' Friday-Sunday 05:00-23:00', 19, ' The Gym Zone');
insert into GYM (address, schedule, gym_number, gym_name)
values (' 8899 Sycamore Avenue', ' Wednesday-Saturday 10:00-22:00', 20, ' Workout Wonders');
insert into GYM (address, schedule, gym_number, gym_name)
values (' 1010 Alder Way', ' Tuesday-Thursday 07:00-19:00', 21, ' Body Sculpt');
insert into GYM (address, schedule, gym_number, gym_name)
values (' 1212 Cypress Road', ' Monday-Saturday 06:00-20:00', 22, ' Fit Factory');
insert into GYM (address, schedule, gym_number, gym_name)
values (' 1414 Fir Lane', ' Thursday-Sunday 09:00-21:00', 23, ' Endurance Edge');
insert into GYM (address, schedule, gym_number, gym_name)
values (' 1616 Juniper Street', ' Wednesday-Friday 10:00-18:00', 24, ' Fitness Fusion');
insert into GYM (address, schedule, gym_number, gym_name)
values (' 1818 Laurel Boulevard', ' Saturday-Tuesday 08:30-20:30', 25, ' Total Body Gym');
insert into GYM (address, schedule, gym_number, gym_name)
values (' 2020 Maple Drive', ' Sunday-Wednesday 09:30-21:30', 26, ' Shape Up');
insert into GYM (address, schedule, gym_number, gym_name)
values (' 2222 Cedar Lane', ' Friday-Sunday 06:00-19:00', 27, ' Peak Fitness');
insert into GYM (address, schedule, gym_number, gym_name)
values (' 2424 Ash Street', ' Monday-Thursday 07:30-21:30', 28, ' Strength Haven');
insert into GYM (address, schedule, gym_number, gym_name)
values (' 2626 Alder Avenue', ' Tuesday-Saturday 08:00-22:00', 29, ' Power Gym');
insert into GYM (address, schedule, gym_number, gym_name)
values (' 2828 Birch Boulevard', ' Wednesday-Sunday 05:30-23:30', 30, ' The Fit Stop');
insert into GYM (address, schedule, gym_number, gym_name)
values (' 3030 Cedar Road', ' Monday-Friday 09:00-18:00', 31, ' Cardio Corner');
insert into GYM (address, schedule, gym_number, gym_name)
values (' 3232 Cypress Court', ' Saturday-Monday 06:30-20:30', 32, ' Muscle Mania');
insert into GYM (address, schedule, gym_number, gym_name)
values (' 3434 Elm Drive', ' Thursday-Sunday 07:00-19:00', 33, ' Fitness First');
insert into GYM (address, schedule, gym_number, gym_name)
values (' 3636 Fir Lane', ' Wednesday-Saturday 10:30-22:30', 34, ' Iron Works');
insert into GYM (address, schedule, gym_number, gym_name)
values (' 3838 Hickory Avenue', ' Monday-Wednesday 06:00-18:00', 35, ' Fit Body Gym');
insert into GYM (address, schedule, gym_number, gym_name)
values (' 4040 Maple Boulevard', ' Tuesday-Friday 08:00-20:00', 36, ' Endurance Elite');
insert into GYM (address, schedule, gym_number, gym_name)
values (' 4242 Oak Street', ' Thursday-Sunday 09:30-21:30', 37, ' Flex Appeal');
insert into GYM (address, schedule, gym_number, gym_name)
values (' 4444 Pine Lane', ' Monday-Thursday 05:00-19:00', 38, ' Muscle Works');
insert into GYM (address, schedule, gym_number, gym_name)
values (' 4646 Redwood Court', ' Saturday-Tuesday 07:30-21:30', 39, ' Strength and Conditioning');
insert into GYM (address, schedule, gym_number, gym_name)
values (' 4848 Spruce Drive', ' Sunday-Wednesday 08:00-20:00', 40, ' Fit World');
insert into GYM (address, schedule, gym_number, gym_name)
values (' 5050 Walnut Boulevard', ' Friday-Sunday 09:00-22:00', 41, ' Cardio Blast');
insert into GYM (address, schedule, gym_number, gym_name)
values (' 5252 Willow Street', ' Monday-Wednesday 06:30-19:30', 42, ' Iron Strength');
insert into GYM (address, schedule, gym_number, gym_name)
values (' 5454 Ash Lane', ' Tuesday-Thursday 10:00-18:00', 43, ' Power Hour');
insert into GYM (address, schedule, gym_number, gym_name)
values (' 5656 Beech Avenue', ' Wednesday-Saturday 07:00-20:00', 44, ' Fitness Zone');
insert into GYM (address, schedule, gym_number, gym_name)
values (' 5858 Cedar Drive', ' Thursday-Sunday 08:30-22:30', 45, ' Endurance Edge');
insert into GYM (address, schedule, gym_number, gym_name)
values (' 6060 Elm Court', ' Monday-Friday 05:30-18:30', 46, ' Flex Gym');
insert into GYM (address, schedule, gym_number, gym_name)
values (' 6262 Fir Boulevard', ' Saturday-Monday 09:00-21:00', 47, ' Fit Haven');
insert into GYM (address, schedule, gym_number, gym_name)
values (' 6464 Hickory Lane', ' Sunday-Tuesday 06:00-20:00', 48, ' Muscle Matters');
insert into GYM (address, schedule, gym_number, gym_name)
values (' 6666 Maple Avenue', ' Friday-Sunday 07:30-19:30', 49, ' Total Gym');
insert into GYM (address, schedule, gym_number, gym_name)
values (' 6868 Oak Road', ' Monday-Wednesday 10:00-22:00', 50, ' Cardio Kings');
insert into GYM (address, schedule, gym_number, gym_name)
values (' 7070 Pine Court', ' Tuesday-Thursday 09:00-21:00', 51, ' Fitness Pro');
commit;
prompt 51 records loaded
prompt Loading HALL...
insert into HALL (capacity, schedule, hall_number, gym_number)
values (25, 'Lift and Tone13:00 Pilates15:00', 1, 35);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (55, 'Lift and Tone11:00 Spinning16:00', 2, 6);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (30, 'Lift and Tone11:00 Pilates19:00', 3, 36);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (97, 'Zumba 10:00 Body Sculpt15:00', 4, 35);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (34, 'Lift and Tone12:00 Zumba 19:00', 5, 30);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (91, 'Pilates13:00 Lift and Tone16:00', 6, 35);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (31, 'Zumba 14:00 HIIT Fit15:00', 7, 4);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (77, 'Zumba 13:00 Dance Cardio19:00', 8, 46);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (25, 'Spinning11:00 Pilates16:00', 9, 9);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (75, 'Body Sculpt11:00 Pilates17:00', 10, 28);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (26, 'Pilates10:00 Pilates17:00', 11, 10);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (39, 'Pilates14:00 Body Sculpt19:00', 12, 17);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (40, 'Dance Cardio13:00 Dance Cardio16:00', 13, 12);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (23, 'Dance Cardio12:00 Pilates19:00', 14, 35);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (93, 'HIIT Fit14:00 Spinning18:00', 15, 37);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (29, 'Zumba 10:00 Zumba 19:00', 16, 45);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (67, 'Lift and Tone13:00 Body Sculpt18:00', 17, 18);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (70, 'Zumba 11:00 Spinning19:00', 18, 44);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (92, 'Pilates13:00 Body Sculpt15:00', 19, 44);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (54, 'Spinning12:00 Lift and Tone16:00', 20, 38);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (20, 'Zumba 12:00 Lift and Tone19:00', 21, 51);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (61, 'Zumba 13:00 Zumba 17:00', 22, 1);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (45, 'HIIT Fit11:00 Pilates18:00', 23, 49);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (83, 'Spinning11:00 HIIT Fit17:00', 24, 27);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (72, 'Lift and Tone11:00 Pilates15:00', 25, 6);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (91, 'Body Sculpt10:00 Zumba 15:00', 26, 18);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (37, 'HIIT Fit13:00 Pilates15:00', 27, 25);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (21, 'Spinning10:00 Zumba 19:00', 28, 2);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (88, 'Spinning10:00 Dance Cardio15:00', 29, 46);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (27, 'HIIT Fit10:00 Zumba 17:00', 30, 17);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (49, 'Pilates12:00 Pilates18:00', 31, 8);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (46, 'Spinning14:00 Lift and Tone16:00', 32, 43);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (43, 'Body Sculpt10:00 Lift and Tone17:00', 33, 50);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (54, 'Body Sculpt11:00 Pilates17:00', 34, 26);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (23, 'Lift and Tone13:00 Pilates18:00', 35, 30);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (99, 'Pilates11:00 Body Sculpt19:00', 36, 41);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (39, 'Zumba 13:00 Zumba 16:00', 37, 45);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (49, 'Zumba 12:00 Pilates19:00', 38, 2);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (28, 'Spinning10:00 Pilates18:00', 39, 4);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (76, 'Zumba 12:00 Dance Cardio15:00', 40, 12);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (81, 'Lift and Tone14:00 HIIT Fit18:00', 41, 38);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (52, 'Lift and Tone13:00 Lift and Tone16:00', 42, 10);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (21, 'Zumba 11:00 HIIT Fit17:00', 43, 44);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (58, 'Lift and Tone14:00 Body Sculpt16:00', 44, 4);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (23, 'Spinning11:00 Dance Cardio15:00', 45, 22);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (58, 'Spinning12:00 Zumba 17:00', 46, 23);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (93, 'Spinning10:00 Spinning19:00', 47, 27);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (20, 'Spinning11:00 Zumba 19:00', 48, 33);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (86, 'Dance Cardio10:00 Dance Cardio15:00', 49, 48);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (93, 'Dance Cardio10:00 Spinning19:00', 50, 33);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (82, 'Zumba 10:00 Zumba 18:00', 51, 44);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (77, 'Body Sculpt12:00 Lift and Tone15:00', 52, 21);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (82, 'Dance Cardio13:00 Pilates16:00', 53, 5);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (96, 'Body Sculpt12:00 Spinning18:00', 54, 40);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (79, 'Dance Cardio10:00 Pilates19:00', 55, 47);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (42, 'Dance Cardio10:00 Dance Cardio17:00', 56, 27);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (26, 'Spinning14:00 Pilates15:00', 57, 27);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (87, 'Pilates12:00 Lift and Tone17:00', 58, 31);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (40, 'HIIT Fit14:00 Spinning18:00', 59, 26);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (83, 'Lift and Tone13:00 HIIT Fit15:00', 60, 1);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (96, 'Spinning11:00 Zumba 18:00', 61, 4);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (57, 'Zumba 11:00 Zumba 15:00', 62, 12);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (64, 'Zumba 10:00 Lift and Tone18:00', 63, 43);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (48, 'Pilates11:00 Pilates18:00', 64, 2);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (42, 'Lift and Tone10:00 Dance Cardio18:00', 65, 17);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (71, 'Pilates12:00 HIIT Fit17:00', 66, 14);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (99, 'HIIT Fit10:00 Lift and Tone17:00', 67, 33);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (55, 'Zumba 10:00 Pilates18:00', 68, 37);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (50, 'HIIT Fit10:00 Zumba 19:00', 69, 38);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (80, 'Zumba 13:00 HIIT Fit15:00', 70, 3);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (63, 'Zumba 12:00 HIIT Fit15:00', 71, 27);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (69, 'Body Sculpt12:00 Body Sculpt19:00', 72, 50);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (72, 'Spinning10:00 Pilates16:00', 73, 35);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (37, 'HIIT Fit12:00 Lift and Tone19:00', 74, 24);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (51, 'HIIT Fit12:00 HIIT Fit17:00', 75, 32);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (94, 'Pilates13:00 HIIT Fit18:00', 76, 3);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (60, 'Pilates12:00 Pilates15:00', 77, 13);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (45, 'Lift and Tone10:00 Lift and Tone17:00', 78, 34);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (57, 'Pilates14:00 Lift and Tone17:00', 79, 29);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (88, 'Zumba 10:00 Dance Cardio18:00', 80, 47);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (34, 'Pilates14:00 Body Sculpt18:00', 81, 49);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (74, 'Lift and Tone11:00 Pilates15:00', 82, 32);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (32, 'Body Sculpt12:00 Body Sculpt17:00', 83, 42);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (82, 'Dance Cardio12:00 Lift and Tone17:00', 84, 21);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (77, 'Spinning13:00 Pilates18:00', 85, 4);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (44, 'Spinning12:00 HIIT Fit19:00', 86, 29);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (99, 'Lift and Tone10:00 Zumba 18:00', 87, 17);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (23, 'Zumba 12:00 Spinning16:00', 88, 13);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (95, 'Pilates10:00 Dance Cardio18:00', 89, 5);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (32, 'Lift and Tone13:00 Spinning19:00', 90, 48);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (58, 'HIIT Fit13:00 Lift and Tone15:00', 91, 16);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (70, 'Pilates13:00 Zumba 15:00', 92, 48);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (67, 'Spinning10:00 Lift and Tone17:00', 93, 30);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (44, 'HIIT Fit12:00 Dance Cardio18:00', 94, 30);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (96, 'Lift and Tone10:00 Pilates19:00', 95, 32);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (37, 'Pilates10:00 Pilates16:00', 96, 13);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (52, 'Pilates14:00 Dance Cardio19:00', 97, 14);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (71, 'Dance Cardio11:00 Body Sculpt16:00', 98, 17);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (55, 'Spinning10:00 Spinning18:00', 99, 13);
insert into HALL (capacity, schedule, hall_number, gym_number)
values (24, 'Dance Cardio10:00 Spinning15:00', 100, 39);
commit;
prompt 100 records loaded
prompt Loading CLASS_LESSON...
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('30-05-2024', 'dd-mm-yyyy'), 19, 'Age:40+  Gender:male  Fitness Level:Intermediate  Medical Conditions:not forpeople with back pain'' +', 'Body Sculpt', 1, to_date('11-09-2024', 'dd-mm-yyyy'), 'Tuesday', '16:22', 328828217, 38, 2);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('01-01-2024', 'dd-mm-yyyy'), 39, ' Age: 40+ Gender: male Fitness Level: Beginner Medical Conditions: no heart disease', ' Spinning', 12, to_date('29-11-2024', 'dd-mm-yyyy'), ' Monday', ' 10:00', 217841071, 17, 18);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('12-03-2024', 'dd-mm-yyyy'), 12, 'Age:18-35  Gender:female  Fitness Level:Beginner  Medical Conditions:not forpregnant women', 'Pilates', 121, to_date('05-10-2024', 'dd-mm-yyyy'), 'Monday', '11:21', 938379550, 68, 37);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('15-01-2024', 'dd-mm-yyyy'), 13, 'Age:18-35  Gender:male  Fitness Level:Advanced  Medical Conditions:not forpeople with back pain'' + ''', 'Dance Cardio', 144, to_date('21-09-2024', 'dd-mm-yyyy'), 'Tuesday', '14:53', 299858273, 74, 24);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('11-04-2024', 'dd-mm-yyyy'), 12, 'Age:60+  Gender:female  Fitness Level:Advanced  Medical Conditions:not forpeople with heart disease', 'Body Sculpt', 145, to_date('12-09-2024', 'dd-mm-yyyy'), 'Monday', '17:38', 330839612, 4, 35);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('06-01-2024', 'dd-mm-yyyy'), 20, ' Age: 60+ Gender: female Fitness Level: Advanced Medical Conditions: no asthma', ' HIIT Fit', 2, to_date('31-08-2024', 'dd-mm-yyyy'), ' Wednesday', ' 11:00', 132924806, 1, 35);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('04-01-2024', 'dd-mm-yyyy'), 35, ' Age: 18-35 Gender: female Fitness Level: Beginner Medical Conditions: no heart disease', ' Lift and Tone', 3, to_date('15-07-2024', 'dd-mm-yyyy'), ' Sunday', ' 15:00', 938969949, 25, 6);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('03-01-2024', 'dd-mm-yyyy'), 20, ' Age: 18-35 Gender: female Fitness Level: Beginner Medical Conditions: no asthma', ' Pilates', 9, to_date('14-10-2024', 'dd-mm-yyyy'), ' Wednesday', ' 12:00', 332700112, 30, 17);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('06-01-2024', 'dd-mm-yyyy'), 20, ' Age: 15-18 Gender: male Fitness Level: Beginner Medical Conditions: no asthma', ' Dance Cardio', 10, to_date('19-07-2024', 'dd-mm-yyyy'), ' Saturday', ' 12:00', 538284120, 8, 46);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('06-01-2024', 'dd-mm-yyyy'), 33, ' Age: 15-18 Gender: female Fitness Level: Intermediate Medical Conditions: no heart disease', ' Dance Cardio', 16, to_date('05-11-2024', 'dd-mm-yyyy'), ' Wednesday', ' 14:00', 537871085, 27, 25);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('03-01-2024', 'dd-mm-yyyy'), 23, ' Age: 18-35 Gender: male Fitness Level: Beginner Medical Conditions: no heart disease', ' HIIT Fit', 20, to_date('21-07-2024', 'dd-mm-yyyy'), ' Monday', ' 15:00', 538284120, 4, 35);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('04-01-2024', 'dd-mm-yyyy'), 36, ' Age: 60+ Gender: male Fitness Level: Advanced Medical Conditions: no back pain', ' Zumba', 22, to_date('01-09-2024', 'dd-mm-yyyy'), ' Thursday', ' 14:00', 538284120, 35, 30);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('06-01-2024', 'dd-mm-yyyy'), 32, ' Age: 18-35 Gender: female Fitness Level: Advanced Medical Conditions: no back pain', ' Dance Cardio', 23, to_date('07-12-2024', 'dd-mm-yyyy'), ' Tuesday', ' 10:00', 338258344, 22, 1);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('01-01-2024', 'dd-mm-yyyy'), 20, ' Age: 60+ Gender: male Fitness Level: Advanced Medical Conditions: no back pain', ' Lift and Tone', 25, to_date('28-12-2024', 'dd-mm-yyyy'), ' Thursday', ' 15:00', 538284120, 23, 49);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('04-01-2024', 'dd-mm-yyyy'), 24, ' Age: 15-18 Gender: female Fitness Level: Intermediate Medical Conditions: no heart disease', ' Zumba', 27, to_date('26-12-2024', 'dd-mm-yyyy'), ' Friday', ' 16:00', 132924806, 2, 6);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('04-01-2024', 'dd-mm-yyyy'), 33, ' Age: 18-35 Gender: female Fitness Level: Intermediate Medical Conditions: no back pain', ' Pilates', 33, to_date('15-09-2024', 'dd-mm-yyyy'), ' Tuesday', ' 15:00', 217841071, 29, 46);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('02-01-2024', 'dd-mm-yyyy'), 25, ' Age: 15-18 Gender: male Fitness Level: Beginner Medical Conditions: no asthma', ' Spinning', 34, to_date('21-10-2024', 'dd-mm-yyyy'), ' Monday', ' 14:00', 537871085, 17, 18);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('01-01-2024', 'dd-mm-yyyy'), 26, ' Age: 60+ Gender: male Fitness Level: Advanced Medical Conditions: no heart disease', ' Zumba', 35, to_date('14-11-2024', 'dd-mm-yyyy'), ' Thursday', ' 10:00', 132924806, 22, 1);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('04-01-2024', 'dd-mm-yyyy'), 23, ' Age: 15-18 Gender: female Fitness Level: Beginner Medical Conditions: no heart disease', ' Dance Cardio', 39, to_date('10-09-2024', 'dd-mm-yyyy'), ' Friday', ' 12:00', 538284120, 4, 35);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('06-01-2024', 'dd-mm-yyyy'), 37, ' Age: 18-35 Gender: female Fitness Level: Intermediate Medical Conditions: no asthma', ' Pilates', 40, to_date('29-06-2024', 'dd-mm-yyyy'), ' Tuesday', ' 10:00', 132924806, 8, 46);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('01-01-2024', 'dd-mm-yyyy'), 29, ' Age: 40+ Gender: male Fitness Level: Intermediate Medical Conditions: no heart disease', ' Zumba', 42, to_date('07-07-2024', 'dd-mm-yyyy'), ' Thursday', ' 14:00', 537871085, 30, 17);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('04-01-2024', 'dd-mm-yyyy'), 28, ' Age: 40+ Gender: male Fitness Level: Beginner Medical Conditions: no back pain', ' HIIT Fit', 44, to_date('22-11-2024', 'dd-mm-yyyy'), ' Tuesday', ' 15:00', 217841071, 35, 30);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('01-01-2024', 'dd-mm-yyyy'), 24, ' Age: 18-35 Gender: male Fitness Level: Beginner Medical Conditions: no heart disease', ' Zumba', 46, to_date('09-07-2024', 'dd-mm-yyyy'), ' Friday', ' 14:00', 132924806, 6, 35);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('03-01-2024', 'dd-mm-yyyy'), 34, ' Age: 60+ Gender: female Fitness Level: Advanced Medical Conditions: no heart disease', ' Spinning', 47, to_date('27-09-2024', 'dd-mm-yyyy'), ' Thursday', ' 12:00', 538284120, 17, 18);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('02-01-2024', 'dd-mm-yyyy'), 20, ' Age: 18-35 Gender: female Fitness Level: Intermediate Medical Conditions: no back pain', ' Body Sculpt', 49, to_date('30-10-2024', 'dd-mm-yyyy'), ' Saturday', ' 15:00', 217841071, 4, 35);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('01-01-2024', 'dd-mm-yyyy'), 30, ' Age: 40+ Gender: female Fitness Level: Intermediate Medical Conditions: no asthma', ' Pilates', 51, to_date('15-07-2024', 'dd-mm-yyyy'), ' Tuesday', ' 10:00', 132924806, 17, 18);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('02-01-2024', 'dd-mm-yyyy'), 37, ' Age: 60+ Gender: female Fitness Level: Beginner Medical Conditions: no asthma', ' Pilates', 58, to_date('19-12-2024', 'dd-mm-yyyy'), ' Saturday', ' 10:00', 217841071, 27, 25);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('05-01-2024', 'dd-mm-yyyy'), 22, ' Age: 18-35 Gender: male Fitness Level: Beginner Medical Conditions: no back pain', ' Dance Cardio', 59, to_date('17-08-2024', 'dd-mm-yyyy'), ' Tuesday', ' 12:00', 132924806, 17, 18);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('03-01-2024', 'dd-mm-yyyy'), 35, ' Age: 60+ Gender: female Fitness Level: Beginner Medical Conditions: no back pain', ' Dance Cardio', 66, to_date('09-08-2024', 'dd-mm-yyyy'), ' Tuesday', ' 11:00', 217841071, 27, 25);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('01-01-2024', 'dd-mm-yyyy'), 32, ' Age: 18-35 Gender: male Fitness Level: Beginner Medical Conditions: no pregnant women', ' Body Sculpt', 67, to_date('12-10-2024', 'dd-mm-yyyy'), ' Thursday', ' 12:00', 132924806, 17, 18);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('06-01-2024', 'dd-mm-yyyy'), 29, ' Age: 60+ Gender: female Fitness Level: Advanced Medical Conditions: no pregnant women', ' Body Sculpt', 73, to_date('22-07-2024', 'dd-mm-yyyy'), ' Thursday', ' 12:00', 217841071, 27, 25);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('04-01-2024', 'dd-mm-yyyy'), 37, ' Age: 18-35 Gender: male Fitness Level: Intermediate Medical Conditions: no heart disease', ' Spinning', 74, to_date('11-11-2024', 'dd-mm-yyyy'), ' Wednesday', ' 15:00', 132924806, 17, 18);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('02-01-2024', 'dd-mm-yyyy'), 23, ' Age: 60+ Gender: female Fitness Level: Advanced Medical Conditions: no asthma', ' Body Sculpt', 80, to_date('10-07-2024', 'dd-mm-yyyy'), ' Tuesday', ' 15:00', 217841071, 27, 25);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('06-01-2024', 'dd-mm-yyyy'), 28, ' Age: 18-35 Gender: female Fitness Level: Intermediate Medical Conditions: no pregnant women', ' Spinning', 81, to_date('18-09-2024', 'dd-mm-yyyy'), ' Monday', ' 11:00', 132924806, 17, 18);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('06-01-2024', 'dd-mm-yyyy'), 38, ' Age: 60+ Gender: male Fitness Level: Advanced Medical Conditions: no heart disease', ' Body Sculpt', 87, to_date('20-10-2024', 'dd-mm-yyyy'), ' Sunday', ' 16:00', 217841071, 27, 25);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('04-01-2024', 'dd-mm-yyyy'), 22, ' Age: 18-35 Gender: female Fitness Level: Beginner Medical Conditions: no back pain', ' Spinning', 88, to_date('19-08-2024', 'dd-mm-yyyy'), ' Friday', ' 11:00', 132924806, 17, 18);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('05-01-2024', 'dd-mm-yyyy'), 37, ' Age: 60+ Gender: male Fitness Level: Advanced Medical Conditions: no heart disease', ' Body Sculpt', 93, to_date('04-09-2024', 'dd-mm-yyyy'), ' Wednesday', ' 10:00', 217841071, 27, 25);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('06-01-2024', 'dd-mm-yyyy'), 26, ' Age: 18-35 Gender: male Fitness Level: Beginner Medical Conditions: no pregnant women', ' Spinning', 94, to_date('22-08-2024', 'dd-mm-yyyy'), ' Tuesday', ' 15:00', 132924806, 17, 18);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('04-01-2024', 'dd-mm-yyyy'), 38, ' Age: 60+ Gender: female Fitness Level: Advanced Medical Conditions: no asthma', ' Body Sculpt', 100, to_date('29-10-2024', 'dd-mm-yyyy'), ' Friday', ' 16:00', 217841071, 27, 25);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('05-01-2024', 'dd-mm-yyyy'), 29, ' Age: 18-35 Gender: male Fitness Level: Beginner Medical Conditions: no heart disease', ' Spinning', 101, to_date('23-11-2024', 'dd-mm-yyyy'), ' Tuesday', ' 10:00', 132924806, 17, 18);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('06-01-2024', 'dd-mm-yyyy'), 37, ' Age: 60+ Gender: female Fitness Level: Advanced Medical Conditions: no heart disease', ' Body Sculpt', 107, to_date('14-09-2024', 'dd-mm-yyyy'), ' Thursday', ' 10:00', 217841071, 27, 25);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('04-01-2024', 'dd-mm-yyyy'), 26, ' Age: 18-35 Gender: male Fitness Level: Beginner Medical Conditions: no pregnant women', ' Spinning', 108, to_date('21-11-2024', 'dd-mm-yyyy'), ' Friday', ' 11:00', 132924806, 17, 18);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('20-02-2024', 'dd-mm-yyyy'), 35, ' Age: 40+ Gender: female Fitness Level: Advanced Medical Conditions: no asthma', ' Pilates', 112, to_date('15-09-2024', 'dd-mm-yyyy'), ' Monday', ' 14:00', 792753892, 18, 44);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('12-04-2024', 'dd-mm-yyyy'), 12, ' Age: 15-18 Gender: male Fitness Level: Intermediate Medical Conditions: no heart disease', ' Yoga', 113, to_date('23-10-2024', 'dd-mm-yyyy'), ' Thursday', ' 13:00', 919189920, 21, 51);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('05-02-2024', 'dd-mm-yyyy'), 30, ' Age: 18-35 Gender: male Fitness Level: Beginner Medical Conditions: no pregnant women', ' CrossFit', 114, to_date('10-12-2024', 'dd-mm-yyyy'), ' Tuesday', ' 17:00', 278701404, 16, 45);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('20-05-2024', 'dd-mm-yyyy'), 25, ' Age: 15-18 Gender: male Fitness Level: Intermediate Medical Conditions: no back pain', ' Spinning', 115, to_date('05-10-2024', 'dd-mm-yyyy'), ' Saturday', ' 13:00', 88847666, 41, 38);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('29-02-2024', 'dd-mm-yyyy'), 17, ' Age: 18-35 Gender: female Fitness Level: Advanced Medical Conditions: no asthma', ' Bootcamp', 116, to_date('01-10-2024', 'dd-mm-yyyy'), ' Tuesday', ' 18:00', 936296296, 47, 27);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('25-03-2024', 'dd-mm-yyyy'), 28, ' Age: 60+ Gender: female Fitness Level: Beginner Medical Conditions: no back pain', ' Piloxing', 117, to_date('28-08-2024', 'dd-mm-yyyy'), ' Thursday', ' 15:00', 332700112, 54, 40);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('10-05-2024', 'dd-mm-yyyy'), 18, ' Age: 60+ Gender: male Fitness Level: Intermediate Medical Conditions: no heart disease', ' Yoga', 118, to_date('30-11-2024', 'dd-mm-yyyy'), ' Sunday', ' 15:00', 621394627, 18, 44);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('03-04-2024', 'dd-mm-yyyy'), 14, ' Age: 40+ Gender: female Fitness Level: Advanced Medical Conditions: no heart disease', ' CrossFit', 119, to_date('29-09-2024', 'dd-mm-yyyy'), ' Sunday', ' 12:00', 270436980, 93, 30);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('19-06-2024', 'dd-mm-yyyy'), 37, ' Age: 15-18 Gender: male Fitness Level: Beginner Medical Conditions: no pregnant women', ' Spinning', 120, to_date('26-07-2024', 'dd-mm-yyyy'), ' Friday', ' 14:00', 644624124, 5, 30);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('08-06-2024', 'dd-mm-yyyy'), 40, ' Age: 15-18 Gender: male Fitness Level: Advanced Medical Conditions: no asthma', ' Bootcamp', 122, to_date('25-12-2024', 'dd-mm-yyyy'), ' Thursday', ' 15:00', 451950079, 24, 27);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('01-05-2024', 'dd-mm-yyyy'), 32, ' Age: 15-18 Gender: female Fitness Level: Intermediate Medical Conditions: no pregnant women', ' Yoga', 123, to_date('03-11-2024', 'dd-mm-yyyy'), ' Sunday', ' 16:00', 88847666, 78, 34);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('14-01-2024', 'dd-mm-yyyy'), 26, ' Age: 60+ Gender: male Fitness Level: Beginner Medical Conditions: no heart disease', ' Piloxing', 124, to_date('19-12-2024', 'dd-mm-yyyy'), ' Thursday', ' 10:00', 278701404, 48, 33);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('29-04-2024', 'dd-mm-yyyy'), 11, ' Age: 18-35 Gender: male Fitness Level: Advanced Medical Conditions: no heart disease', ' CrossFit', 125, to_date('06-09-2024', 'dd-mm-yyyy'), ' Thursday', ' 18:00', 509609652, 74, 24);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('10-06-2024', 'dd-mm-yyyy'), 20, ' Age: 18-35 Gender: male Fitness Level: Intermediate Medical Conditions: no heart disease', ' Zumba', 126, to_date('24-10-2024', 'dd-mm-yyyy'), ' Thursday', ' 15:00', 278701404, 66, 14);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('16-05-2024', 'dd-mm-yyyy'), 21, ' Age: 40+ Gender: female Fitness Level: Advanced Medical Conditions: no heart disease', ' Pilates', 127, to_date('12-12-2024', 'dd-mm-yyyy'), ' Thursday', ' 14:00', 88847666, 68, 37);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('09-01-2024', 'dd-mm-yyyy'), 19, ' Age: 18-35 Gender: male Fitness Level: Intermediate Medical Conditions: no pregnant women', ' Bootcamp', 128, to_date('08-10-2024', 'dd-mm-yyyy'), ' Tuesday', ' 12:00', 509609652, 92, 48);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('25-04-2024', 'dd-mm-yyyy'), 39, ' Age: 15-18 Gender: female Fitness Level: Intermediate Medical Conditions: no heart disease', ' Yoga', 129, to_date('06-12-2024', 'dd-mm-yyyy'), ' Friday', ' 16:00', 792753892, 36, 41);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('29-05-2024', 'dd-mm-yyyy'), 17, ' Age: 40+ Gender: male Fitness Level: Beginner Medical Conditions: no back pain', ' Spinning', 130, to_date('05-11-2024', 'dd-mm-yyyy'), ' Tuesday', ' 17:00', 404616118, 49, 48);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('08-02-2024', 'dd-mm-yyyy'), 25, ' Age: 60+ Gender: female Fitness Level: Advanced Medical Conditions: no heart disease', ' Piloxing', 131, to_date('26-10-2024', 'dd-mm-yyyy'), ' Saturday', ' 10:00', 165021958, 71, 27);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('12-03-2024', 'dd-mm-yyyy'), 28, ' Age: 15-18 Gender: male Fitness Level: Intermediate Medical Conditions: no heart disease', ' Zumba', 132, to_date('11-11-2024', 'dd-mm-yyyy'), ' Monday', ' 11:00', 278701404, 3, 36);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('17-04-2024', 'dd-mm-yyyy'), 34, ' Age: 18-35 Gender: female Fitness Level: Advanced Medical Conditions: no pregnant women', ' Pilates', 133, to_date('08-07-2024', 'dd-mm-yyyy'), ' Thursday', ' 13:00', 88847666, 20, 38);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('23-02-2024', 'dd-mm-yyyy'), 22, ' Age: 18-35 Gender: male Fitness Level: Beginner Medical Conditions: no asthma', ' CrossFit', 135, to_date('14-12-2024', 'dd-mm-yyyy'), ' Saturday', ' 14:00', 230610385, 29, 46);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('05-04-2024', 'dd-mm-yyyy'), 31, ' Age: 60+ Gender: female Fitness Level: Intermediate Medical Conditions: no heart disease', ' Yoga', 136, to_date('08-11-2024', 'dd-mm-yyyy'), ' Saturday', ' 13:00', 278701404, 56, 27);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('02-06-2024', 'dd-mm-yyyy'), 27, ' Age: 15-18 Gender: female Fitness Level: Beginner Medical Conditions: no asthma', ' Spinning', 137, to_date('03-07-2024', 'dd-mm-yyyy'), ' Thursday', ' 15:00', 926205546, 35, 30);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('19-01-2024', 'dd-mm-yyyy'), 14, ' Age: 18-35 Gender: male Fitness Level: Advanced Medical Conditions: no back pain', ' Pilates', 138, to_date('21-07-2024', 'dd-mm-yyyy'), ' Sunday', ' 12:00', 404616118, 6, 35);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('05-05-2024', 'dd-mm-yyyy'), 37, ' Age: 15-18 Gender: female Fitness Level: Intermediate Medical Conditions: no asthma', ' Bootcamp', 139, to_date('24-09-2024', 'dd-mm-yyyy'), ' Tuesday', ' 16:00', 926205546, 82, 32);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('22-03-2024', 'dd-mm-yyyy'), 40, ' Age: 60+ Gender: female Fitness Level: Advanced Medical Conditions: no pregnant women', ' Piloxing', 140, to_date('12-08-2024', 'dd-mm-yyyy'), ' Tuesday', ' 17:00', 965564108, 77, 13);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('25-06-2024', 'dd-mm-yyyy'), 33, ' Age: 15-18 Gender: male Fitness Level: Beginner Medical Conditions: no back pain', ' Zumba', 141, to_date('26-08-2024', 'dd-mm-yyyy'), ' Monday', ' 14:00', 644624124, 23, 49);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('11-02-2024', 'dd-mm-yyyy'), 25, ' Age: 40+ Gender: female Fitness Level: Intermediate Medical Conditions: no pregnant women', ' Pilates', 142, to_date('18-08-2024', 'dd-mm-yyyy'), ' Wednesday', ' 11:00', 278701404, 97, 14);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('22-05-2024', 'dd-mm-yyyy'), 30, ' Age: 15-18 Gender: male Fitness Level: Advanced Medical Conditions: no heart disease', ' CrossFit', 143, to_date('15-10-2024', 'dd-mm-yyyy'), ' Wednesday', ' 15:00', 165021958, 2, 6);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('12-06-2024', 'dd-mm-yyyy'), 29, ' Age: 18-35 Gender: male Fitness Level: Advanced Medical Conditions: no asthma', ' Bootcamp', 146, to_date('04-12-2024', 'dd-mm-yyyy'), ' Wednesday', ' 18:00', 278701404, 26, 18);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('03-05-2024', 'dd-mm-yyyy'), 24, ' Age: 15-18 Gender: male Fitness Level: Intermediate Medical Conditions: no heart disease', ' Spinning', 147, to_date('30-11-2024', 'dd-mm-yyyy'), ' Saturday', ' 16:00', 91717809, 58, 31);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('27-03-2024', 'dd-mm-yyyy'), 18, ' Age: 40+ Gender: female Fitness Level: Advanced Medical Conditions: no back pain', ' Pilates', 148, to_date('22-07-2024', 'dd-mm-yyyy'), ' Wednesday', ' 13:00', 88847666, 89, 5);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('16-01-2024', 'dd-mm-yyyy'), 26, ' Age: 15-18 Gender: male Fitness Level: Beginner Medical Conditions: no heart disease', ' Yoga', 149, to_date('18-12-2024', 'dd-mm-yyyy'), ' Thursday', ' 10:00', 165021958, 66, 14);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('14-06-2024', 'dd-mm-yyyy'), 19, ' Age: 18-35 Gender: female Fitness Level: Intermediate Medical Conditions: no back pain', ' Zumba', 150, to_date('10-11-2024', 'dd-mm-yyyy'), ' Sunday', ' 12:00', 509609652, 43, 44);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('08-04-2024', 'dd-mm-yyyy'), 21, ' Age: 60+ Gender: female Fitness Level: Advanced Medical Conditions: no asthma', ' Piloxing', 151, to_date('19-10-2024', 'dd-mm-yyyy'), ' Saturday', ' 10:00', 278701404, 95, 32);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('24-05-2024', 'dd-mm-yyyy'), 27, ' Age: 40+ Gender: male Fitness Level: Intermediate Medical Conditions: no back pain', ' CrossFit', 152, to_date('10-09-2024', 'dd-mm-yyyy'), ' Thursday', ' 15:00', 165021958, 3, 36);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('02-03-2024', 'dd-mm-yyyy'), 34, ' Age: 18-35 Gender: female Fitness Level: Beginner Medical Conditions: no pregnant women', ' Pilates', 153, to_date('30-08-2024', 'dd-mm-yyyy'), ' Saturday', ' 16:00', 926205546, 79, 29);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('28-06-2024', 'dd-mm-yyyy'), 15, ' Age: 15-18 Gender: male Fitness Level: Advanced Medical Conditions: no asthma', ' Bootcamp', 154, to_date('12-10-2024', 'dd-mm-yyyy'), ' Saturday', ' 17:00', 165021958, 25, 6);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('17-02-2024', 'dd-mm-yyyy'), 33, ' Age: 60+ Gender: female Fitness Level: Intermediate Medical Conditions: no back pain', ' Yoga', 155, to_date('02-07-2024', 'dd-mm-yyyy'), ' Tuesday', ' 12:00', 88847666, 33, 50);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('08-03-2024', 'dd-mm-yyyy'), 28, ' Age: 18-35 Gender: male Fitness Level: Beginner Medical Conditions: no heart disease', ' Zumba', 156, to_date('15-09-2024', 'dd-mm-yyyy'), ' Sunday', ' 14:00', 666931958, 56, 27);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('20-06-2024', 'dd-mm-yyyy'), 23, ' Age: 40+ Gender: male Fitness Level: Advanced Medical Conditions: no back pain', ' Pilates', 157, to_date('14-08-2024', 'dd-mm-yyyy'), ' Wednesday', ' 17:00', 88847666, 89, 5);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('15-04-2024', 'dd-mm-yyyy'), 20, ' Age: 15-18 Gender: female Fitness Level: Intermediate Medical Conditions: no asthma', ' Spinning', 158, to_date('07-09-2024', 'dd-mm-yyyy'), ' Saturday', ' 12:00', 165021958, 51, 44);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('17-05-2024', 'dd-mm-yyyy'), 22, ' Age: 18-35 Gender: male Fitness Level: Advanced Medical Conditions: no pregnant women', ' CrossFit', 159, to_date('01-09-2024', 'dd-mm-yyyy'), ' Sunday', ' 11:00', 165021958, 17, 18);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('26-02-2024', 'dd-mm-yyyy'), 32, ' Age: 40+ Gender: female Fitness Level: Intermediate Medical Conditions: no asthma', ' Pilates', 160, to_date('26-09-2024', 'dd-mm-yyyy'), ' Thursday', ' 16:00', 88847666, 97, 14);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('10-06-2024', 'dd-mm-yyyy'), 37, ' Age: 15-18 Gender: male Fitness Level: Beginner Medical Conditions: no heart disease', ' Bootcamp', 161, to_date('03-12-2024', 'dd-mm-yyyy'), ' Tuesday', ' 15:00', 926205546, 21, 51);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('18-04-2024', 'dd-mm-yyyy'), 38, ' Age: 60+ Gender: male Fitness Level: Intermediate Medical Conditions: no back pain', ' Yoga', 162, to_date('12-10-2024', 'dd-mm-yyyy'), ' Saturday', ' 13:00', 165021958, 67, 33);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('14-01-2024', 'dd-mm-yyyy'), 31, ' Age: 18-35 Gender: female Fitness Level: Beginner Medical Conditions: no pregnant women', ' Pilates', 163, to_date('20-08-2024', 'dd-mm-yyyy'), ' Tuesday', ' 12:00', 278701404, 85, 4);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('28-05-2024', 'dd-mm-yyyy'), 29, ' Age: 40+ Gender: female Fitness Level: Advanced Medical Conditions: no asthma', ' Pilates', 164, to_date('30-10-2024', 'dd-mm-yyyy'), ' Wednesday', ' 11:00', 88847666, 56, 27);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('02-04-2024', 'dd-mm-yyyy'), 19, ' Age: 15-18 Gender: male Fitness Level: Intermediate Medical Conditions: no back pain', ' Spinning', 165, to_date('02-07-2024', 'dd-mm-yyyy'), ' Wednesday', ' 14:00', 165021958, 23, 49);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('05-06-2024', 'dd-mm-yyyy'), 25, ' Age: 18-35 Gender: male Fitness Level: Advanced Medical Conditions: no pregnant women', ' CrossFit', 166, to_date('12-10-2024', 'dd-mm-yyyy'), ' Wednesday', ' 17:00', 926205546, 66, 14);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('15-02-2024', 'dd-mm-yyyy'), 26, ' Age: 40+ Gender: female Fitness Level: Beginner Medical Conditions: no asthma', ' Piloxing', 167, to_date('29-10-2024', 'dd-mm-yyyy'), ' Sunday', ' 15:00', 278701404, 77, 13);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('18-06-2024', 'dd-mm-yyyy'), 17, ' Age: 15-18 Gender: female Fitness Level: Intermediate Medical Conditions: no heart disease', ' Yoga', 168, to_date('15-10-2024', 'dd-mm-yyyy'), ' Tuesday', ' 16:00', 91717809, 13, 12);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('03-05-2024', 'dd-mm-yyyy'), 36, ' Age: 18-35 Gender: male Fitness Level: Beginner Medical Conditions: no back pain', ' Bootcamp', 169, to_date('25-08-2024', 'dd-mm-yyyy'), ' Sunday', ' 13:00', 926205546, 57, 27);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('09-04-2024', 'dd-mm-yyyy'), 15, ' Age: 60+ Gender: female Fitness Level: Advanced Medical Conditions: no pregnant women', ' Piloxing', 170, to_date('23-09-2024', 'dd-mm-yyyy'), ' Monday', ' 12:00', 965564108, 32, 43);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('01-03-2024', 'dd-mm-yyyy'), 21, ' Age: 18-35 Gender: male Fitness Level: Intermediate Medical Conditions: no asthma', ' Pilates', 171, to_date('06-11-2024', 'dd-mm-yyyy'), ' Saturday', ' 11:00', 165021958, 97, 14);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('22-06-2024', 'dd-mm-yyyy'), 30, ' Age: 40+ Gender: female Fitness Level: Beginner Medical Conditions: no heart disease', ' Spinning', 172, to_date('13-10-2024', 'dd-mm-yyyy'), ' Wednesday', ' 10:00', 278701404, 85, 4);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('06-05-2024', 'dd-mm-yyyy'), 18, ' Age: 15-18 Gender: male Fitness Level: Advanced Medical Conditions: no back pain', ' CrossFit', 173, to_date('30-11-2024', 'dd-mm-yyyy'), ' Saturday', ' 14:00', 404616118, 38, 2);
commit;
prompt 100 records committed...
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('24-02-2024', 'dd-mm-yyyy'), 23, ' Age: 18-35 Gender: female Fitness Level: Intermediate Medical Conditions: no pregnant women', ' Yoga', 174, to_date('18-07-2024', 'dd-mm-yyyy'), ' Thursday', ' 16:00', 926205546, 21, 51);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('05-04-2024', 'dd-mm-yyyy'), 24, ' Age: 40+ Gender: male Fitness Level: Advanced Medical Conditions: no asthma', ' Pilates', 175, to_date('10-11-2024', 'dd-mm-yyyy'), ' Sunday', ' 12:00', 88847666, 66, 14);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('30-05-2024', 'dd-mm-yyyy'), 21, ' Age: 15-18 Gender: female Fitness Level: Beginner Medical Conditions: no heart disease', ' Yoga', 176, to_date('08-09-2024', 'dd-mm-yyyy'), ' Sunday', ' 15:00', 165021958, 67, 33);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('03-02-2024', 'dd-mm-yyyy'), 20, ' Age: 60+ Gender: male Fitness Level: Intermediate Medical Conditions: no back pain', ' Zumba', 177, to_date('08-12-2024', 'dd-mm-yyyy'), ' Sunday', ' 16:00', 165021958, 56, 27);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('16-03-2024', 'dd-mm-yyyy'), 34, ' Age: 18-35 Gender: male Fitness Level: Beginner Medical Conditions: no pregnant women', ' Bootcamp', 178, to_date('18-11-2024', 'dd-mm-yyyy'), ' Monday', ' 10:00', 278701404, 89, 5);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('19-06-2024', 'dd-mm-yyyy'), 26, ' Age: 40+ Gender: female Fitness Level: Advanced Medical Conditions: no asthma', ' Piloxing', 179, to_date('14-09-2024', 'dd-mm-yyyy'), ' Tuesday', ' 11:00', 278701404, 62, 12);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('28-01-2024', 'dd-mm-yyyy'), 28, ' Age: 15-18 Gender: male Fitness Level: Intermediate Medical Conditions: no back pain', ' Yoga', 180, to_date('20-12-2024', 'dd-mm-yyyy'), ' Friday', ' 14:00', 278701404, 62, 12);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('08-04-2024', 'dd-mm-yyyy'), 19, ' Age: 18-35 Gender: female Fitness Level: Beginner Medical Conditions: no heart disease', ' CrossFit', 181, to_date('26-11-2024', 'dd-mm-yyyy'), ' Tuesday', ' 15:00', 926205546, 13, 12);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('07-06-2024', 'dd-mm-yyyy'), 33, ' Age: 40+ Gender: male Fitness Level: Intermediate Medical Conditions: no pregnant women', ' Pilates', 182, to_date('18-08-2024', 'dd-mm-yyyy'), ' Wednesday', ' 16:00', 278701404, 31, 8);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('14-05-2024', 'dd-mm-yyyy'), 37, ' Age: 15-18 Gender: female Fitness Level: Advanced Medical Conditions: no asthma', ' Spinning', 183, to_date('02-10-2024', 'dd-mm-yyyy'), ' Monday', ' 17:00', 165021958, 53, 5);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('11-01-2024', 'dd-mm-yyyy'), 38, ' Age: 18-35 Gender: male Fitness Level: Beginner Medical Conditions: no back pain', ' Bootcamp', 184, to_date('16-11-2024', 'dd-mm-yyyy'), ' Saturday', ' 18:00', 278701404, 89, 5);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('25-03-2024', 'dd-mm-yyyy'), 15, ' Age: 40+ Gender: female Fitness Level: Advanced Medical Conditions: no heart disease', ' Pilates', 185, to_date('05-11-2024', 'dd-mm-yyyy'), ' Tuesday', ' 10:00', 88847666, 62, 12);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('09-05-2024', 'dd-mm-yyyy'), 27, ' Age: 15-18 Gender: male Fitness Level: Intermediate Medical Conditions: no pregnant women', ' CrossFit', 186, to_date('04-09-2024', 'dd-mm-yyyy'), ' Thursday', ' 11:00', 926205546, 27, 25);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('31-01-2024', 'dd-mm-yyyy'), 29, ' Age: 18-35 Gender: female Fitness Level: Beginner Medical Conditions: no asthma', ' Yoga', 187, to_date('29-09-2024', 'dd-mm-yyyy'), ' Wednesday', ' 12:00', 926205546, 36, 41);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('20-04-2024', 'dd-mm-yyyy'), 31, ' Age: 40+ Gender: male Fitness Level: Intermediate Medical Conditions: no back pain', ' Pilates', 188, to_date('03-12-2024', 'dd-mm-yyyy'), ' Sunday', ' 13:00', 88847666, 3, 36);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('11-06-2024', 'dd-mm-yyyy'), 23, ' Age: 15-18 Gender: female Fitness Level: Advanced Medical Conditions: no heart disease', ' Spinning', 189, to_date('02-11-2024', 'dd-mm-yyyy'), ' Tuesday', ' 14:00', 165021958, 75, 32);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('05-03-2024', 'dd-mm-yyyy'), 32, ' Age: 18-35 Gender: male Fitness Level: Beginner Medical Conditions: no pregnant women', ' Bootcamp', 190, to_date('15-10-2024', 'dd-mm-yyyy'), ' Tuesday', ' 15:00', 165021958, 96, 13);
insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('13-06-2024', 'dd-mm-yyyy'), 18, ' Age: 40+ Gender: female Fitness Level: Advanced Medical Conditions: no asthma', ' Pilates', 191, to_date('08-12-2024', 'dd-mm-yyyy'), ' Thursday', ' 16:00', 88847666, 96, 13);
commit;
prompt 118 records loaded
prompt Loading DEVICE...
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 1, 'Mind Your Hands and Feet Don''t Overextend', 35, 30);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 2, 'Secure Your Grip Use Full Range of Motion', 6, 35);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 3, 'Adjust Seat and Settings Stay Balanced', 36, 41);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 4, 'Stay Balanced No Jumping or Leaning', 35, 30);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 5, 'Mind Your Hands and Feet Use Full Range of Motion', 30, 17);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 6, 'Secure Your Grip Don''t Overextend', 35, 30);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 7, 'Adjust Seat and Settings Maintain Posture', 4, 35);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 8, 'Mind Your Hands and Feet Use Full Range of Motion', 46, 23);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 9, 'Secure Your Grip No Jumping or Leaning', 9, 9);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 10, 'Stay Balanced Maintain Posture', 28, 2);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 11, 'Adjust Seat and Settings Don''t Overextend', 10, 28);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 12, 'Mind Your Hands and Feet Use Full Range of Motion', 17, 18);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 13, 'Secure Your Grip Maintain Posture', 12, 17);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 14, 'Adjust Seat and Settings Don''t Overextend', 35, 30);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 15, 'Stay Balanced No Jumping or Leaning', 37, 45);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 16, 'Mind Your Hands and Feet Use Full Range of Motion', 45, 22);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 17, 'Secure Your Grip Maintain Posture', 18, 44);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 18, 'Adjust Seat and Settings Don''t Overextend', 44, 4);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 19, 'Stay Balanced No Jumping or Leaning', 44, 4);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 20, 'Mind Your Hands and Feet Use Full Range of Motion', 38, 2);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 21, 'Secure Your Grip Maintain Posture', 51, 44);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 22, 'Adjust Seat and Settings Don''t Overextend', 1, 35);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 23, 'Stay Balanced No Jumping or Leaning', 49, 48);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 24, 'Mind Your Hands and Feet Use Full Range of Motion', 27, 25);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 25, 'Secure Your Grip Don''t Overextend', 6, 35);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 26, 'Adjust Seat and Settings Stay Balanced', 18, 44);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 27, 'Mind Your Hands and Feet Use Full Range of Motion', 2, 6);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 28, 'Secure Your Grip No Jumping or Leaning', 18, 44);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 29, 'Stay Balanced Maintain Posture', 46, 23);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 30, 'Adjust Seat and Settings Don''t Overextend', 17, 18);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 31, 'Mind Your Hands and Feet Use Full Range of Motion', 8, 46);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 32, 'Secure Your Grip Maintain Posture', 46, 23);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 33, 'Adjust Seat and Settings Don''t Overextend', 9, 9);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 34, 'Stay Balanced No Jumping or Leaning', 28, 2);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 35, 'Mind Your Hands and Feet Use Full Range of Motion', 10, 28);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 36, 'Secure Your Grip Maintain Posture', 17, 18);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 37, 'Adjust Seat and Settings Don''t Overextend', 12, 17);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 38, 'Stay Balanced No Jumping or Leaning', 35, 30);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 39, 'Mind Your Hands and Feet Use Full Range of Motion', 37, 45);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 40, 'Secure Your Grip Maintain Posture', 45, 22);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 41, 'Adjust Seat and Settings Don''t Overextend', 18, 44);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 42, 'Stay Balanced No Jumping or Leaning', 44, 4);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 43, 'Mind Your Hands and Feet Use Full Range of Motion', 44, 4);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 44, 'Secure Your Grip Maintain Posture', 38, 2);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 45, 'Adjust Seat and Settings Don''t Overextend', 44, 4);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 46, 'Stay Balanced No Jumping or Leaning', 1, 35);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 47, 'Mind Your Hands and Feet Use Full Range of Motion', 49, 48);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 48, 'Secure Your Grip Maintain Posture', 27, 25);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 49, 'Adjust Seat and Settings Don''t Overextend', 6, 35);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 50, 'Mind Your Hands and Feet Use Full Range of Motion', 18, 44);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 51, 'Secure Your Grip No Jumping or Leaning', 2, 6);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 52, 'Stay Balanced Maintain Posture', 18, 44);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 53, 'Adjust Seat and Settings Don''t Overextend', 46, 23);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 54, 'Mind Your Hands and Feet Use Full Range of Motion', 17, 18);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 55, 'Secure Your Grip Maintain Posture', 8, 46);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 56, 'Adjust Seat and Settings Don''t Overextend', 46, 23);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 57, 'Stay Balanced No Jumping or Leaning', 9, 9);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 58, 'Mind Your Hands and Feet Use Full Range of Motion', 28, 2);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 59, 'Secure Your Grip Maintain Posture', 10, 28);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 60, 'Adjust Seat and Settings Don''t Overextend', 17, 18);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 61, 'Stay Balanced No Jumping or Leaning', 12, 17);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 62, 'Mind Your Hands and Feet Use Full Range of Motion', 35, 30);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 63, 'Secure Your Grip Maintain Posture', 37, 45);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 64, 'Adjust Seat and Settings Don''t Overextend', 45, 22);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 65, 'Stay Balanced No Jumping or Leaning', 18, 44);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 66, 'Mind Your Hands and Feet Use Full Range of Motion', 44, 4);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 67, 'Secure Your Grip Maintain Posture', 44, 4);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 68, 'Adjust Seat and Settings Don''t Overextend', 38, 2);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 69, 'Stay Balanced No Jumping or Leaning', 44, 4);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 70, 'Mind Your Hands and Feet Use Full Range of Motion', 1, 35);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 71, 'Secure Your Grip Maintain Posture', 49, 48);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 72, 'Adjust Seat and Settings Don''t Overextend', 27, 25);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 73, 'Stay Balanced No Jumping or Leaning', 6, 35);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 74, 'Mind Your Hands and Feet Use Full Range of Motion', 18, 44);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 75, 'Secure Your Grip No Jumping or Leaning', 2, 6);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 76, 'Stay Balanced Maintain Posture', 18, 44);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 77, 'Adjust Seat and Settings Don''t Overextend', 46, 23);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 78, 'Mind Your Hands and Feet Use Full Range of Motion', 17, 18);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 79, 'Secure Your Grip Maintain Posture', 8, 46);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 80, 'Adjust Seat and Settings Don''t Overextend', 46, 23);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 81, 'Stay Balanced No Jumping or Leaning', 9, 9);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 82, 'Mind Your Hands and Feet Use Full Range of Motion', 28, 2);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 83, 'Secure Your Grip Maintain Posture', 10, 28);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 84, 'Adjust Seat and Settings Don''t Overextend', 17, 18);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 85, 'Stay Balanced No Jumping or Leaning', 12, 17);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 86, 'Mind Your Hands and Feet Use Full Range of Motion', 35, 30);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 87, 'Secure Your Grip Maintain Posture', 37, 45);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 88, 'Adjust Seat and Settings Don''t Overextend', 45, 22);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 89, 'Stay Balanced No Jumping or Leaning', 18, 44);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 90, 'Mind Your Hands and Feet Use Full Range of Motion', 44, 4);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 91, 'Secure Your Grip Maintain Posture', 44, 4);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 92, 'Adjust Seat and Settings Don''t Overextend', 38, 2);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 93, 'Stay Balanced No Jumping or Leaning', 44, 4);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 94, 'Mind Your Hands and Feet Use Full Range of Motion', 1, 35);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 95, 'Secure Your Grip Maintain Posture', 49, 48);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 96, 'Adjust Seat and Settings Don''t Overextend', 27, 25);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 97, 'Stay Balanced No Jumping or Leaning', 6, 35);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 98, 'Mind Your Hands and Feet Use Full Range of Motion', 18, 44);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 99, 'Secure Your Grip No Jumping or Leaning', 2, 6);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 100, 'Stay Balanced Maintain Posture', 18, 44);
commit;
prompt 100 records committed...
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 101, 'Adjust Seat and Settings Don''t Overextend', 46, 23);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 102, 'Mind Your Hands and Feet Use Full Range of Motion', 17, 18);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 103, 'Secure Your Grip Maintain Posture', 8, 46);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 104, 'Adjust Seat and Settings Don''t Overextend', 46, 23);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 105, 'Stay Balanced No Jumping or Leaning', 9, 9);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 106, 'Mind Your Hands and Feet Use Full Range of Motion', 28, 2);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 107, 'Secure Your Grip Maintain Posture', 10, 28);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 108, 'Adjust Seat and Settings Don''t Overextend', 17, 18);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 109, 'Stay Balanced No Jumping or Leaning', 12, 17);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 110, 'Mind Your Hands and Feet Use Full Range of Motion', 35, 30);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 111, 'Secure Your Grip Maintain Posture', 37, 45);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 112, 'Adjust Seat and Settings Don''t Overextend', 45, 22);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 113, 'Stay Balanced No Jumping or Leaning', 18, 44);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 114, 'Mind Your Hands and Feet Use Full Range of Motion', 44, 4);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 115, 'Secure Your Grip Maintain Posture', 44, 4);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 116, 'Adjust Seat and Settings Don''t Overextend', 38, 2);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 117, 'Stay Balanced No Jumping or Leaning', 44, 4);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 118, 'Mind Your Hands and Feet Use Full Range of Motion', 1, 35);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 119, 'Secure Your Grip Maintain Posture', 49, 48);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 120, 'Adjust Seat and Settings Don''t Overextend', 27, 25);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 121, 'Stay Balanced No Jumping or Leaning', 6, 35);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 122, 'Mind Your Hands and Feet Use Full Range of Motion', 18, 44);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 123, 'Secure Your Grip No Jumping or Leaning', 2, 6);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 124, 'Stay Balanced Maintain Posture', 18, 44);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 125, 'Adjust Seat and Settings Don''t Overextend', 46, 23);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 126, 'Mind Your Hands and Feet Use Full Range of Motion', 17, 18);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 127, 'Secure Your Grip Maintain Posture', 8, 46);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 128, 'Adjust Seat and Settings Don''t Overextend', 46, 23);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 129, 'Stay Balanced No Jumping or Leaning', 9, 9);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 130, 'Mind Your Hands and Feet Use Full Range of Motion', 28, 2);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 131, 'Secure Your Grip Maintain Posture', 10, 28);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 132, 'Adjust Seat and Settings Don''t Overextend', 17, 18);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 133, 'Stay Balanced No Jumping or Leaning', 12, 17);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 134, 'Mind Your Hands and Feet Use Full Range of Motion', 35, 30);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 135, 'Secure Your Grip Maintain Posture', 37, 45);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 136, 'Adjust Seat and Settings Don''t Overextend', 45, 22);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 137, 'Stay Balanced No Jumping or Leaning', 18, 44);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 138, 'Mind Your Hands and Feet Use Full Range of Motion', 44, 4);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 139, 'Secure Your Grip Maintain Posture', 44, 4);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 140, 'Adjust Seat and Settings Don''t Overextend', 38, 2);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 141, 'Stay Balanced No Jumping or Leaning', 44, 4);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 142, 'Mind Your Hands and Feet Use Full Range of Motion', 1, 35);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 143, 'Secure Your Grip Maintain Posture', 49, 48);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 144, 'Adjust Seat and Settings Don''t Overextend', 27, 25);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 145, 'Stay Balanced No Jumping or Leaning', 6, 35);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 146, 'Mind Your Hands and Feet Use Full Range of Motion', 18, 44);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 147, 'Secure Your Grip No Jumping or Leaning', 2, 6);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 148, 'Stay Balanced Maintain Posture', 18, 44);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 149, 'Adjust Seat and Settings Don''t Overextend', 46, 23);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 150, 'Mind Your Hands and Feet Use Full Range of Motion', 17, 18);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 151, 'Secure Your Grip Maintain Posture', 8, 46);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 152, 'Adjust Seat and Settings Don''t Overextend', 46, 23);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 153, 'Stay Balanced No Jumping or Leaning', 9, 9);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 154, 'Mind Your Hands and Feet Use Full Range of Motion', 28, 2);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 155, 'Secure Your Grip Maintain Posture', 10, 28);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 156, 'Adjust Seat and Settings Don''t Overextend', 17, 18);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 157, 'Stay Balanced No Jumping or Leaning', 12, 17);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 158, 'Mind Your Hands and Feet Use Full Range of Motion', 35, 30);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 159, 'Secure Your Grip Maintain Posture', 37, 45);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 160, 'Adjust Seat and Settings Don''t Overextend', 45, 22);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 161, 'Stay Balanced No Jumping or Leaning', 18, 44);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 162, 'Mind Your Hands and Feet Use Full Range of Motion', 44, 4);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 163, 'Secure Your Grip Maintain Posture', 44, 4);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 164, 'Adjust Seat and Settings Don''t Overextend', 38, 2);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 165, 'Stay Balanced No Jumping or Leaning', 44, 4);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 166, 'Mind Your Hands and Feet Use Full Range of Motion', 1, 35);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 167, 'Secure Your Grip Maintain Posture', 49, 48);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 168, 'Adjust Seat and Settings Don''t Overextend', 27, 25);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 169, 'Stay Balanced No Jumping or Leaning', 6, 35);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 170, 'Mind Your Hands and Feet Use Full Range of Motion', 18, 44);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 171, 'Secure Your Grip No Jumping or Leaning', 2, 6);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 172, 'Stay Balanced Maintain Posture', 18, 44);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 173, 'Adjust Seat and Settings Don''t Overextend', 46, 23);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 174, 'Mind Your Hands and Feet Use Full Range of Motion', 17, 18);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 175, 'Secure Your Grip Maintain Posture', 8, 46);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 176, 'Adjust Seat and Settings Don''t Overextend', 46, 23);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 177, 'Stay Balanced No Jumping or Leaning', 9, 9);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 178, 'Mind Your Hands and Feet Use Full Range of Motion', 28, 2);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 179, 'Secure Your Grip Maintain Posture', 10, 28);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 180, 'Adjust Seat and Settings Don''t Overextend', 17, 18);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 181, 'Stay Balanced No Jumping or Leaning', 12, 17);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 182, 'Mind Your Hands and Feet Use Full Range of Motion', 35, 30);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 183, 'Secure Your Grip Maintain Posture', 37, 45);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 184, 'Adjust Seat and Settings Don''t Overextend', 45, 22);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 185, 'Stay Balanced No Jumping or Leaning', 18, 44);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 186, 'Mind Your Hands and Feet Use Full Range of Motion', 44, 4);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 187, 'Secure Your Grip Maintain Posture', 44, 4);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 188, 'Adjust Seat and Settings Don''t Overextend', 38, 2);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 189, 'Stay Balanced No Jumping or Leaning', 44, 4);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 190, 'Mind Your Hands and Feet Use Full Range of Motion', 1, 35);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 191, 'Secure Your Grip Maintain Posture', 49, 48);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 192, 'Adjust Seat and Settings Don''t Overextend', 27, 25);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 193, 'Stay Balanced No Jumping or Leaning', 6, 35);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 194, 'Mind Your Hands and Feet Use Full Range of Motion', 18, 44);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 195, 'Secure Your Grip No Jumping or Leaning', 2, 6);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 196, 'Stay Balanced Maintain Posture', 18, 44);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 197, 'Adjust Seat and Settings Don''t Overextend', 46, 23);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 198, 'Mind Your Hands and Feet Use Full Range of Motion', 17, 18);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 199, 'Secure Your Grip Maintain Posture', 8, 46);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 200, 'Adjust Seat and Settings Don''t Overextend', 46, 23);
commit;
prompt 200 records committed...
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 201, 'Stay Balanced No Jumping or Leaning', 9, 9);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 202, 'Mind Your Hands and Feet Use Full Range of Motion', 28, 2);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 203, 'Secure Your Grip Maintain Posture', 10, 28);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 204, 'Adjust Seat and Settings Don''t Overextend', 17, 18);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 205, 'Stay Balanced No Jumping or Leaning', 12, 17);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 206, 'Mind Your Hands and Feet Use Full Range of Motion', 35, 30);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 207, 'Secure Your Grip Maintain Posture', 37, 45);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 208, 'Adjust Seat and Settings Don''t Overextend', 45, 22);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 209, 'Stay Balanced No Jumping or Leaning', 18, 44);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 210, 'Mind Your Hands and Feet Use Full Range of Motion', 44, 4);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 211, 'Secure Your Grip Maintain Posture', 44, 4);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 212, 'Adjust Seat and Settings Don''t Overextend', 38, 2);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 213, 'Stay Balanced No Jumping or Leaning', 44, 4);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 214, 'Mind Your Hands and Feet Use Full Range of Motion', 1, 35);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 215, 'Secure Your Grip Maintain Posture', 49, 48);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 216, 'Adjust Seat and Settings Don''t Overextend', 27, 25);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 217, 'Stay Balanced No Jumping or Leaning', 6, 35);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 218, 'Mind Your Hands and Feet Use Full Range of Motion', 18, 44);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 219, 'Secure Your Grip No Jumping or Leaning', 2, 6);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 220, 'Stay Balanced Maintain Posture', 18, 44);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 221, 'Adjust Seat and Settings Don''t Overextend', 46, 23);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 222, 'Mind Your Hands and Feet Use Full Range of Motion', 17, 18);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 223, 'Secure Your Grip Maintain Posture', 8, 46);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 224, 'Adjust Seat and Settings Don''t Overextend', 46, 23);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 225, 'Stay Balanced No Jumping or Leaning', 9, 9);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 226, 'Mind Your Hands and Feet Use Full Range of Motion', 28, 2);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 227, 'Secure Your Grip Maintain Posture', 10, 28);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 228, 'Adjust Seat and Settings Don''t Overextend', 17, 18);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 229, 'Stay Balanced No Jumping or Leaning', 12, 17);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 230, 'Mind Your Hands and Feet Use Full Range of Motion', 35, 30);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 231, 'Secure Your Grip Maintain Posture', 37, 45);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 232, 'Adjust Seat and Settings Don''t Overextend', 45, 22);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 233, 'Stay Balanced No Jumping or Leaning', 18, 44);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 234, 'Mind Your Hands and Feet Use Full Range of Motion', 44, 4);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 235, 'Secure Your Grip Maintain Posture', 44, 4);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 236, 'Adjust Seat and Settings Don''t Overextend', 38, 2);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 237, 'Stay Balanced No Jumping or Leaning', 44, 4);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 238, 'Mind Your Hands and Feet Use Full Range of Motion', 1, 35);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 239, 'Secure Your Grip Maintain Posture', 49, 48);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 240, 'Adjust Seat and Settings Don''t Overextend', 27, 25);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 241, 'Stay Balanced No Jumping or Leaning', 6, 35);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 242, 'Mind Your Hands and Feet Use Full Range of Motion', 18, 44);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 243, 'Secure Your Grip No Jumping or Leaning', 2, 6);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 244, 'Stay Balanced Maintain Posture', 18, 44);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 245, 'Adjust Seat and Settings Don''t Overextend', 46, 23);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 246, 'Mind Your Hands and Feet Use Full Range of Motion', 17, 18);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 247, 'Secure Your Grip Maintain Posture', 8, 46);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 248, 'Adjust Seat and Settings Don''t Overextend', 46, 23);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 249, 'Stay Balanced No Jumping or Leaning', 9, 9);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 250, 'Mind Your Hands and Feet Use Full Range of Motion', 28, 2);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 251, 'Secure Your Grip Maintain Posture', 10, 28);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 252, 'Adjust Seat and Settings Don''t Overextend', 17, 18);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 253, 'Stay Balanced No Jumping or Leaning', 12, 17);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 254, 'Mind Your Hands and Feet Use Full Range of Motion', 35, 30);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 255, 'Secure Your Grip Maintain Posture', 37, 45);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 256, 'Adjust Seat and Settings Don''t Overextend', 45, 22);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 257, 'Stay Balanced No Jumping or Leaning', 18, 44);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 258, 'Mind Your Hands and Feet Use Full Range of Motion', 44, 4);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 259, 'Secure Your Grip Maintain Posture', 44, 4);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 260, 'Adjust Seat and Settings Don''t Overextend', 38, 2);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 261, 'Stay Balanced No Jumping or Leaning', 44, 4);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 262, 'Mind Your Hands and Feet Use Full Range of Motion', 1, 35);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 263, 'Secure Your Grip Maintain Posture', 49, 48);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 264, 'Adjust Seat and Settings Don''t Overextend', 27, 25);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 265, 'Stay Balanced No Jumping or Leaning', 6, 35);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 266, 'Mind Your Hands and Feet Use Full Range of Motion', 18, 44);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 267, 'Secure Your Grip No Jumping or Leaning', 2, 6);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 268, 'Stay Balanced Maintain Posture', 18, 44);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 269, 'Adjust Seat and Settings Don''t Overextend', 46, 23);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 270, 'Mind Your Hands and Feet Use Full Range of Motion', 17, 18);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 271, 'Secure Your Grip Maintain Posture', 8, 46);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 272, 'Adjust Seat and Settings Don''t Overextend', 46, 23);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 273, 'Stay Balanced No Jumping or Leaning', 9, 9);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 274, 'Mind Your Hands and Feet Use Full Range of Motion', 28, 2);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 275, 'Secure Your Grip Maintain Posture', 10, 28);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 276, 'Adjust Seat and Settings Don''t Overextend', 17, 18);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 277, 'Stay Balanced No Jumping or Leaning', 12, 17);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 278, 'Mind Your Hands and Feet Use Full Range of Motion', 35, 30);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 279, 'Secure Your Grip Maintain Posture', 37, 45);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 280, 'Adjust Seat and Settings Don''t Overextend', 45, 22);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 281, 'Stay Balanced No Jumping or Leaning', 18, 44);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 282, 'Mind Your Hands and Feet Use Full Range of Motion', 44, 4);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 283, 'Secure Your Grip Maintain Posture', 44, 4);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 284, 'Adjust Seat and Settings Don''t Overextend', 38, 2);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 285, 'Stay Balanced No Jumping or Leaning', 44, 4);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 286, 'Mind Your Hands and Feet Use Full Range of Motion', 1, 35);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 287, 'Secure Your Grip Maintain Posture', 49, 48);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 288, 'Adjust Seat and Settings Don''t Overextend', 27, 25);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 289, 'Stay Balanced No Jumping or Leaning', 6, 35);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 290, 'Mind Your Hands and Feet Use Full Range of Motion', 18, 44);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 291, 'Secure Your Grip No Jumping or Leaning', 2, 6);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 292, 'Stay Balanced Maintain Posture', 18, 44);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 293, 'Adjust Seat and Settings Don''t Overextend', 46, 23);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 294, 'Mind Your Hands and Feet Use Full Range of Motion', 17, 18);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 295, 'Adjust Seat and Settings No Jumping or Leaning', 33, 50);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 296, 'Stay Balanced Maintain Posture', 30, 17);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 297, 'Mind Your Hands and Feet Use Full Range of Motion', 8, 46);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 298, 'Secure Your Grip Don''t Overextend', 43, 44);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 299, 'Adjust Seat and Settings No Jumping or Leaning', 50, 33);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 300, 'Mind Your Hands and Feet Maintain Posture', 21, 51);
commit;
prompt 300 records committed...
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 301, 'Stay Balanced Use Full Range of Motion', 1, 35);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 302, 'Secure Your Grip Don''t Overextend', 49, 48);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 303, 'Adjust Seat and Settings No Jumping or Leaning', 46, 23);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 304, 'Mind Your Hands and Feet Maintain Posture', 27, 25);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 305, 'Stay Balanced Use Full Range of Motion', 2, 6);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 306, 'Secure Your Grip Don''t Overextend', 17, 18);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 307, 'Adjust Seat and Settings No Jumping or Leaning', 44, 4);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 308, 'Mind Your Hands and Feet Maintain Posture', 4, 35);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 309, 'Stay Balanced Use Full Range of Motion', 31, 8);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 310, 'Secure Your Grip Don''t Overextend', 22, 1);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 311, 'Adjust Seat and Settings No Jumping or Leaning', 33, 50);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 312, 'Mind Your Hands and Feet Maintain Posture', 32, 43);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 313, 'Stay Balanced Use Full Range of Motion', 30, 17);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 314, 'Secure Your Grip Don''t Overextend', 34, 26);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 315, 'Adjust Seat and Settings No Jumping or Leaning', 47, 27);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 316, 'Mind Your Hands and Feet Maintain Posture', 27, 25);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 317, 'Stay Balanced Use Full Range of Motion', 18, 44);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 318, 'Secure Your Grip Don''t Overextend', 2, 6);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 319, 'Mind Your Hands and Feet Use Full Range of Motion', 44, 4);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 320, 'Stay Balanced Don''t Overextend', 21, 51);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 321, 'Adjust Seat and Settings No Jumping or Leaning', 5, 30);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 322, 'Secure Your Grip Maintain Posture', 46, 23);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 323, 'Mind Your Hands and Feet Don''t Overextend', 13, 12);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 324, 'Stay Balanced Use Full Range of Motion', 18, 44);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 325, 'Secure Your Grip No Jumping or Leaning', 38, 2);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 326, 'Mind Your Hands and Feet Maintain Posture', 22, 1);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 327, 'Stay Balanced Use Full Range of Motion', 9, 9);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 328, 'Adjust Seat and Settings Don''t Overextend', 31, 8);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 329, 'Secure Your Grip Maintain Posture', 10, 28);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 330, 'Mind Your Hands and Feet Use Full Range of Motion', 50, 33);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 331, 'Stay Balanced No Jumping or Leaning', 45, 22);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 332, 'Adjust Seat and Settings Maintain Posture', 33, 50);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 333, 'Secure Your Grip Don''t Overextend', 3, 36);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 334, 'Mind Your Hands and Feet Use Full Range of Motion', 27, 25);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 335, 'Stay Balanced No Jumping or Leaning', 5, 30);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 336, 'Adjust Seat and Settings Maintain Posture', 17, 18);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 337, 'Secure Your Grip Don''t Overextend', 43, 44);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 338, 'Mind Your Hands and Feet Use Full Range of Motion', 33, 50);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 339, 'Stay Balanced No Jumping or Leaning', 1, 35);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 340, 'Adjust Seat and Settings Maintain Posture', 8, 46);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 341, 'Secure Your Grip Don''t Overextend', 17, 18);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 342, 'Mind Your Hands and Feet Use Full Range of Motion', 13, 12);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 343, 'Stay Balanced No Jumping or Leaning', 22, 1);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 344, 'Adjust Seat and Settings Maintain Posture', 9, 9);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 345, 'Secure Your Grip Don''t Overextend', 5, 30);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 346, 'Mind Your Hands and Feet Use Full Range of Motion', 31, 8);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 347, 'Stay Balanced No Jumping or Leaning', 10, 28);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 348, 'Adjust Seat and Settings Maintain Posture', 50, 33);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 349, 'Secure Your Grip Don''t Overextend', 45, 22);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 350, 'Mind Your Hands and Feet Use Full Range of Motion', 33, 50);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 351, 'Stay Balanced No Jumping or Leaning', 3, 36);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 352, 'Adjust Seat and Settings Maintain Posture', 27, 25);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 353, 'Secure Your Grip Don''t Overextend', 5, 30);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 354, 'Mind Your Hands and Feet Use Full Range of Motion', 17, 18);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 355, 'Stay Balanced No Jumping or Leaning', 43, 44);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 356, 'Adjust Seat and Settings Maintain Posture', 33, 50);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 357, 'Secure Your Grip Don''t Overextend', 1, 35);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 358, 'Mind Your Hands and Feet Use Full Range of Motion', 8, 46);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 359, 'Stay Balanced No Jumping or Leaning', 13, 12);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 360, 'Adjust Seat and Settings Maintain Posture', 5, 30);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 361, 'Mind Your Hands and Feet Don''t Overextend', 46, 23);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 362, 'Secure Your Grip Maintain Posture', 25, 6);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 363, 'Adjust Seat and Settings Use Full Range of Motion', 4, 35);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 364, 'Stay Balanced No Jumping or Leaning', 43, 44);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 365, 'Mind Your Hands and Feet Don''t Overextend', 2, 6);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 366, 'Secure Your Grip Maintain Posture', 13, 12);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 367, 'Adjust Seat and Settings Use Full Range of Motion', 38, 2);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 368, 'Stay Balanced No Jumping or Leaning', 24, 27);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 369, 'Mind Your Hands and Feet Don''t Overextend', 41, 38);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 370, 'Secure Your Grip Maintain Posture', 33, 50);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 371, 'Adjust Seat and Settings Use Full Range of Motion', 35, 30);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 372, 'Stay Balanced No Jumping or Leaning', 4, 35);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 373, 'Mind Your Hands and Feet Don''t Overextend', 6, 35);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 374, 'Secure Your Grip Maintain Posture', 39, 4);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 375, 'Adjust Seat and Settings Use Full Range of Motion', 12, 17);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 376, 'Stay Balanced No Jumping or Leaning', 31, 8);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 377, 'Mind Your Hands and Feet Don''t Overextend', 45, 22);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 378, 'Secure Your Grip Maintain Posture', 5, 30);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 379, 'Adjust Seat and Settings Use Full Range of Motion', 33, 50);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 380, 'Stay Balanced No Jumping or Leaning', 8, 46);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 381, 'Mind Your Hands and Feet Don''t Overextend', 49, 48);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 382, 'Secure Your Grip Maintain Posture', 46, 23);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 383, 'Adjust Seat and Settings Use Full Range of Motion', 44, 4);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 384, 'Stay Balanced No Jumping or Leaning', 21, 51);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 385, 'Mind Your Hands and Feet Don''t Overextend', 27, 25);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 386, 'Secure Your Grip Maintain Posture', 18, 44);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 387, 'Adjust Seat and Settings Use Full Range of Motion', 30, 17);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 388, 'Stay Balanced No Jumping or Leaning', 35, 30);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 389, 'Mind Your Hands and Feet Don''t Overextend', 38, 2);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 390, 'Secure Your Grip Maintain Posture', 39, 4);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 391, 'Adjust Seat and Settings Use Full Range of Motion', 12, 17);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 392, 'Stay Balanced No Jumping or Leaning', 10, 28);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 393, 'Mind Your Hands and Feet Don''t Overextend', 17, 18);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 394, 'Secure Your Grip Maintain Posture', 51, 44);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 395, 'Adjust Seat and Settings Use Full Range of Motion', 6, 35);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 396, 'Stay Balanced No Jumping or Leaning', 1, 35);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 397, 'Mind Your Hands and Feet Don''t Overextend', 37, 45);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 398, 'Secure Your Grip Maintain Posture', 22, 1);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 399, 'Adjust Seat and Settings Use Full Range of Motion', 33, 50);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 400, 'Stay Balanced No Jumping or Leaning', 17, 18);
commit;
prompt 400 records committed...
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 401, 'Mind Your Hands and Feet Don''t Overextend', 32, 43);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 402, 'Secure Your Grip Maintain Posture', 42, 10);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 403, 'Adjust Seat and Settings Use Full Range of Motion', 44, 4);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 404, 'Stay Balanced No Jumping or Leaning', 4, 35);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 405, 'Mind Your Hands and Feet Don''t Overextend', 12, 17);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 406, 'Secure Your Grip Maintain Posture', 38, 2);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 407, 'Adjust Seat and Settings Use Full Range of Motion', 4, 35);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 408, 'Stay Balanced No Jumping or Leaning', 10, 28);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 409, 'Mind Your Hands and Feet Don''t Overextend', 18, 44);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 410, 'Secure Your Grip Maintain Posture', 30, 17);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 411, 'Adjust Seat and Settings Use Full Range of Motion', 35, 30);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 412, 'Stay Balanced No Jumping or Leaning', 21, 51);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 413, 'Mind Your Hands and Feet Don''t Overextend', 27, 25);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 414, 'Secure Your Grip Maintain Posture', 46, 23);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Treadmill', 415, 'Adjust Seat and Settings Use Full Range of Motion', 49, 48);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Spinning Bike', 416, 'Stay Balanced No Jumping or Leaning', 44, 4);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Cable Machine', 417, 'Mind Your Hands and Feet Don''t Overextend', 22, 1);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Dumbbells', 418, 'Secure Your Grip Maintain Posture', 33, 50);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Weight Plates', 419, 'Adjust Seat and Settings Use Full Range of Motion', 17, 18);
insert into DEVICE (device_model, device_number, instructions, hall_number, gym_number)
values ('Stepmills', 420, 'Stay Balanced No Jumping or Leaning', 51, 44);
commit;
prompt 420 records loaded
prompt Loading TRAINEE...
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue Body Sculpt Mon-Wed Spinning', 'Full Health', 'credit card', 90, to_date('21-03-2024', 'dd-mm-yyyy'), 548380542);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Family Membership', 'Sun-Tue Pilates Mon-Wed Lift-Tone', 'Injuries', 'coupon', 50, to_date('26-02-2024', 'dd-mm-yyyy'), 394441189);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Basic Membership', 'Sun-Tue HIIT Mon-Wed Lift-Tone', 'Injuries', 'credit card', 24, to_date('22-05-2024', 'dd-mm-yyyy'), 246437667);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Basic Membership', 'Sun-Tue Cardio Mon-Wed Body Sculpt', 'Full Health', 'credit card', 74, to_date('11-04-2024', 'dd-mm-yyyy'), 336899848);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Personal Training Membership', 'Sun-Tue Spinning Mon-Wed ''HIIT', 'High Blood Pressure', 'cash', 94, to_date('10-01-2024', 'dd-mm-yyyy'), 950590951);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Family Membership', 'Sun-Tue HIIT Mon-Wed Cardio', 'Full Health', 'cash', 14, to_date('02-01-2024', 'dd-mm-yyyy'), 843698732);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Family Membership', 'Sun-Tue Pilates Mon-Wed Cardio', 'High Blood Pressure', 'credit card', 54, to_date('23-03-2024', 'dd-mm-yyyy'), 39350391);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue Spinning Mon-Wed Cardio', 'High Blood Pressure', 'cash', 43, to_date('20-02-2024', 'dd-mm-yyyy'), 446464107);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Family Membership', 'Sun-Tue Cardio Mon-Wed Pilates', 'Chronic Respiratory Conditions', 'coupon', 80, to_date('19-02-2024', 'dd-mm-yyyy'), 342560579);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Standard Membership', 'Sun-Tue HIIT Mon-Wed Zumba ', 'High Blood Pressure', 'coupon', 44, to_date('29-03-2024', 'dd-mm-yyyy'), 230610385);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue Spinning Mon-Wed Body Sculpt', 'High Blood Pressure', 'coupon', 53, to_date('21-04-2024', 'dd-mm-yyyy'), 9419613);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Standard Membership', 'Sun-Tue Spinning Mon-Wed Pilates', 'Heart Disease', 'coupon', 24, to_date('05-02-2024', 'dd-mm-yyyy'), 16269226);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Personal Training Membership', 'Sun-Tue Spinning Mon-Wed Cardio', 'Chronic Respiratory Conditions', 'cash', 64, to_date('01-03-2024', 'dd-mm-yyyy'), 938969949);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue Pilates Mon-Wed Spinning', 'Heart Disease', 'credit card', 16, to_date('19-04-2024', 'dd-mm-yyyy'), 332700112);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Basic Membership', 'Sun-Tue Lift-Tone Mon-Wed ''HIIT', 'Full Health', 'credit card', 42, to_date('21-05-2024', 'dd-mm-yyyy'), 826426071);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue Zumba  Mon-Wed Spinning', 'High Blood Pressure', 'cash', 95, to_date('20-02-2024', 'dd-mm-yyyy'), 891605799);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue Cardio Mon-Wed Body Sculpt', 'Heart Disease', 'credit card', 57, to_date('02-03-2024', 'dd-mm-yyyy'), 48591713);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue Spinning Mon-Wed Cardio', 'High Blood Pressure', 'credit card', 76, to_date('23-03-2024', 'dd-mm-yyyy'), 622710490);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue Cardio Mon-Wed Spinning', 'High Blood Pressure', 'coupon', 58, to_date('28-04-2024', 'dd-mm-yyyy'), 992774372);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue Spinning Mon-Wed Cardio', 'Chronic Respiratory Conditions', 'coupon', 78, to_date('28-03-2024', 'dd-mm-yyyy'), 941326323);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Family Membership', 'Sun-Tue Body Sculpt Mon-Wed Cardio', 'High Blood Pressure', 'coupon', 92, to_date('18-01-2024', 'dd-mm-yyyy'), 984798679);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Personal Training Membership', 'Sun-Tue Cardio Mon-Wed Cardio', 'Full Health', 'cash', 93, to_date('12-04-2024', 'dd-mm-yyyy'), 351195569);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue Cardio Mon-Wed Pilates', 'Chronic Respiratory Conditions', 'coupon', 99, to_date('24-05-2024', 'dd-mm-yyyy'), 940153696);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Family Membership', 'Sun-Tue Lift-Tone Mon-Wed Pilates', 'Injuries', 'cash', 58, to_date('12-05-2024', 'dd-mm-yyyy'), 860618977);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Standard Membership', 'Sun-Tue Lift-Tone Mon-Wed Zumba ', 'Chronic Respiratory Conditions', 'credit card', 95, to_date('12-03-2024', 'dd-mm-yyyy'), 483523397);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue Spinning Mon-Wed Spinning', 'Chronic Respiratory Conditions', 'credit card', 73, to_date('05-05-2024', 'dd-mm-yyyy'), 945225421);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Basic Membership', 'Sun-Tue Lift-Tone Mon-Wed Body Sculpt', 'Full Health', 'cash', 53, to_date('13-01-2024', 'dd-mm-yyyy'), 973430375);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Standard Membership', 'Sun-Tue Body Sculpt Mon-Wed Cardio', 'Injuries', 'coupon', 60, to_date('06-04-2024', 'dd-mm-yyyy'), 988216871);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Standard Membership', 'Sun-Tue HIIT Mon-Wed Spinning', 'Heart Disease', 'coupon', 90, to_date('24-02-2024', 'dd-mm-yyyy'), 328828217);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Standard Membership', 'Sun-Tue Zumba  Mon-Wed Cardio', 'Full Health', 'cash', 14, to_date('02-05-2024', 'dd-mm-yyyy'), 430953154);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue Body Sculpt Mon-Wed Zumba ', 'Heart Disease', 'cash', 42, to_date('13-03-2024', 'dd-mm-yyyy'), 150991526);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue Spinning Mon-Wed Cardio', 'Heart Disease', 'cash', 23, to_date('12-05-2024', 'dd-mm-yyyy'), 882528796);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Family Membership', 'Sun-Tue Cardio Mon-Wed ''HIIT', 'High Blood Pressure', 'cash', 35, to_date('19-01-2024', 'dd-mm-yyyy'), 281704629);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue Pilates Mon-Wed Pilates', 'Chronic Respiratory Conditions', 'cash', 33, to_date('02-02-2024', 'dd-mm-yyyy'), 37357831);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue Pilates Mon-Wed Pilates', 'Injuries', 'credit card', 55, to_date('01-03-2024', 'dd-mm-yyyy'), 17535897);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Family Membership', 'Sun-Tue HIIT Mon-Wed Pilates', 'Heart Disease', 'credit card', 47, to_date('23-05-2024', 'dd-mm-yyyy'), 537871085);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue Zumba  Mon-Wed Pilates', 'Heart Disease', 'credit card', 76, to_date('02-03-2024', 'dd-mm-yyyy'), 310135900);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Standard Membership', 'Sun-Tue HIIT Mon-Wed Spinning', 'Chronic Respiratory Conditions', 'cash', 92, to_date('25-03-2024', 'dd-mm-yyyy'), 585401273);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Basic Membership', 'Sun-Tue Lift-Tone Mon-Wed Pilates', 'Chronic Respiratory Conditions', 'credit card', 92, to_date('02-05-2024', 'dd-mm-yyyy'), 681776145);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Basic Membership', 'Sun-Tue HIIT Mon-Wed Spinning', 'Full Health', 'coupon', 16, to_date('04-04-2024', 'dd-mm-yyyy'), 482913375);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Basic Membership', 'Sun-Tue Lift-Tone Mon-Wed Zumba ', 'Heart Disease', 'coupon', 54, to_date('05-01-2024', 'dd-mm-yyyy'), 645260478);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue HIIT Mon-Wed Lift-Tone', 'Injuries', 'coupon', 55, to_date('19-03-2024', 'dd-mm-yyyy'), 853980163);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Family Membership', 'Sun-Tue Body Sculpt Mon-Wed ''HIIT', 'High Blood Pressure', 'cash', 63, to_date('26-02-2024', 'dd-mm-yyyy'), 383155495);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Family Membership', 'Sun-Tue Lift-Tone Mon-Wed Spinning', 'Chronic Respiratory Conditions', 'cash', 77, to_date('15-02-2024', 'dd-mm-yyyy'), 765824624);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue HIIT Mon-Wed ''HIIT', 'Chronic Respiratory Conditions', 'cash', 35, to_date('04-01-2024', 'dd-mm-yyyy'), 204342963);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Family Membership', 'Sun-Tue Body Sculpt Mon-Wed Lift-Tone', 'High Blood Pressure', 'coupon', 97, to_date('15-05-2024', 'dd-mm-yyyy'), 225440261);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Family Membership', 'Sun-Tue Pilates Mon-Wed Lift-Tone', 'Chronic Respiratory Conditions', 'coupon', 18, to_date('11-04-2024', 'dd-mm-yyyy'), 780381836);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Basic Membership', 'Sun-Tue HIIT Mon-Wed Pilates', 'High Blood Pressure', 'cash', 38, to_date('15-05-2024', 'dd-mm-yyyy'), 8496983);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Personal Training Membership', 'Sun-Tue Spinning Mon-Wed ''HIIT', 'Chronic Respiratory Conditions', 'cash', 23, to_date('29-04-2024', 'dd-mm-yyyy'), 392375337);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue Zumba  Mon-Wed ''HIIT', 'Chronic Respiratory Conditions', 'credit card', 87, to_date('16-04-2024', 'dd-mm-yyyy'), 325260082);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Family Membership', 'Sun-Tue Zumba  Mon-Wed Spinning', 'Heart Disease', 'coupon', 38, to_date('08-04-2024', 'dd-mm-yyyy'), 936296296);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Standard Membership', 'Sun-Tue Zumba  Mon-Wed Spinning', 'Injuries', 'credit card', 15, to_date('14-02-2024', 'dd-mm-yyyy'), 451950079);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Standard Membership', 'Sun-Tue Cardio Mon-Wed Spinning', 'Heart Disease', 'coupon', 19, to_date('24-03-2024', 'dd-mm-yyyy'), 948674690);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue Pilates Mon-Wed Pilates', 'Heart Disease', 'coupon', 90, to_date('19-05-2024', 'dd-mm-yyyy'), 76725560);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Family Membership', 'Sun-Tue Body Sculpt Mon-Wed Pilates', 'Heart Disease', 'cash', 72, to_date('09-01-2024', 'dd-mm-yyyy'), 624776728);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Basic Membership', 'Sun-Tue Zumba  Mon-Wed Spinning', 'Full Health', 'credit card', 79, to_date('04-01-2024', 'dd-mm-yyyy'), 752537794);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Basic Membership', 'Sun-Tue Zumba  Mon-Wed Lift-Tone', 'Chronic Respiratory Conditions', 'coupon', 59, to_date('18-05-2024', 'dd-mm-yyyy'), 270436980);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Personal Training Membership', 'Sun-Tue Pilates Mon-Wed Body Sculpt', 'Full Health', 'cash', 19, to_date('20-04-2024', 'dd-mm-yyyy'), 558102976);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Basic Membership', 'Sun-Tue Lift-Tone Mon-Wed Cardio', 'Full Health', 'cash', 34, to_date('12-05-2024', 'dd-mm-yyyy'), 413903985);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue Spinning Mon-Wed ''HIIT', 'Full Health', 'coupon', 91, to_date('24-03-2024', 'dd-mm-yyyy'), 639230686);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Personal Training Membership', 'Sun-Tue Body Sculpt Mon-Wed Zumba ', 'Heart Disease', 'credit card', 15, to_date('30-01-2024', 'dd-mm-yyyy'), 338258344);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Basic Membership', 'Sun-Tue Spinning Mon-Wed Lift-Tone', 'Heart Disease', 'cash', 87, to_date('11-01-2024', 'dd-mm-yyyy'), 224772173);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Basic Membership', 'Sun-Tue Cardio Mon-Wed Lift-Tone', 'Full Health', 'cash', 59, to_date('10-05-2024', 'dd-mm-yyyy'), 371437164);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Family Membership', 'Sun-Tue Body Sculpt Mon-Wed Spinning', 'High Blood Pressure', 'credit card', 26, to_date('21-03-2024', 'dd-mm-yyyy'), 449179265);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Basic Membership', 'Sun-Tue Zumba  Mon-Wed ''HIIT', 'Injuries', 'cash', 63, to_date('07-02-2024', 'dd-mm-yyyy'), 84279082);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Basic Membership', 'Sun-Tue Body Sculpt Mon-Wed ''HIIT', 'High Blood Pressure', 'coupon', 47, to_date('16-04-2024', 'dd-mm-yyyy'), 894465652);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Standard Membership', 'Sun-Tue HIIT Mon-Wed Body Sculpt', 'Heart Disease', 'cash', 16, to_date('02-03-2024', 'dd-mm-yyyy'), 314721452);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue Zumba  Mon-Wed Body Sculpt', 'Heart Disease', 'coupon', 58, to_date('24-02-2024', 'dd-mm-yyyy'), 115738810);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue Spinning Mon-Wed Body Sculpt', 'Injuries', 'credit card', 16, to_date('11-04-2024', 'dd-mm-yyyy'), 629006255);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue Spinning Mon-Wed ''HIIT', 'Chronic Respiratory Conditions', 'credit card', 73, to_date('08-05-2024', 'dd-mm-yyyy'), 418865652);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Standard Membership', 'Sun-Tue Lift-Tone Mon-Wed Body Sculpt', 'Chronic Respiratory Conditions', 'credit card', 45, to_date('22-04-2024', 'dd-mm-yyyy'), 707467033);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue Body Sculpt Mon-Wed Spinning', 'Heart Disease', 'credit card', 27, to_date('19-02-2024', 'dd-mm-yyyy'), 570953575);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Standard Membership', 'Sun-Tue Lift-Tone Mon-Wed Pilates', 'Heart Disease', 'credit card', 35, to_date('19-03-2024', 'dd-mm-yyyy'), 710690978);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue Spinning Mon-Wed Lift-Tone', 'Full Health', 'credit card', 83, to_date('25-04-2024', 'dd-mm-yyyy'), 301956654);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Family Membership', 'Sun-Tue Lift-Tone Mon-Wed Cardio', 'High Blood Pressure', 'coupon', 89, to_date('29-02-2024', 'dd-mm-yyyy'), 311230449);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Personal Training Membership', 'Sun-Tue Cardio Mon-Wed ''HIIT', 'Heart Disease', 'coupon', 43, to_date('22-03-2024', 'dd-mm-yyyy'), 91717809);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Family Membership', 'Sun-Tue Zumba  Mon-Wed Cardio', 'Injuries', 'coupon', 64, to_date('28-02-2024', 'dd-mm-yyyy'), 165021958);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue Pilates Mon-Wed Body Sculpt', 'Heart Disease', 'coupon', 23, to_date('16-05-2024', 'dd-mm-yyyy'), 398712524);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Personal Training Membership', 'Sun-Tue Lift-Tone Mon-Wed Zumba ', 'High Blood Pressure', 'credit card', 81, to_date('03-05-2024', 'dd-mm-yyyy'), 694288312);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Family Membership', 'Sun-Tue HIIT Mon-Wed Lift-Tone', 'Heart Disease', 'coupon', 53, to_date('03-03-2024', 'dd-mm-yyyy'), 417554829);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Basic Membership', 'Sun-Tue Lift-Tone Mon-Wed Cardio', 'Heart Disease', 'credit card', 23, to_date('21-02-2024', 'dd-mm-yyyy'), 157283500);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue Cardio Mon-Wed Cardio', 'Injuries', 'cash', 19, to_date('20-03-2024', 'dd-mm-yyyy'), 666931958);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue Body Sculpt Mon-Wed Spinning', 'Injuries', 'cash', 97, to_date('03-05-2024', 'dd-mm-yyyy'), 341491772);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Basic Membership', 'Sun-Tue HIIT Mon-Wed Zumba ', 'Heart Disease', 'cash', 30, to_date('12-04-2024', 'dd-mm-yyyy'), 976071851);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue Zumba  Mon-Wed Pilates', 'Heart Disease', 'cash', 47, to_date('25-05-2024', 'dd-mm-yyyy'), 741535265);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Family Membership', 'Sun-Tue Spinning Mon-Wed Pilates', 'Heart Disease', 'coupon', 87, to_date('10-05-2024', 'dd-mm-yyyy'), 399425803);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue Spinning Mon-Wed Lift-Tone', 'Chronic Respiratory Conditions', 'coupon', 32, to_date('14-03-2024', 'dd-mm-yyyy'), 358254239);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Standard Membership', 'Sun-Tue Spinning Mon-Wed ''HIIT', 'Heart Disease', 'credit card', 64, to_date('27-02-2024', 'dd-mm-yyyy'), 956293618);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Basic Membership', 'Sun-Tue Lift-Tone Mon-Wed Spinning', 'High Blood Pressure', 'cash', 15, to_date('17-02-2024', 'dd-mm-yyyy'), 835544906);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Basic Membership', 'Sun-Tue Cardio Mon-Wed Lift-Tone', 'Heart Disease', 'credit card', 57, to_date('01-05-2024', 'dd-mm-yyyy'), 988123159);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Personal Training Membership', 'Sun-Tue Zumba  Mon-Wed Pilates', 'Full Health', 'cash', 24, to_date('23-05-2024', 'dd-mm-yyyy'), 241535899);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Standard Membership', 'Sun-Tue Pilates Mon-Wed Spinning', 'Full Health', 'cash', 89, to_date('27-01-2024', 'dd-mm-yyyy'), 399915317);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Standard Membership', 'Sun-Tue Pilates Mon-Wed Body Sculpt', 'High Blood Pressure', 'cash', 17, to_date('26-02-2024', 'dd-mm-yyyy'), 546060620);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Personal Training Membership', 'Sun-Tue Cardio Mon-Wed Pilates', 'Heart Disease', 'credit card', 97, to_date('15-05-2024', 'dd-mm-yyyy'), 922954022);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Basic Membership', 'Sun-Tue Zumba  Mon-Wed ''HIIT', 'Full Health', 'cash', 33, to_date('13-05-2024', 'dd-mm-yyyy'), 988561837);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Personal Training Membership', 'Sun-Tue Spinning Mon-Wed Body Sculpt', 'Full Health', 'coupon', 98, to_date('17-03-2024', 'dd-mm-yyyy'), 946460524);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Personal Training Membership', 'Sun-Tue Body Sculpt Mon-Wed Spinning', 'High Blood Pressure', 'credit card', 15, to_date('19-03-2024', 'dd-mm-yyyy'), 889114374);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Basic Membership', 'Sun-Tue Spinning Mon-Wed Spinning', 'Heart Disease', 'cash', 24, to_date('04-05-2024', 'dd-mm-yyyy'), 764516309);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Personal Training Membership', 'Sun-Tue HIIT Mon-Wed Spinning', 'Heart Disease', 'credit card', 98, to_date('10-02-2024', 'dd-mm-yyyy'), 201957512);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue Cardio Mon-Wed Spinning', 'Chronic Respiratory Conditions', 'coupon', 35, to_date('18-02-2024', 'dd-mm-yyyy'), 725658881);
commit;
prompt 100 records committed...
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Personal Training Membership', 'Sun-Tue HIIT Mon-Wed Lift-Tone', 'High Blood Pressure', 'coupon', 44, to_date('21-02-2024', 'dd-mm-yyyy'), 611561804);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Basic Membership', 'Sun-Tue Lift-Tone Mon-Wed Spinning', 'Injuries', 'cash', 73, to_date('02-05-2024', 'dd-mm-yyyy'), 435490677);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Basic Membership', 'Sun-Tue HIIT Mon-Wed Zumba ', 'Chronic Respiratory Conditions', 'cash', 99, to_date('17-04-2024', 'dd-mm-yyyy'), 182203875);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Standard Membership', 'Sun-Tue HIIT Mon-Wed Lift-Tone', 'Full Health', 'credit card', 14, to_date('07-04-2024', 'dd-mm-yyyy'), 469692372);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Basic Membership', 'Sun-Tue Body Sculpt Mon-Wed Pilates', 'Full Health', 'coupon', 96, to_date('22-01-2024', 'dd-mm-yyyy'), 804626341);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Standard Membership', 'Sun-Tue Lift-Tone Mon-Wed Lift-Tone', 'Heart Disease', 'credit card', 71, to_date('05-04-2024', 'dd-mm-yyyy'), 599267960);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Personal Training Membership', 'Sun-Tue Lift-Tone Mon-Wed Lift-Tone', 'High Blood Pressure', 'credit card', 19, to_date('23-03-2024', 'dd-mm-yyyy'), 239567444);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Standard Membership', 'Sun-Tue Cardio Mon-Wed Zumba ', 'High Blood Pressure', 'credit card', 19, to_date('03-05-2024', 'dd-mm-yyyy'), 779786218);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Family Membership', 'Sun-Tue Cardio Mon-Wed ''HIIT', 'Chronic Respiratory Conditions', 'cash', 73, to_date('03-02-2024', 'dd-mm-yyyy'), 88434151);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Basic Membership', 'Sun-Tue Body Sculpt Mon-Wed Pilates', 'Full Health', 'credit card', 43, to_date('25-03-2024', 'dd-mm-yyyy'), 651173695);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue Zumba  Mon-Wed Spinning', 'High Blood Pressure', 'cash', 26, to_date('14-02-2024', 'dd-mm-yyyy'), 248130758);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue Pilates Mon-Wed Body Sculpt', 'Chronic Respiratory Conditions', 'coupon', 26, to_date('10-01-2024', 'dd-mm-yyyy'), 552880750);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Personal Training Membership', 'Sun-Tue Cardio Mon-Wed Pilates', 'Full Health', 'credit card', 93, to_date('03-01-2024', 'dd-mm-yyyy'), 628287659);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Standard Membership', 'Sun-Tue Spinning Mon-Wed Body Sculpt', 'Heart Disease', 'cash', 39, to_date('31-03-2024', 'dd-mm-yyyy'), 509609652);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Standard Membership', 'Sun-Tue Lift-Tone Mon-Wed Zumba ', 'High Blood Pressure', 'coupon', 17, to_date('07-03-2024', 'dd-mm-yyyy'), 526289796);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue Lift-Tone Mon-Wed Body Sculpt', 'Heart Disease', 'cash', 79, to_date('08-05-2024', 'dd-mm-yyyy'), 188553765);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Family Membership', 'Sun-Tue Body Sculpt Mon-Wed Body Sculpt', 'Full Health', 'cash', 42, to_date('24-03-2024', 'dd-mm-yyyy'), 631209336);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Basic Membership', 'Sun-Tue Cardio Mon-Wed Pilates', 'Chronic Respiratory Conditions', 'credit card', 29, to_date('28-02-2024', 'dd-mm-yyyy'), 735242053);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Family Membership', 'Sun-Tue Pilates Mon-Wed Pilates', 'Injuries', 'cash', 86, to_date('04-03-2024', 'dd-mm-yyyy'), 43126911);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Family Membership', 'Sun-Tue Spinning Mon-Wed ''HIIT', 'Heart Disease', 'cash', 77, to_date('03-03-2024', 'dd-mm-yyyy'), 486610639);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Standard Membership', 'Sun-Tue Zumba  Mon-Wed Lift-Tone', 'High Blood Pressure', 'credit card', 20, to_date('10-02-2024', 'dd-mm-yyyy'), 621394627);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Family Membership', 'Sun-Tue Spinning Mon-Wed Cardio', 'High Blood Pressure', 'cash', 34, to_date('27-03-2024', 'dd-mm-yyyy'), 375971023);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue Lift-Tone Mon-Wed Lift-Tone', 'Injuries', 'credit card', 31, to_date('04-03-2024', 'dd-mm-yyyy'), 376660032);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue HIIT Mon-Wed ''HIIT', 'Chronic Respiratory Conditions', 'coupon', 78, to_date('19-01-2024', 'dd-mm-yyyy'), 910834121);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue Spinning Mon-Wed Pilates', 'Injuries', 'credit card', 16, to_date('21-03-2024', 'dd-mm-yyyy'), 773097313);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Personal Training Membership', 'Sun-Tue Spinning Mon-Wed Pilates', 'Heart Disease', 'cash', 37, to_date('09-03-2024', 'dd-mm-yyyy'), 60530810);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Basic Membership', 'Sun-Tue Pilates Mon-Wed ''HIIT', 'Full Health', 'cash', 78, to_date('21-01-2024', 'dd-mm-yyyy'), 982111666);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue Lift-Tone Mon-Wed Zumba ', 'Injuries', 'credit card', 73, to_date('11-03-2024', 'dd-mm-yyyy'), 325851770);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Family Membership', 'Sun-Tue Pilates Mon-Wed ''HIIT', 'Injuries', 'coupon', 78, to_date('20-05-2024', 'dd-mm-yyyy'), 861976871);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue HIIT Mon-Wed Spinning', 'Chronic Respiratory Conditions', 'coupon', 42, to_date('28-01-2024', 'dd-mm-yyyy'), 89807477);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Family Membership', 'Sun-Tue Cardio Mon-Wed Cardio', 'Heart Disease', 'cash', 98, to_date('23-01-2024', 'dd-mm-yyyy'), 25576901);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Personal Training Membership', 'Sun-Tue Zumba  Mon-Wed Pilates', 'Heart Disease', 'credit card', 83, to_date('01-01-2024', 'dd-mm-yyyy'), 521005306);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Basic Membership', 'Sun-Tue Cardio Mon-Wed Spinning', 'Chronic Respiratory Conditions', 'credit card', 16, to_date('04-03-2024', 'dd-mm-yyyy'), 806377008);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Standard Membership', 'Sun-Tue Pilates Mon-Wed Zumba ', 'Full Health', 'credit card', 87, to_date('17-02-2024', 'dd-mm-yyyy'), 448376914);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Family Membership', 'Sun-Tue Body Sculpt Mon-Wed Body Sculpt', 'Heart Disease', 'cash', 69, to_date('21-04-2024', 'dd-mm-yyyy'), 429548529);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Basic Membership', 'Sun-Tue Spinning Mon-Wed Spinning', 'High Blood Pressure', 'cash', 44, to_date('01-01-2024', 'dd-mm-yyyy'), 66242318);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Standard Membership', 'Sun-Tue Body Sculpt Mon-Wed Spinning', 'Full Health', 'coupon', 50, to_date('27-04-2024', 'dd-mm-yyyy'), 644624124);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Personal Training Membership', 'Sun-Tue Zumba  Mon-Wed Zumba ', 'Full Health', 'coupon', 41, to_date('15-01-2024', 'dd-mm-yyyy'), 121399588);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Basic Membership', 'Sun-Tue HIIT Mon-Wed Zumba ', 'Full Health', 'credit card', 54, to_date('13-03-2024', 'dd-mm-yyyy'), 100888066);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Personal Training Membership', 'Sun-Tue Zumba  Mon-Wed Body Sculpt', 'Chronic Respiratory Conditions', 'coupon', 86, to_date('16-05-2024', 'dd-mm-yyyy'), 136943451);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue Pilates Mon-Wed Cardio', 'Full Health', 'credit card', 19, to_date('08-01-2024', 'dd-mm-yyyy'), 425818193);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue Lift-Tone Mon-Wed Zumba ', 'High Blood Pressure', 'credit card', 89, to_date('18-04-2024', 'dd-mm-yyyy'), 938379550);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Basic Membership', 'Sun-Tue Pilates Mon-Wed Zumba ', 'Full Health', 'credit card', 66, to_date('04-04-2024', 'dd-mm-yyyy'), 143450646);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Personal Training Membership', 'Sun-Tue HIIT Mon-Wed Spinning', 'Chronic Respiratory Conditions', 'credit card', 56, to_date('20-03-2024', 'dd-mm-yyyy'), 769271035);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Personal Training Membership', 'Sun-Tue Zumba  Mon-Wed Cardio', 'High Blood Pressure', 'coupon', 16, to_date('10-03-2024', 'dd-mm-yyyy'), 695131325);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Family Membership', 'Sun-Tue Zumba  Mon-Wed Cardio', 'Full Health', 'credit card', 93, to_date('15-01-2024', 'dd-mm-yyyy'), 186971826);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Basic Membership', 'Sun-Tue Pilates Mon-Wed ''HIIT', 'Chronic Respiratory Conditions', 'credit card', 31, to_date('07-04-2024', 'dd-mm-yyyy'), 348139398);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Basic Membership', 'Sun-Tue Body Sculpt Mon-Wed Pilates', 'Injuries', 'coupon', 18, to_date('29-03-2024', 'dd-mm-yyyy'), 404616118);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Family Membership', 'Sun-Tue Zumba  Mon-Wed Zumba ', 'Injuries', 'coupon', 19, to_date('31-01-2024', 'dd-mm-yyyy'), 680741899);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue Cardio Mon-Wed ''HIIT', 'Full Health', 'credit card', 67, to_date('07-03-2024', 'dd-mm-yyyy'), 750005809);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Standard Membership', 'Sun-Tue Spinning Mon-Wed Lift-Tone', 'Injuries', 'credit card', 75, to_date('28-04-2024', 'dd-mm-yyyy'), 513708263);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Personal Training Membership', 'Sun-Tue Lift-Tone Mon-Wed ''HIIT', 'Heart Disease', 'credit card', 60, to_date('13-04-2024', 'dd-mm-yyyy'), 37515876);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Basic Membership', 'Sun-Tue Cardio Mon-Wed Cardio', 'Chronic Respiratory Conditions', 'coupon', 35, to_date('06-04-2024', 'dd-mm-yyyy'), 15823020);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Family Membership', 'Sun-Tue Pilates Mon-Wed Spinning', 'Full Health', 'credit card', 99, to_date('11-04-2024', 'dd-mm-yyyy'), 428693989);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Personal Training Membership', 'Sun-Tue Body Sculpt Mon-Wed Pilates', 'Injuries', 'coupon', 73, to_date('06-03-2024', 'dd-mm-yyyy'), 367002722);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Personal Training Membership', 'Sun-Tue Body Sculpt Mon-Wed Spinning', 'Injuries', 'coupon', 34, to_date('04-03-2024', 'dd-mm-yyyy'), 706388337);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Basic Membership', 'Sun-Tue Cardio Mon-Wed Zumba ', 'High Blood Pressure', 'cash', 66, to_date('21-03-2024', 'dd-mm-yyyy'), 387031674);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Personal Training Membership', 'Sun-Tue Cardio Mon-Wed Lift-Tone', 'Full Health', 'credit card', 25, to_date('15-01-2024', 'dd-mm-yyyy'), 88847666);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Basic Membership', 'Sun-Tue Cardio Mon-Wed Pilates', 'High Blood Pressure', 'credit card', 64, to_date('06-04-2024', 'dd-mm-yyyy'), 119249472);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Personal Training Membership', 'Sun-Tue Body Sculpt Mon-Wed Cardio', 'Full Health', 'cash', 67, to_date('20-01-2024', 'dd-mm-yyyy'), 974885124);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Family Membership', 'Sun-Tue HIIT Mon-Wed Spinning', 'Heart Disease', 'credit card', 50, to_date('19-04-2024', 'dd-mm-yyyy'), 568933983);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Basic Membership', 'Sun-Tue Lift-Tone Mon-Wed Body Sculpt', 'Chronic Respiratory Conditions', 'coupon', 48, to_date('18-02-2024', 'dd-mm-yyyy'), 807894763);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Basic Membership', 'Sun-Tue Spinning Mon-Wed Body Sculpt', 'Chronic Respiratory Conditions', 'credit card', 81, to_date('17-03-2024', 'dd-mm-yyyy'), 735014216);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Personal Training Membership', 'Sun-Tue HIIT Mon-Wed Body Sculpt', 'Injuries', 'coupon', 40, to_date('12-05-2024', 'dd-mm-yyyy'), 652621999);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Standard Membership', 'Sun-Tue HIIT Mon-Wed Zumba ', 'Full Health', 'credit card', 84, to_date('01-01-2024', 'dd-mm-yyyy'), 804361204);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Personal Training Membership', 'Sun-Tue Spinning Mon-Wed ''HIIT', 'Injuries', 'credit card', 15, to_date('13-02-2024', 'dd-mm-yyyy'), 442799071);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Basic Membership', 'Sun-Tue Pilates Mon-Wed Body Sculpt', 'Chronic Respiratory Conditions', 'cash', 93, to_date('12-01-2024', 'dd-mm-yyyy'), 998544947);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue HIIT Mon-Wed Spinning', 'High Blood Pressure', 'coupon', 50, to_date('13-02-2024', 'dd-mm-yyyy'), 872264579);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue Lift-Tone Mon-Wed Pilates', 'Heart Disease', 'cash', 26, to_date('18-05-2024', 'dd-mm-yyyy'), 64054988);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue Spinning Mon-Wed Pilates', 'High Blood Pressure', 'coupon', 92, to_date('03-05-2024', 'dd-mm-yyyy'), 817112047);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue Spinning Mon-Wed Pilates', 'Injuries', 'coupon', 91, to_date('07-04-2024', 'dd-mm-yyyy'), 287056883);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Family Membership', 'Sun-Tue Spinning Mon-Wed Pilates', 'Chronic Respiratory Conditions', 'coupon', 98, to_date('06-01-2024', 'dd-mm-yyyy'), 273730719);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue Pilates Mon-Wed Zumba ', 'High Blood Pressure', 'cash', 56, to_date('11-05-2024', 'dd-mm-yyyy'), 22608321);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue HIIT Mon-Wed Zumba ', 'Heart Disease', 'credit card', 94, to_date('11-01-2024', 'dd-mm-yyyy'), 876054889);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Family Membership', 'Sun-Tue HIIT Mon-Wed Pilates', 'Injuries', 'coupon', 80, to_date('19-04-2024', 'dd-mm-yyyy'), 464739079);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Personal Training Membership', 'Sun-Tue Zumba  Mon-Wed Lift-Tone', 'Injuries', 'credit card', 22, to_date('14-05-2024', 'dd-mm-yyyy'), 579480884);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Personal Training Membership', 'Sun-Tue HIIT Mon-Wed Spinning', 'High Blood Pressure', 'coupon', 99, to_date('03-05-2024', 'dd-mm-yyyy'), 441545484);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Basic Membership', 'Sun-Tue HIIT Mon-Wed Spinning', 'Chronic Respiratory Conditions', 'cash', 17, to_date('25-03-2024', 'dd-mm-yyyy'), 130849103);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue Zumba  Mon-Wed Cardio', 'Heart Disease', 'coupon', 14, to_date('14-02-2024', 'dd-mm-yyyy'), 453388492);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Basic Membership', 'Sun-Tue Spinning Mon-Wed Zumba ', 'Injuries', 'credit card', 69, to_date('04-02-2024', 'dd-mm-yyyy'), 883305631);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Family Membership', 'Sun-Tue Cardio Mon-Wed Zumba ', 'Injuries', 'cash', 32, to_date('08-02-2024', 'dd-mm-yyyy'), 926205546);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Personal Training Membership', 'Sun-Tue HIIT Mon-Wed Spinning', 'Chronic Respiratory Conditions', 'coupon', 48, to_date('30-01-2024', 'dd-mm-yyyy'), 728518006);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Basic Membership', 'Sun-Tue Cardio Mon-Wed Body Sculpt', 'Heart Disease', 'cash', 73, to_date('12-02-2024', 'dd-mm-yyyy'), 583024739);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue Zumba  Mon-Wed Zumba ', 'Injuries', 'cash', 31, to_date('19-02-2024', 'dd-mm-yyyy'), 464542668);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Personal Training Membership', 'Sun-Tue Zumba  Mon-Wed Cardio', 'High Blood Pressure', 'coupon', 65, to_date('27-03-2024', 'dd-mm-yyyy'), 685290986);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Family Membership', 'Sun-Tue Pilates Mon-Wed Pilates', 'Heart Disease', 'credit card', 58, to_date('09-02-2024', 'dd-mm-yyyy'), 321751750);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Personal Training Membership', 'Sun-Tue Pilates Mon-Wed Pilates', 'Injuries', 'coupon', 31, to_date('28-03-2024', 'dd-mm-yyyy'), 658003623);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue Spinning Mon-Wed Spinning', 'Full Health', 'coupon', 53, to_date('30-01-2024', 'dd-mm-yyyy'), 997116426);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Standard Membership', 'Sun-Tue Lift-Tone Mon-Wed Cardio', 'High Blood Pressure', 'cash', 41, to_date('14-03-2024', 'dd-mm-yyyy'), 359987794);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Personal Training Membership', 'Sun-Tue Cardio Mon-Wed Cardio', 'Heart Disease', 'credit card', 97, to_date('07-01-2024', 'dd-mm-yyyy'), 310393073);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Standard Membership', 'Sun-Tue Spinning Mon-Wed ''HIIT', 'Injuries', 'credit card', 69, to_date('07-03-2024', 'dd-mm-yyyy'), 123980403);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Basic Membership', 'Sun-Tue Zumba  Mon-Wed Lift-Tone', 'Chronic Respiratory Conditions', 'coupon', 50, to_date('26-03-2024', 'dd-mm-yyyy'), 166730141);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Basic Membership', 'Sun-Tue Zumba  Mon-Wed ''HIIT', 'Injuries', 'coupon', 85, to_date('14-04-2024', 'dd-mm-yyyy'), 833152003);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue Pilates Mon-Wed Pilates', 'Heart Disease', 'coupon', 74, to_date('29-02-2024', 'dd-mm-yyyy'), 286359632);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Basic Membership', 'Sun-Tue HIIT Mon-Wed Lift-Tone', 'Full Health', 'coupon', 75, to_date('06-03-2024', 'dd-mm-yyyy'), 624373181);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Standard Membership', 'Sun-Tue HIIT Mon-Wed Spinning', 'Heart Disease', 'credit card', 98, to_date('20-04-2024', 'dd-mm-yyyy'), 855737641);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Family Membership', 'Sun-Tue Zumba  Mon-Wed Body Sculpt', 'Heart Disease', 'credit card', 74, to_date('10-05-2024', 'dd-mm-yyyy'), 294207967);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Basic Membership', 'Sun-Tue Pilates Mon-Wed Zumba ', 'Full Health', 'credit card', 82, to_date('29-04-2024', 'dd-mm-yyyy'), 415525906);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Basic Membership', 'Sun-Tue Lift-Tone Mon-Wed Pilates', 'High Blood Pressure', 'coupon', 17, to_date('22-05-2024', 'dd-mm-yyyy'), 128838848);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Personal Training Membership', 'Sun-Tue Lift-Tone Mon-Wed Lift-Tone', 'Heart Disease', 'cash', 31, to_date('11-02-2024', 'dd-mm-yyyy'), 510896901);
commit;
prompt 200 records committed...
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Personal Training Membership', 'Sun-Tue Body Sculpt Mon-Wed Cardio', 'Chronic Respiratory Conditions', 'cash', 63, to_date('31-01-2024', 'dd-mm-yyyy'), 739730077);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue HIIT Mon-Wed Pilates', 'Chronic Respiratory Conditions', 'credit card', 60, to_date('07-01-2024', 'dd-mm-yyyy'), 946654322);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Basic Membership', 'Sun-Tue Pilates Mon-Wed Lift-Tone', 'Injuries', 'coupon', 81, to_date('06-01-2024', 'dd-mm-yyyy'), 541088236);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue Spinning Mon-Wed Zumba ', 'Chronic Respiratory Conditions', 'coupon', 40, to_date('13-05-2024', 'dd-mm-yyyy'), 109184345);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Standard Membership', 'Sun-Tue Spinning Mon-Wed Cardio', 'Heart Disease', 'credit card', 58, to_date('13-03-2024', 'dd-mm-yyyy'), 384007856);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue Zumba  Mon-Wed Body Sculpt', 'High Blood Pressure', 'credit card', 39, to_date('24-01-2024', 'dd-mm-yyyy'), 450378456);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Standard Membership', 'Sun-Tue Zumba  Mon-Wed Zumba ', 'Heart Disease', 'credit card', 64, to_date('17-02-2024', 'dd-mm-yyyy'), 132924806);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Standard Membership', 'Sun-Tue Spinning Mon-Wed Zumba ', 'Heart Disease', 'cash', 44, to_date('15-01-2024', 'dd-mm-yyyy'), 410879352);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Family Membership', 'Sun-Tue Body Sculpt Mon-Wed Pilates', 'Heart Disease', 'coupon', 52, to_date('18-01-2024', 'dd-mm-yyyy'), 776488744);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Premium Membership', 'Sun-Tue HIIT Mon-Wed ''HIIT', 'Chronic Respiratory Conditions', 'cash', 90, to_date('27-01-2024', 'dd-mm-yyyy'), 193732741);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Basic Membership', 'Sun-Tue Spinning Mon-Wed Body Sculpt', 'Full Health', 'cash', 66, to_date('18-01-2024', 'dd-mm-yyyy'), 298510709);
insert into TRAINEE (subscription, training_plan, health, payment_details, age, joining_date, person_id)
values ('Family Membership', 'Sun-Tue Pilates Mon-Wed ''HIIT', 'Injuries', 'coupon', 51, to_date('11-01-2024', 'dd-mm-yyyy'), 568076166);
commit;
prompt 212 records loaded
prompt Loading TAKES...
insert into TAKES (person_id, class_number)
values (8496983, 39);
insert into TAKES (person_id, class_number)
values (8496983, 129);
insert into TAKES (person_id, class_number)
values (8496983, 143);
insert into TAKES (person_id, class_number)
values (8496983, 144);
insert into TAKES (person_id, class_number)
values (8496983, 148);
insert into TAKES (person_id, class_number)
values (9419613, 12);
insert into TAKES (person_id, class_number)
values (9419613, 42);
insert into TAKES (person_id, class_number)
values (15823020, 81);
insert into TAKES (person_id, class_number)
values (15823020, 184);
insert into TAKES (person_id, class_number)
values (16269226, 121);
insert into TAKES (person_id, class_number)
values (16269226, 122);
insert into TAKES (person_id, class_number)
values (16269226, 124);
insert into TAKES (person_id, class_number)
values (16269226, 131);
insert into TAKES (person_id, class_number)
values (16269226, 138);
insert into TAKES (person_id, class_number)
values (16269226, 174);
insert into TAKES (person_id, class_number)
values (16269226, 189);
insert into TAKES (person_id, class_number)
values (17535897, 27);
insert into TAKES (person_id, class_number)
values (17535897, 112);
insert into TAKES (person_id, class_number)
values (17535897, 187);
insert into TAKES (person_id, class_number)
values (17535897, 190);
insert into TAKES (person_id, class_number)
values (22608321, 172);
insert into TAKES (person_id, class_number)
values (25576901, 59);
insert into TAKES (person_id, class_number)
values (25576901, 87);
insert into TAKES (person_id, class_number)
values (25576901, 176);
insert into TAKES (person_id, class_number)
values (37515876, 44);
insert into TAKES (person_id, class_number)
values (37515876, 143);
insert into TAKES (person_id, class_number)
values (43126911, 80);
insert into TAKES (person_id, class_number)
values (48591713, 51);
insert into TAKES (person_id, class_number)
values (60530810, 93);
insert into TAKES (person_id, class_number)
values (60530810, 114);
insert into TAKES (person_id, class_number)
values (64054988, 113);
insert into TAKES (person_id, class_number)
values (64054988, 118);
insert into TAKES (person_id, class_number)
values (64054988, 126);
insert into TAKES (person_id, class_number)
values (64054988, 147);
insert into TAKES (person_id, class_number)
values (64054988, 156);
insert into TAKES (person_id, class_number)
values (84279082, 12);
insert into TAKES (person_id, class_number)
values (84279082, 40);
insert into TAKES (person_id, class_number)
values (84279082, 133);
insert into TAKES (person_id, class_number)
values (88434151, 16);
insert into TAKES (person_id, class_number)
values (88434151, 35);
insert into TAKES (person_id, class_number)
values (88434151, 129);
insert into TAKES (person_id, class_number)
values (88847666, 117);
insert into TAKES (person_id, class_number)
values (88847666, 142);
insert into TAKES (person_id, class_number)
values (89807477, 16);
insert into TAKES (person_id, class_number)
values (89807477, 73);
insert into TAKES (person_id, class_number)
values (89807477, 81);
insert into TAKES (person_id, class_number)
values (89807477, 149);
insert into TAKES (person_id, class_number)
values (89807477, 156);
insert into TAKES (person_id, class_number)
values (89807477, 182);
insert into TAKES (person_id, class_number)
values (91717809, 9);
insert into TAKES (person_id, class_number)
values (100888066, 47);
insert into TAKES (person_id, class_number)
values (100888066, 122);
insert into TAKES (person_id, class_number)
values (109184345, 35);
insert into TAKES (person_id, class_number)
values (109184345, 131);
insert into TAKES (person_id, class_number)
values (109184345, 155);
insert into TAKES (person_id, class_number)
values (109184345, 160);
insert into TAKES (person_id, class_number)
values (115738810, 108);
insert into TAKES (person_id, class_number)
values (115738810, 151);
insert into TAKES (person_id, class_number)
values (115738810, 184);
insert into TAKES (person_id, class_number)
values (121399588, 73);
insert into TAKES (person_id, class_number)
values (121399588, 80);
insert into TAKES (person_id, class_number)
values (121399588, 100);
insert into TAKES (person_id, class_number)
values (121399588, 120);
insert into TAKES (person_id, class_number)
values (121399588, 191);
insert into TAKES (person_id, class_number)
values (123980403, 142);
insert into TAKES (person_id, class_number)
values (123980403, 180);
insert into TAKES (person_id, class_number)
values (128838848, 1);
insert into TAKES (person_id, class_number)
values (128838848, 27);
insert into TAKES (person_id, class_number)
values (128838848, 40);
insert into TAKES (person_id, class_number)
values (128838848, 189);
insert into TAKES (person_id, class_number)
values (130849103, 20);
insert into TAKES (person_id, class_number)
values (130849103, 22);
insert into TAKES (person_id, class_number)
values (130849103, 147);
insert into TAKES (person_id, class_number)
values (130849103, 179);
insert into TAKES (person_id, class_number)
values (132924806, 22);
insert into TAKES (person_id, class_number)
values (132924806, 51);
insert into TAKES (person_id, class_number)
values (143450646, 16);
insert into TAKES (person_id, class_number)
values (143450646, 34);
insert into TAKES (person_id, class_number)
values (143450646, 147);
insert into TAKES (person_id, class_number)
values (143450646, 177);
insert into TAKES (person_id, class_number)
values (150991526, 149);
insert into TAKES (person_id, class_number)
values (157283500, 23);
insert into TAKES (person_id, class_number)
values (157283500, 138);
insert into TAKES (person_id, class_number)
values (157283500, 151);
insert into TAKES (person_id, class_number)
values (165021958, 135);
insert into TAKES (person_id, class_number)
values (182203875, 34);
insert into TAKES (person_id, class_number)
values (182203875, 147);
insert into TAKES (person_id, class_number)
values (182203875, 171);
insert into TAKES (person_id, class_number)
values (182203875, 173);
insert into TAKES (person_id, class_number)
values (182203875, 177);
insert into TAKES (person_id, class_number)
values (186971826, 80);
insert into TAKES (person_id, class_number)
values (188553765, 161);
insert into TAKES (person_id, class_number)
values (188553765, 169);
insert into TAKES (person_id, class_number)
values (188553765, 181);
insert into TAKES (person_id, class_number)
values (193732741, 22);
insert into TAKES (person_id, class_number)
values (193732741, 46);
insert into TAKES (person_id, class_number)
values (193732741, 74);
insert into TAKES (person_id, class_number)
values (193732741, 121);
insert into TAKES (person_id, class_number)
values (193732741, 125);
insert into TAKES (person_id, class_number)
values (193732741, 150);
commit;
prompt 100 records committed...
insert into TAKES (person_id, class_number)
values (204342963, 67);
insert into TAKES (person_id, class_number)
values (204342963, 191);
insert into TAKES (person_id, class_number)
values (224772173, 58);
insert into TAKES (person_id, class_number)
values (225440261, 39);
insert into TAKES (person_id, class_number)
values (225440261, 73);
insert into TAKES (person_id, class_number)
values (225440261, 93);
insert into TAKES (person_id, class_number)
values (225440261, 132);
insert into TAKES (person_id, class_number)
values (225440261, 178);
insert into TAKES (person_id, class_number)
values (225440261, 189);
insert into TAKES (person_id, class_number)
values (230610385, 49);
insert into TAKES (person_id, class_number)
values (239567444, 1);
insert into TAKES (person_id, class_number)
values (239567444, 9);
insert into TAKES (person_id, class_number)
values (239567444, 147);
insert into TAKES (person_id, class_number)
values (239567444, 171);
insert into TAKES (person_id, class_number)
values (241535899, 116);
insert into TAKES (person_id, class_number)
values (241535899, 126);
insert into TAKES (person_id, class_number)
values (241535899, 127);
insert into TAKES (person_id, class_number)
values (246437667, 157);
insert into TAKES (person_id, class_number)
values (248130758, 152);
insert into TAKES (person_id, class_number)
values (248130758, 155);
insert into TAKES (person_id, class_number)
values (248130758, 164);
insert into TAKES (person_id, class_number)
values (270436980, 94);
insert into TAKES (person_id, class_number)
values (273730719, 16);
insert into TAKES (person_id, class_number)
values (273730719, 148);
insert into TAKES (person_id, class_number)
values (281704629, 154);
insert into TAKES (person_id, class_number)
values (286359632, 25);
insert into TAKES (person_id, class_number)
values (286359632, 115);
insert into TAKES (person_id, class_number)
values (287056883, 2);
insert into TAKES (person_id, class_number)
values (287056883, 9);
insert into TAKES (person_id, class_number)
values (287056883, 137);
insert into TAKES (person_id, class_number)
values (294207967, 125);
insert into TAKES (person_id, class_number)
values (298510709, 141);
insert into TAKES (person_id, class_number)
values (301956654, 144);
insert into TAKES (person_id, class_number)
values (301956654, 168);
insert into TAKES (person_id, class_number)
values (310135900, 114);
insert into TAKES (person_id, class_number)
values (310135900, 145);
insert into TAKES (person_id, class_number)
values (310135900, 179);
insert into TAKES (person_id, class_number)
values (310393073, 16);
insert into TAKES (person_id, class_number)
values (310393073, 136);
insert into TAKES (person_id, class_number)
values (311230449, 27);
insert into TAKES (person_id, class_number)
values (311230449, 128);
insert into TAKES (person_id, class_number)
values (311230449, 161);
insert into TAKES (person_id, class_number)
values (311230449, 175);
insert into TAKES (person_id, class_number)
values (314721452, 107);
insert into TAKES (person_id, class_number)
values (314721452, 112);
insert into TAKES (person_id, class_number)
values (314721452, 156);
insert into TAKES (person_id, class_number)
values (321751750, 129);
insert into TAKES (person_id, class_number)
values (321751750, 181);
insert into TAKES (person_id, class_number)
values (325260082, 136);
insert into TAKES (person_id, class_number)
values (325260082, 168);
insert into TAKES (person_id, class_number)
values (325851770, 33);
insert into TAKES (person_id, class_number)
values (325851770, 88);
insert into TAKES (person_id, class_number)
values (328828217, 181);
insert into TAKES (person_id, class_number)
values (332700112, 81);
insert into TAKES (person_id, class_number)
values (332700112, 156);
insert into TAKES (person_id, class_number)
values (336899848, 23);
insert into TAKES (person_id, class_number)
values (338258344, 46);
insert into TAKES (person_id, class_number)
values (338258344, 175);
insert into TAKES (person_id, class_number)
values (348139398, 93);
insert into TAKES (person_id, class_number)
values (348139398, 144);
insert into TAKES (person_id, class_number)
values (348139398, 150);
insert into TAKES (person_id, class_number)
values (351195569, 156);
insert into TAKES (person_id, class_number)
values (351195569, 180);
insert into TAKES (person_id, class_number)
values (358254239, 66);
insert into TAKES (person_id, class_number)
values (359987794, 144);
insert into TAKES (person_id, class_number)
values (367002722, 107);
insert into TAKES (person_id, class_number)
values (367002722, 140);
insert into TAKES (person_id, class_number)
values (367002722, 161);
insert into TAKES (person_id, class_number)
values (371437164, 74);
insert into TAKES (person_id, class_number)
values (371437164, 100);
insert into TAKES (person_id, class_number)
values (371437164, 158);
insert into TAKES (person_id, class_number)
values (371437164, 159);
insert into TAKES (person_id, class_number)
values (375971023, 49);
insert into TAKES (person_id, class_number)
values (383155495, 9);
insert into TAKES (person_id, class_number)
values (383155495, 23);
insert into TAKES (person_id, class_number)
values (383155495, 117);
insert into TAKES (person_id, class_number)
values (383155495, 131);
insert into TAKES (person_id, class_number)
values (383155495, 136);
insert into TAKES (person_id, class_number)
values (384007856, 163);
insert into TAKES (person_id, class_number)
values (387031674, 178);
insert into TAKES (person_id, class_number)
values (399425803, 157);
insert into TAKES (person_id, class_number)
values (399915317, 22);
insert into TAKES (person_id, class_number)
values (399915317, 146);
insert into TAKES (person_id, class_number)
values (404616118, 167);
insert into TAKES (person_id, class_number)
values (410879352, 3);
insert into TAKES (person_id, class_number)
values (410879352, 42);
insert into TAKES (person_id, class_number)
values (410879352, 93);
insert into TAKES (person_id, class_number)
values (410879352, 116);
insert into TAKES (person_id, class_number)
values (410879352, 140);
insert into TAKES (person_id, class_number)
values (413903985, 117);
insert into TAKES (person_id, class_number)
values (413903985, 130);
insert into TAKES (person_id, class_number)
values (413903985, 156);
insert into TAKES (person_id, class_number)
values (413903985, 173);
insert into TAKES (person_id, class_number)
values (415525906, 49);
insert into TAKES (person_id, class_number)
values (415525906, 81);
insert into TAKES (person_id, class_number)
values (415525906, 113);
insert into TAKES (person_id, class_number)
values (415525906, 125);
insert into TAKES (person_id, class_number)
values (417554829, 125);
insert into TAKES (person_id, class_number)
values (417554829, 137);
insert into TAKES (person_id, class_number)
values (418865652, 190);
commit;
prompt 200 records committed...
insert into TAKES (person_id, class_number)
values (425818193, 27);
insert into TAKES (person_id, class_number)
values (425818193, 35);
insert into TAKES (person_id, class_number)
values (425818193, 170);
insert into TAKES (person_id, class_number)
values (425818193, 183);
insert into TAKES (person_id, class_number)
values (428693989, 126);
insert into TAKES (person_id, class_number)
values (428693989, 137);
insert into TAKES (person_id, class_number)
values (428693989, 171);
insert into TAKES (person_id, class_number)
values (429548529, 39);
insert into TAKES (person_id, class_number)
values (429548529, 81);
insert into TAKES (person_id, class_number)
values (429548529, 160);
insert into TAKES (person_id, class_number)
values (429548529, 181);
insert into TAKES (person_id, class_number)
values (430953154, 35);
insert into TAKES (person_id, class_number)
values (430953154, 116);
insert into TAKES (person_id, class_number)
values (430953154, 129);
insert into TAKES (person_id, class_number)
values (430953154, 163);
insert into TAKES (person_id, class_number)
values (441545484, 187);
insert into TAKES (person_id, class_number)
values (442799071, 40);
insert into TAKES (person_id, class_number)
values (442799071, 171);
insert into TAKES (person_id, class_number)
values (446464107, 67);
insert into TAKES (person_id, class_number)
values (446464107, 87);
insert into TAKES (person_id, class_number)
values (448376914, 46);
insert into TAKES (person_id, class_number)
values (448376914, 173);
insert into TAKES (person_id, class_number)
values (448376914, 190);
insert into TAKES (person_id, class_number)
values (449179265, 12);
insert into TAKES (person_id, class_number)
values (449179265, 123);
insert into TAKES (person_id, class_number)
values (449179265, 128);
insert into TAKES (person_id, class_number)
values (449179265, 142);
insert into TAKES (person_id, class_number)
values (449179265, 167);
insert into TAKES (person_id, class_number)
values (450378456, 10);
insert into TAKES (person_id, class_number)
values (450378456, 80);
insert into TAKES (person_id, class_number)
values (450378456, 131);
insert into TAKES (person_id, class_number)
values (450378456, 138);
insert into TAKES (person_id, class_number)
values (450378456, 162);
insert into TAKES (person_id, class_number)
values (451950079, 51);
insert into TAKES (person_id, class_number)
values (451950079, 118);
insert into TAKES (person_id, class_number)
values (453388492, 47);
insert into TAKES (person_id, class_number)
values (453388492, 120);
insert into TAKES (person_id, class_number)
values (453388492, 153);
insert into TAKES (person_id, class_number)
values (464542668, 136);
insert into TAKES (person_id, class_number)
values (464542668, 139);
insert into TAKES (person_id, class_number)
values (464542668, 153);
insert into TAKES (person_id, class_number)
values (464542668, 160);
insert into TAKES (person_id, class_number)
values (464739079, 12);
insert into TAKES (person_id, class_number)
values (464739079, 130);
insert into TAKES (person_id, class_number)
values (464739079, 178);
insert into TAKES (person_id, class_number)
values (464739079, 182);
insert into TAKES (person_id, class_number)
values (469692372, 165);
insert into TAKES (person_id, class_number)
values (482913375, 133);
insert into TAKES (person_id, class_number)
values (482913375, 159);
insert into TAKES (person_id, class_number)
values (483523397, 121);
insert into TAKES (person_id, class_number)
values (483523397, 127);
insert into TAKES (person_id, class_number)
values (486610639, 128);
insert into TAKES (person_id, class_number)
values (486610639, 135);
insert into TAKES (person_id, class_number)
values (486610639, 141);
insert into TAKES (person_id, class_number)
values (486610639, 170);
insert into TAKES (person_id, class_number)
values (510896901, 163);
insert into TAKES (person_id, class_number)
values (513708263, 119);
insert into TAKES (person_id, class_number)
values (526289796, 107);
insert into TAKES (person_id, class_number)
values (526289796, 153);
insert into TAKES (person_id, class_number)
values (526289796, 155);
insert into TAKES (person_id, class_number)
values (526289796, 190);
insert into TAKES (person_id, class_number)
values (537871085, 10);
insert into TAKES (person_id, class_number)
values (537871085, 49);
insert into TAKES (person_id, class_number)
values (537871085, 81);
insert into TAKES (person_id, class_number)
values (537871085, 114);
insert into TAKES (person_id, class_number)
values (537871085, 120);
insert into TAKES (person_id, class_number)
values (537871085, 141);
insert into TAKES (person_id, class_number)
values (537871085, 143);
insert into TAKES (person_id, class_number)
values (546060620, 16);
insert into TAKES (person_id, class_number)
values (546060620, 138);
insert into TAKES (person_id, class_number)
values (546060620, 184);
insert into TAKES (person_id, class_number)
values (548380542, 25);
insert into TAKES (person_id, class_number)
values (548380542, 114);
insert into TAKES (person_id, class_number)
values (548380542, 118);
insert into TAKES (person_id, class_number)
values (548380542, 170);
insert into TAKES (person_id, class_number)
values (552880750, 59);
insert into TAKES (person_id, class_number)
values (552880750, 107);
insert into TAKES (person_id, class_number)
values (552880750, 154);
insert into TAKES (person_id, class_number)
values (558102976, 34);
insert into TAKES (person_id, class_number)
values (558102976, 66);
insert into TAKES (person_id, class_number)
values (558102976, 73);
insert into TAKES (person_id, class_number)
values (558102976, 81);
insert into TAKES (person_id, class_number)
values (558102976, 112);
insert into TAKES (person_id, class_number)
values (558102976, 172);
insert into TAKES (person_id, class_number)
values (558102976, 190);
insert into TAKES (person_id, class_number)
values (568076166, 2);
insert into TAKES (person_id, class_number)
values (568076166, 165);
insert into TAKES (person_id, class_number)
values (568933983, 73);
insert into TAKES (person_id, class_number)
values (568933983, 133);
insert into TAKES (person_id, class_number)
values (568933983, 157);
insert into TAKES (person_id, class_number)
values (570953575, 100);
insert into TAKES (person_id, class_number)
values (579480884, 122);
insert into TAKES (person_id, class_number)
values (579480884, 153);
insert into TAKES (person_id, class_number)
values (585401273, 80);
insert into TAKES (person_id, class_number)
values (585401273, 155);
insert into TAKES (person_id, class_number)
values (585401273, 162);
insert into TAKES (person_id, class_number)
values (599267960, 182);
insert into TAKES (person_id, class_number)
values (599267960, 184);
insert into TAKES (person_id, class_number)
values (621394627, 125);
insert into TAKES (person_id, class_number)
values (621394627, 153);
commit;
prompt 300 records committed...
insert into TAKES (person_id, class_number)
values (622710490, 100);
insert into TAKES (person_id, class_number)
values (622710490, 116);
insert into TAKES (person_id, class_number)
values (622710490, 185);
insert into TAKES (person_id, class_number)
values (624373181, 175);
insert into TAKES (person_id, class_number)
values (624776728, 191);
insert into TAKES (person_id, class_number)
values (628287659, 80);
insert into TAKES (person_id, class_number)
values (628287659, 114);
insert into TAKES (person_id, class_number)
values (629006255, 44);
insert into TAKES (person_id, class_number)
values (629006255, 124);
insert into TAKES (person_id, class_number)
values (629006255, 130);
insert into TAKES (person_id, class_number)
values (629006255, 144);
insert into TAKES (person_id, class_number)
values (629006255, 146);
insert into TAKES (person_id, class_number)
values (629006255, 161);
insert into TAKES (person_id, class_number)
values (631209336, 20);
insert into TAKES (person_id, class_number)
values (631209336, 39);
insert into TAKES (person_id, class_number)
values (631209336, 81);
insert into TAKES (person_id, class_number)
values (631209336, 145);
insert into TAKES (person_id, class_number)
values (639230686, 23);
insert into TAKES (person_id, class_number)
values (639230686, 135);
insert into TAKES (person_id, class_number)
values (639230686, 165);
insert into TAKES (person_id, class_number)
values (639230686, 177);
insert into TAKES (person_id, class_number)
values (644624124, 93);
insert into TAKES (person_id, class_number)
values (644624124, 108);
insert into TAKES (person_id, class_number)
values (644624124, 154);
insert into TAKES (person_id, class_number)
values (644624124, 162);
insert into TAKES (person_id, class_number)
values (645260478, 135);
insert into TAKES (person_id, class_number)
values (651173695, 12);
insert into TAKES (person_id, class_number)
values (651173695, 35);
insert into TAKES (person_id, class_number)
values (651173695, 119);
insert into TAKES (person_id, class_number)
values (652621999, 9);
insert into TAKES (person_id, class_number)
values (652621999, 34);
insert into TAKES (person_id, class_number)
values (666931958, 16);
insert into TAKES (person_id, class_number)
values (666931958, 113);
insert into TAKES (person_id, class_number)
values (680741899, 140);
insert into TAKES (person_id, class_number)
values (680741899, 160);
insert into TAKES (person_id, class_number)
values (680741899, 161);
insert into TAKES (person_id, class_number)
values (685290986, 34);
insert into TAKES (person_id, class_number)
values (685290986, 42);
insert into TAKES (person_id, class_number)
values (685290986, 151);
insert into TAKES (person_id, class_number)
values (694288312, 88);
insert into TAKES (person_id, class_number)
values (695131325, 10);
insert into TAKES (person_id, class_number)
values (695131325, 166);
insert into TAKES (person_id, class_number)
values (695131325, 176);
insert into TAKES (person_id, class_number)
values (706388337, 117);
insert into TAKES (person_id, class_number)
values (706388337, 143);
insert into TAKES (person_id, class_number)
values (706388337, 170);
insert into TAKES (person_id, class_number)
values (707467033, 40);
insert into TAKES (person_id, class_number)
values (707467033, 42);
insert into TAKES (person_id, class_number)
values (707467033, 167);
insert into TAKES (person_id, class_number)
values (707467033, 172);
insert into TAKES (person_id, class_number)
values (707467033, 178);
insert into TAKES (person_id, class_number)
values (707467033, 183);
insert into TAKES (person_id, class_number)
values (710690978, 162);
insert into TAKES (person_id, class_number)
values (710690978, 191);
insert into TAKES (person_id, class_number)
values (725658881, 119);
insert into TAKES (person_id, class_number)
values (725658881, 188);
insert into TAKES (person_id, class_number)
values (728518006, 149);
insert into TAKES (person_id, class_number)
values (735014216, 149);
insert into TAKES (person_id, class_number)
values (735014216, 167);
insert into TAKES (person_id, class_number)
values (735242053, 3);
insert into TAKES (person_id, class_number)
values (735242053, 73);
insert into TAKES (person_id, class_number)
values (735242053, 136);
insert into TAKES (person_id, class_number)
values (735242053, 138);
insert into TAKES (person_id, class_number)
values (739730077, 169);
insert into TAKES (person_id, class_number)
values (741535265, 2);
insert into TAKES (person_id, class_number)
values (741535265, 27);
insert into TAKES (person_id, class_number)
values (741535265, 73);
insert into TAKES (person_id, class_number)
values (741535265, 101);
insert into TAKES (person_id, class_number)
values (741535265, 113);
insert into TAKES (person_id, class_number)
values (741535265, 182);
insert into TAKES (person_id, class_number)
values (750005809, 136);
insert into TAKES (person_id, class_number)
values (750005809, 144);
insert into TAKES (person_id, class_number)
values (752537794, 2);
insert into TAKES (person_id, class_number)
values (752537794, 116);
insert into TAKES (person_id, class_number)
values (752537794, 122);
insert into TAKES (person_id, class_number)
values (752537794, 144);
insert into TAKES (person_id, class_number)
values (752537794, 147);
insert into TAKES (person_id, class_number)
values (752537794, 177);
insert into TAKES (person_id, class_number)
values (764516309, 136);
insert into TAKES (person_id, class_number)
values (765824624, 148);
insert into TAKES (person_id, class_number)
values (765824624, 187);
insert into TAKES (person_id, class_number)
values (769271035, 151);
insert into TAKES (person_id, class_number)
values (769271035, 161);
insert into TAKES (person_id, class_number)
values (769271035, 181);
insert into TAKES (person_id, class_number)
values (776488744, 108);
insert into TAKES (person_id, class_number)
values (776488744, 144);
insert into TAKES (person_id, class_number)
values (776488744, 152);
insert into TAKES (person_id, class_number)
values (779786218, 149);
insert into TAKES (person_id, class_number)
values (780381836, 2);
insert into TAKES (person_id, class_number)
values (780381836, 132);
insert into TAKES (person_id, class_number)
values (780381836, 178);
insert into TAKES (person_id, class_number)
values (804361204, 159);
insert into TAKES (person_id, class_number)
values (804361204, 186);
insert into TAKES (person_id, class_number)
values (804626341, 117);
insert into TAKES (person_id, class_number)
values (806377008, 25);
insert into TAKES (person_id, class_number)
values (807894763, 144);
insert into TAKES (person_id, class_number)
values (817112047, 113);
insert into TAKES (person_id, class_number)
values (817112047, 121);
insert into TAKES (person_id, class_number)
values (826426071, 10);
insert into TAKES (person_id, class_number)
values (826426071, 27);
commit;
prompt 400 records committed...
insert into TAKES (person_id, class_number)
values (826426071, 169);
insert into TAKES (person_id, class_number)
values (835544906, 139);
insert into TAKES (person_id, class_number)
values (835544906, 156);
insert into TAKES (person_id, class_number)
values (835544906, 172);
insert into TAKES (person_id, class_number)
values (843698732, 160);
insert into TAKES (person_id, class_number)
values (843698732, 169);
insert into TAKES (person_id, class_number)
values (853980163, 59);
insert into TAKES (person_id, class_number)
values (853980163, 107);
insert into TAKES (person_id, class_number)
values (853980163, 140);
insert into TAKES (person_id, class_number)
values (853980163, 172);
insert into TAKES (person_id, class_number)
values (855737641, 158);
insert into TAKES (person_id, class_number)
values (860618977, 100);
insert into TAKES (person_id, class_number)
values (860618977, 131);
insert into TAKES (person_id, class_number)
values (861976871, 129);
insert into TAKES (person_id, class_number)
values (861976871, 143);
insert into TAKES (person_id, class_number)
values (861976871, 157);
insert into TAKES (person_id, class_number)
values (861976871, 164);
insert into TAKES (person_id, class_number)
values (872264579, 9);
insert into TAKES (person_id, class_number)
values (872264579, 16);
insert into TAKES (person_id, class_number)
values (872264579, 140);
insert into TAKES (person_id, class_number)
values (872264579, 178);
insert into TAKES (person_id, class_number)
values (876054889, 149);
insert into TAKES (person_id, class_number)
values (882528796, 47);
insert into TAKES (person_id, class_number)
values (882528796, 116);
insert into TAKES (person_id, class_number)
values (882528796, 117);
insert into TAKES (person_id, class_number)
values (882528796, 186);
insert into TAKES (person_id, class_number)
values (883305631, 161);
insert into TAKES (person_id, class_number)
values (889114374, 12);
insert into TAKES (person_id, class_number)
values (889114374, 46);
insert into TAKES (person_id, class_number)
values (889114374, 74);
insert into TAKES (person_id, class_number)
values (889114374, 133);
insert into TAKES (person_id, class_number)
values (891605799, 1);
insert into TAKES (person_id, class_number)
values (891605799, 42);
insert into TAKES (person_id, class_number)
values (891605799, 144);
insert into TAKES (person_id, class_number)
values (894465652, 33);
insert into TAKES (person_id, class_number)
values (894465652, 121);
insert into TAKES (person_id, class_number)
values (894465652, 151);
insert into TAKES (person_id, class_number)
values (910834121, 164);
insert into TAKES (person_id, class_number)
values (922954022, 107);
insert into TAKES (person_id, class_number)
values (926205546, 135);
insert into TAKES (person_id, class_number)
values (926205546, 145);
insert into TAKES (person_id, class_number)
values (936296296, 16);
insert into TAKES (person_id, class_number)
values (936296296, 116);
insert into TAKES (person_id, class_number)
values (938379550, 9);
insert into TAKES (person_id, class_number)
values (938379550, 152);
insert into TAKES (person_id, class_number)
values (938969949, 169);
insert into TAKES (person_id, class_number)
values (938969949, 189);
insert into TAKES (person_id, class_number)
values (940153696, 162);
insert into TAKES (person_id, class_number)
values (941326323, 46);
insert into TAKES (person_id, class_number)
values (941326323, 122);
insert into TAKES (person_id, class_number)
values (941326323, 128);
insert into TAKES (person_id, class_number)
values (941326323, 142);
insert into TAKES (person_id, class_number)
values (941326323, 176);
insert into TAKES (person_id, class_number)
values (941326323, 188);
insert into TAKES (person_id, class_number)
values (945225421, 122);
insert into TAKES (person_id, class_number)
values (946460524, 87);
insert into TAKES (person_id, class_number)
values (946460524, 131);
insert into TAKES (person_id, class_number)
values (946460524, 152);
insert into TAKES (person_id, class_number)
values (946460524, 158);
insert into TAKES (person_id, class_number)
values (946460524, 174);
insert into TAKES (person_id, class_number)
values (946654322, 67);
insert into TAKES (person_id, class_number)
values (946654322, 169);
insert into TAKES (person_id, class_number)
values (946654322, 189);
insert into TAKES (person_id, class_number)
values (948674690, 42);
insert into TAKES (person_id, class_number)
values (948674690, 108);
insert into TAKES (person_id, class_number)
values (948674690, 154);
insert into TAKES (person_id, class_number)
values (950590951, 44);
insert into TAKES (person_id, class_number)
values (950590951, 80);
insert into TAKES (person_id, class_number)
values (973430375, 101);
insert into TAKES (person_id, class_number)
values (973430375, 125);
insert into TAKES (person_id, class_number)
values (974885124, 100);
insert into TAKES (person_id, class_number)
values (974885124, 114);
insert into TAKES (person_id, class_number)
values (974885124, 148);
insert into TAKES (person_id, class_number)
values (976071851, 35);
insert into TAKES (person_id, class_number)
values (976071851, 42);
insert into TAKES (person_id, class_number)
values (976071851, 160);
insert into TAKES (person_id, class_number)
values (976071851, 162);
insert into TAKES (person_id, class_number)
values (982111666, 174);
insert into TAKES (person_id, class_number)
values (984798679, 67);
insert into TAKES (person_id, class_number)
values (984798679, 174);
insert into TAKES (person_id, class_number)
values (988123159, 127);
insert into TAKES (person_id, class_number)
values (988123159, 143);
insert into TAKES (person_id, class_number)
values (988123159, 155);
insert into TAKES (person_id, class_number)
values (988216871, 101);
insert into TAKES (person_id, class_number)
values (988216871, 148);
insert into TAKES (person_id, class_number)
values (988216871, 174);
insert into TAKES (person_id, class_number)
values (988561837, 2);
insert into TAKES (person_id, class_number)
values (992774372, 178);
insert into TAKES (person_id, class_number)
values (998544947, 73);
insert into TAKES (person_id, class_number)
values (998544947, 116);
insert into TAKES (person_id, class_number)
values (998544947, 117);
insert into TAKES (person_id, class_number)
values (998544947, 153);
insert into TAKES (person_id, class_number)
values (998544947, 170);
insert into TAKES (person_id, class_number)
values (998544947, 176);
commit;
prompt 494 records loaded
prompt Loading TRAINS_IN...
insert into TRAINS_IN (gym_number, person_id)
values (1, 225440261);
insert into TRAINS_IN (gym_number, person_id)
values (1, 301956654);
insert into TRAINS_IN (gym_number, person_id)
values (1, 310393073);
insert into TRAINS_IN (gym_number, person_id)
values (1, 415525906);
insert into TRAINS_IN (gym_number, person_id)
values (1, 435490677);
insert into TRAINS_IN (gym_number, person_id)
values (1, 621394627);
insert into TRAINS_IN (gym_number, person_id)
values (1, 628287659);
insert into TRAINS_IN (gym_number, person_id)
values (1, 945225421);
insert into TRAINS_IN (gym_number, person_id)
values (1, 973430375);
insert into TRAINS_IN (gym_number, person_id)
values (2, 37515876);
insert into TRAINS_IN (gym_number, person_id)
values (2, 88847666);
insert into TRAINS_IN (gym_number, person_id)
values (2, 132924806);
insert into TRAINS_IN (gym_number, person_id)
values (2, 166730141);
insert into TRAINS_IN (gym_number, person_id)
values (2, 193732741);
insert into TRAINS_IN (gym_number, person_id)
values (2, 301956654);
insert into TRAINS_IN (gym_number, person_id)
values (2, 450378456);
insert into TRAINS_IN (gym_number, person_id)
values (2, 464739079);
insert into TRAINS_IN (gym_number, person_id)
values (2, 546060620);
insert into TRAINS_IN (gym_number, person_id)
values (2, 695131325);
insert into TRAINS_IN (gym_number, person_id)
values (2, 769271035);
insert into TRAINS_IN (gym_number, person_id)
values (2, 945225421);
insert into TRAINS_IN (gym_number, person_id)
values (2, 998544947);
insert into TRAINS_IN (gym_number, person_id)
values (3, 239567444);
insert into TRAINS_IN (gym_number, person_id)
values (3, 442799071);
insert into TRAINS_IN (gym_number, person_id)
values (3, 464542668);
insert into TRAINS_IN (gym_number, person_id)
values (3, 548380542);
insert into TRAINS_IN (gym_number, person_id)
values (3, 651173695);
insert into TRAINS_IN (gym_number, person_id)
values (3, 946654322);
insert into TRAINS_IN (gym_number, person_id)
values (3, 982111666);
insert into TRAINS_IN (gym_number, person_id)
values (4, 225440261);
insert into TRAINS_IN (gym_number, person_id)
values (4, 446464107);
insert into TRAINS_IN (gym_number, person_id)
values (4, 464739079);
insert into TRAINS_IN (gym_number, person_id)
values (4, 622710490);
insert into TRAINS_IN (gym_number, person_id)
values (4, 894465652);
insert into TRAINS_IN (gym_number, person_id)
values (4, 988561837);
insert into TRAINS_IN (gym_number, person_id)
values (5, 201957512);
insert into TRAINS_IN (gym_number, person_id)
values (5, 310393073);
insert into TRAINS_IN (gym_number, person_id)
values (5, 399915317);
insert into TRAINS_IN (gym_number, person_id)
values (5, 410879352);
insert into TRAINS_IN (gym_number, person_id)
values (5, 644624124);
insert into TRAINS_IN (gym_number, person_id)
values (5, 695131325);
insert into TRAINS_IN (gym_number, person_id)
values (5, 861976871);
insert into TRAINS_IN (gym_number, person_id)
values (6, 37515876);
insert into TRAINS_IN (gym_number, person_id)
values (6, 150991526);
insert into TRAINS_IN (gym_number, person_id)
values (6, 239567444);
insert into TRAINS_IN (gym_number, person_id)
values (6, 546060620);
insert into TRAINS_IN (gym_number, person_id)
values (6, 833152003);
insert into TRAINS_IN (gym_number, person_id)
values (6, 883305631);
insert into TRAINS_IN (gym_number, person_id)
values (6, 988123159);
insert into TRAINS_IN (gym_number, person_id)
values (7, 311230449);
insert into TRAINS_IN (gym_number, person_id)
values (7, 325260082);
insert into TRAINS_IN (gym_number, person_id)
values (7, 392375337);
insert into TRAINS_IN (gym_number, person_id)
values (7, 644624124);
insert into TRAINS_IN (gym_number, person_id)
values (7, 735242053);
insert into TRAINS_IN (gym_number, person_id)
values (7, 826426071);
insert into TRAINS_IN (gym_number, person_id)
values (7, 853980163);
insert into TRAINS_IN (gym_number, person_id)
values (7, 948674690);
insert into TRAINS_IN (gym_number, person_id)
values (8, 204342963);
insert into TRAINS_IN (gym_number, person_id)
values (8, 301956654);
insert into TRAINS_IN (gym_number, person_id)
values (8, 415525906);
insert into TRAINS_IN (gym_number, person_id)
values (8, 464739079);
insert into TRAINS_IN (gym_number, person_id)
values (8, 509609652);
insert into TRAINS_IN (gym_number, person_id)
values (8, 804361204);
insert into TRAINS_IN (gym_number, person_id)
values (8, 826426071);
insert into TRAINS_IN (gym_number, person_id)
values (8, 861976871);
insert into TRAINS_IN (gym_number, person_id)
values (8, 876054889);
insert into TRAINS_IN (gym_number, person_id)
values (9, 121399588);
insert into TRAINS_IN (gym_number, person_id)
values (9, 611561804);
insert into TRAINS_IN (gym_number, person_id)
values (10, 341491772);
insert into TRAINS_IN (gym_number, person_id)
values (10, 399915317);
insert into TRAINS_IN (gym_number, person_id)
values (10, 451950079);
insert into TRAINS_IN (gym_number, person_id)
values (10, 741535265);
insert into TRAINS_IN (gym_number, person_id)
values (10, 817112047);
insert into TRAINS_IN (gym_number, person_id)
values (10, 988123159);
insert into TRAINS_IN (gym_number, person_id)
values (11, 15823020);
insert into TRAINS_IN (gym_number, person_id)
values (11, 37515876);
insert into TRAINS_IN (gym_number, person_id)
values (11, 248130758);
insert into TRAINS_IN (gym_number, person_id)
values (11, 321751750);
insert into TRAINS_IN (gym_number, person_id)
values (11, 342560579);
insert into TRAINS_IN (gym_number, person_id)
values (11, 399425803);
insert into TRAINS_IN (gym_number, person_id)
values (11, 451950079);
insert into TRAINS_IN (gym_number, person_id)
values (11, 482913375);
insert into TRAINS_IN (gym_number, person_id)
values (11, 521005306);
insert into TRAINS_IN (gym_number, person_id)
values (11, 552880750);
insert into TRAINS_IN (gym_number, person_id)
values (11, 941326323);
insert into TRAINS_IN (gym_number, person_id)
values (11, 948674690);
insert into TRAINS_IN (gym_number, person_id)
values (12, 9419613);
insert into TRAINS_IN (gym_number, person_id)
values (12, 115738810);
insert into TRAINS_IN (gym_number, person_id)
values (12, 430953154);
insert into TRAINS_IN (gym_number, person_id)
values (12, 568076166);
insert into TRAINS_IN (gym_number, person_id)
values (12, 624776728);
insert into TRAINS_IN (gym_number, person_id)
values (12, 894465652);
insert into TRAINS_IN (gym_number, person_id)
values (12, 945225421);
insert into TRAINS_IN (gym_number, person_id)
values (12, 956293618);
insert into TRAINS_IN (gym_number, person_id)
values (13, 43126911);
insert into TRAINS_IN (gym_number, person_id)
values (13, 294207967);
insert into TRAINS_IN (gym_number, person_id)
values (13, 509609652);
insert into TRAINS_IN (gym_number, person_id)
values (13, 548380542);
insert into TRAINS_IN (gym_number, person_id)
values (13, 741535265);
insert into TRAINS_IN (gym_number, person_id)
values (13, 883305631);
commit;
prompt 100 records committed...
insert into TRAINS_IN (gym_number, person_id)
values (13, 982111666);
insert into TRAINS_IN (gym_number, person_id)
values (13, 984798679);
insert into TRAINS_IN (gym_number, person_id)
values (13, 992774372);
insert into TRAINS_IN (gym_number, person_id)
values (14, 89807477);
insert into TRAINS_IN (gym_number, person_id)
values (14, 157283500);
insert into TRAINS_IN (gym_number, person_id)
values (14, 332700112);
insert into TRAINS_IN (gym_number, person_id)
values (14, 338258344);
insert into TRAINS_IN (gym_number, person_id)
values (14, 570953575);
insert into TRAINS_IN (gym_number, person_id)
values (14, 894465652);
insert into TRAINS_IN (gym_number, person_id)
values (14, 910834121);
insert into TRAINS_IN (gym_number, person_id)
values (15, 325260082);
insert into TRAINS_IN (gym_number, person_id)
values (15, 376660032);
insert into TRAINS_IN (gym_number, person_id)
values (15, 521005306);
insert into TRAINS_IN (gym_number, person_id)
values (15, 526289796);
insert into TRAINS_IN (gym_number, person_id)
values (15, 558102976);
insert into TRAINS_IN (gym_number, person_id)
values (15, 728518006);
insert into TRAINS_IN (gym_number, person_id)
values (15, 938379550);
insert into TRAINS_IN (gym_number, person_id)
values (16, 16269226);
insert into TRAINS_IN (gym_number, person_id)
values (16, 157283500);
insert into TRAINS_IN (gym_number, person_id)
values (16, 204342963);
insert into TRAINS_IN (gym_number, person_id)
values (16, 311230449);
insert into TRAINS_IN (gym_number, person_id)
values (16, 328828217);
insert into TRAINS_IN (gym_number, person_id)
values (16, 399425803);
insert into TRAINS_IN (gym_number, person_id)
values (16, 410879352);
insert into TRAINS_IN (gym_number, person_id)
values (16, 435490677);
insert into TRAINS_IN (gym_number, person_id)
values (16, 622710490);
insert into TRAINS_IN (gym_number, person_id)
values (16, 624776728);
insert into TRAINS_IN (gym_number, person_id)
values (16, 710690978);
insert into TRAINS_IN (gym_number, person_id)
values (16, 741535265);
insert into TRAINS_IN (gym_number, person_id)
values (17, 109184345);
insert into TRAINS_IN (gym_number, person_id)
values (17, 157283500);
insert into TRAINS_IN (gym_number, person_id)
values (17, 193732741);
insert into TRAINS_IN (gym_number, person_id)
values (17, 526289796);
insert into TRAINS_IN (gym_number, person_id)
values (17, 624373181);
insert into TRAINS_IN (gym_number, person_id)
values (17, 645260478);
insert into TRAINS_IN (gym_number, person_id)
values (18, 735242053);
insert into TRAINS_IN (gym_number, person_id)
values (18, 739730077);
insert into TRAINS_IN (gym_number, person_id)
values (18, 752537794);
insert into TRAINS_IN (gym_number, person_id)
values (18, 780381836);
insert into TRAINS_IN (gym_number, person_id)
values (18, 883305631);
insert into TRAINS_IN (gym_number, person_id)
values (19, 66242318);
insert into TRAINS_IN (gym_number, person_id)
values (19, 91717809);
insert into TRAINS_IN (gym_number, person_id)
values (19, 248130758);
insert into TRAINS_IN (gym_number, person_id)
values (19, 328828217);
insert into TRAINS_IN (gym_number, person_id)
values (19, 351195569);
insert into TRAINS_IN (gym_number, person_id)
values (19, 624373181);
insert into TRAINS_IN (gym_number, person_id)
values (20, 270436980);
insert into TRAINS_IN (gym_number, person_id)
values (20, 342560579);
insert into TRAINS_IN (gym_number, person_id)
values (20, 367002722);
insert into TRAINS_IN (gym_number, person_id)
values (20, 651173695);
insert into TRAINS_IN (gym_number, person_id)
values (20, 706388337);
insert into TRAINS_IN (gym_number, person_id)
values (20, 938379550);
insert into TRAINS_IN (gym_number, person_id)
values (20, 973430375);
insert into TRAINS_IN (gym_number, person_id)
values (20, 988216871);
insert into TRAINS_IN (gym_number, person_id)
values (21, 130849103);
insert into TRAINS_IN (gym_number, person_id)
values (21, 399425803);
insert into TRAINS_IN (gym_number, person_id)
values (21, 579480884);
insert into TRAINS_IN (gym_number, person_id)
values (22, 143450646);
insert into TRAINS_IN (gym_number, person_id)
values (22, 239567444);
insert into TRAINS_IN (gym_number, person_id)
values (22, 450378456);
insert into TRAINS_IN (gym_number, person_id)
values (22, 548380542);
insert into TRAINS_IN (gym_number, person_id)
values (22, 568933983);
insert into TRAINS_IN (gym_number, person_id)
values (22, 639230686);
insert into TRAINS_IN (gym_number, person_id)
values (22, 988561837);
insert into TRAINS_IN (gym_number, person_id)
values (22, 998544947);
insert into TRAINS_IN (gym_number, person_id)
values (23, 310135900);
insert into TRAINS_IN (gym_number, person_id)
values (23, 310393073);
insert into TRAINS_IN (gym_number, person_id)
values (23, 348139398);
insert into TRAINS_IN (gym_number, person_id)
values (23, 418865652);
insert into TRAINS_IN (gym_number, person_id)
values (23, 992774372);
insert into TRAINS_IN (gym_number, person_id)
values (24, 37357831);
insert into TRAINS_IN (gym_number, person_id)
values (24, 165021958);
insert into TRAINS_IN (gym_number, person_id)
values (24, 348139398);
insert into TRAINS_IN (gym_number, person_id)
values (24, 375971023);
insert into TRAINS_IN (gym_number, person_id)
values (24, 387031674);
insert into TRAINS_IN (gym_number, person_id)
values (24, 399425803);
insert into TRAINS_IN (gym_number, person_id)
values (24, 464739079);
insert into TRAINS_IN (gym_number, person_id)
values (24, 579480884);
insert into TRAINS_IN (gym_number, person_id)
values (24, 680741899);
insert into TRAINS_IN (gym_number, person_id)
values (24, 806377008);
insert into TRAINS_IN (gym_number, person_id)
values (24, 891605799);
insert into TRAINS_IN (gym_number, person_id)
values (24, 938379550);
insert into TRAINS_IN (gym_number, person_id)
values (25, 165021958);
insert into TRAINS_IN (gym_number, person_id)
values (25, 325260082);
insert into TRAINS_IN (gym_number, person_id)
values (25, 325851770);
insert into TRAINS_IN (gym_number, person_id)
values (25, 442799071);
insert into TRAINS_IN (gym_number, person_id)
values (25, 464542668);
insert into TRAINS_IN (gym_number, person_id)
values (25, 548380542);
insert into TRAINS_IN (gym_number, person_id)
values (25, 611561804);
insert into TRAINS_IN (gym_number, person_id)
values (25, 644624124);
insert into TRAINS_IN (gym_number, person_id)
values (25, 750005809);
insert into TRAINS_IN (gym_number, person_id)
values (25, 804361204);
insert into TRAINS_IN (gym_number, person_id)
values (25, 806377008);
insert into TRAINS_IN (gym_number, person_id)
values (25, 894465652);
insert into TRAINS_IN (gym_number, person_id)
values (26, 16269226);
insert into TRAINS_IN (gym_number, person_id)
values (26, 48591713);
insert into TRAINS_IN (gym_number, person_id)
values (26, 387031674);
insert into TRAINS_IN (gym_number, person_id)
values (26, 413903985);
insert into TRAINS_IN (gym_number, person_id)
values (26, 425818193);
insert into TRAINS_IN (gym_number, person_id)
values (26, 449179265);
commit;
prompt 200 records committed...
insert into TRAINS_IN (gym_number, person_id)
values (26, 451950079);
insert into TRAINS_IN (gym_number, person_id)
values (26, 628287659);
insert into TRAINS_IN (gym_number, person_id)
values (27, 186971826);
insert into TRAINS_IN (gym_number, person_id)
values (27, 310135900);
insert into TRAINS_IN (gym_number, person_id)
values (27, 328828217);
insert into TRAINS_IN (gym_number, person_id)
values (27, 568076166);
insert into TRAINS_IN (gym_number, person_id)
values (27, 922954022);
insert into TRAINS_IN (gym_number, person_id)
values (27, 988216871);
insert into TRAINS_IN (gym_number, person_id)
values (28, 66242318);
insert into TRAINS_IN (gym_number, person_id)
values (28, 336899848);
insert into TRAINS_IN (gym_number, person_id)
values (28, 341491772);
insert into TRAINS_IN (gym_number, person_id)
values (28, 398712524);
insert into TRAINS_IN (gym_number, person_id)
values (28, 644624124);
insert into TRAINS_IN (gym_number, person_id)
values (28, 739730077);
insert into TRAINS_IN (gym_number, person_id)
values (28, 776488744);
insert into TRAINS_IN (gym_number, person_id)
values (28, 843698732);
insert into TRAINS_IN (gym_number, person_id)
values (28, 922954022);
insert into TRAINS_IN (gym_number, person_id)
values (29, 76725560);
insert into TRAINS_IN (gym_number, person_id)
values (29, 310135900);
insert into TRAINS_IN (gym_number, person_id)
values (29, 410879352);
insert into TRAINS_IN (gym_number, person_id)
values (29, 513708263);
insert into TRAINS_IN (gym_number, person_id)
values (29, 599267960);
insert into TRAINS_IN (gym_number, person_id)
values (29, 694288312);
insert into TRAINS_IN (gym_number, person_id)
values (29, 725658881);
insert into TRAINS_IN (gym_number, person_id)
values (29, 752537794);
insert into TRAINS_IN (gym_number, person_id)
values (29, 992774372);
insert into TRAINS_IN (gym_number, person_id)
values (30, 66242318);
insert into TRAINS_IN (gym_number, person_id)
values (30, 188553765);
insert into TRAINS_IN (gym_number, person_id)
values (30, 294207967);
insert into TRAINS_IN (gym_number, person_id)
values (30, 310135900);
insert into TRAINS_IN (gym_number, person_id)
values (30, 383155495);
insert into TRAINS_IN (gym_number, person_id)
values (30, 399425803);
insert into TRAINS_IN (gym_number, person_id)
values (30, 430953154);
insert into TRAINS_IN (gym_number, person_id)
values (30, 546060620);
insert into TRAINS_IN (gym_number, person_id)
values (30, 741535265);
insert into TRAINS_IN (gym_number, person_id)
values (30, 804361204);
insert into TRAINS_IN (gym_number, person_id)
values (30, 855737641);
insert into TRAINS_IN (gym_number, person_id)
values (31, 17535897);
insert into TRAINS_IN (gym_number, person_id)
values (31, 115738810);
insert into TRAINS_IN (gym_number, person_id)
values (31, 270436980);
insert into TRAINS_IN (gym_number, person_id)
values (31, 384007856);
insert into TRAINS_IN (gym_number, person_id)
values (31, 451950079);
insert into TRAINS_IN (gym_number, person_id)
values (31, 622710490);
insert into TRAINS_IN (gym_number, person_id)
values (31, 624373181);
insert into TRAINS_IN (gym_number, person_id)
values (31, 769271035);
insert into TRAINS_IN (gym_number, person_id)
values (31, 974885124);
insert into TRAINS_IN (gym_number, person_id)
values (32, 165021958);
insert into TRAINS_IN (gym_number, person_id)
values (32, 328828217);
insert into TRAINS_IN (gym_number, person_id)
values (32, 338258344);
insert into TRAINS_IN (gym_number, person_id)
values (32, 341491772);
insert into TRAINS_IN (gym_number, person_id)
values (32, 376660032);
insert into TRAINS_IN (gym_number, person_id)
values (32, 552880750);
insert into TRAINS_IN (gym_number, person_id)
values (32, 651173695);
insert into TRAINS_IN (gym_number, person_id)
values (33, 100888066);
insert into TRAINS_IN (gym_number, person_id)
values (33, 143450646);
insert into TRAINS_IN (gym_number, person_id)
values (33, 338258344);
insert into TRAINS_IN (gym_number, person_id)
values (33, 383155495);
insert into TRAINS_IN (gym_number, person_id)
values (33, 398712524);
insert into TRAINS_IN (gym_number, person_id)
values (33, 415525906);
insert into TRAINS_IN (gym_number, person_id)
values (33, 453388492);
insert into TRAINS_IN (gym_number, person_id)
values (33, 510896901);
insert into TRAINS_IN (gym_number, person_id)
values (33, 558102976);
insert into TRAINS_IN (gym_number, person_id)
values (33, 645260478);
insert into TRAINS_IN (gym_number, person_id)
values (33, 652621999);
insert into TRAINS_IN (gym_number, person_id)
values (33, 680741899);
insert into TRAINS_IN (gym_number, person_id)
values (34, 60530810);
insert into TRAINS_IN (gym_number, person_id)
values (34, 88847666);
insert into TRAINS_IN (gym_number, person_id)
values (34, 430953154);
insert into TRAINS_IN (gym_number, person_id)
values (34, 482913375);
insert into TRAINS_IN (gym_number, person_id)
values (35, 166730141);
insert into TRAINS_IN (gym_number, person_id)
values (35, 241535899);
insert into TRAINS_IN (gym_number, person_id)
values (35, 359987794);
insert into TRAINS_IN (gym_number, person_id)
values (35, 429548529);
insert into TRAINS_IN (gym_number, person_id)
values (35, 631209336);
insert into TRAINS_IN (gym_number, person_id)
values (35, 680741899);
insert into TRAINS_IN (gym_number, person_id)
values (35, 764516309);
insert into TRAINS_IN (gym_number, person_id)
values (35, 776488744);
insert into TRAINS_IN (gym_number, person_id)
values (35, 817112047);
insert into TRAINS_IN (gym_number, person_id)
values (35, 872264579);
insert into TRAINS_IN (gym_number, person_id)
values (36, 725658881);
insert into TRAINS_IN (gym_number, person_id)
values (36, 891605799);
insert into TRAINS_IN (gym_number, person_id)
values (36, 988216871);
insert into TRAINS_IN (gym_number, person_id)
values (37, 119249472);
insert into TRAINS_IN (gym_number, person_id)
values (37, 294207967);
insert into TRAINS_IN (gym_number, person_id)
values (37, 367002722);
insert into TRAINS_IN (gym_number, person_id)
values (37, 394441189);
insert into TRAINS_IN (gym_number, person_id)
values (37, 428693989);
insert into TRAINS_IN (gym_number, person_id)
values (37, 450378456);
insert into TRAINS_IN (gym_number, person_id)
values (37, 513708263);
insert into TRAINS_IN (gym_number, person_id)
values (37, 639230686);
insert into TRAINS_IN (gym_number, person_id)
values (37, 644624124);
insert into TRAINS_IN (gym_number, person_id)
values (37, 804361204);
insert into TRAINS_IN (gym_number, person_id)
values (38, 143450646);
insert into TRAINS_IN (gym_number, person_id)
values (38, 294207967);
insert into TRAINS_IN (gym_number, person_id)
values (38, 375971023);
insert into TRAINS_IN (gym_number, person_id)
values (38, 384007856);
insert into TRAINS_IN (gym_number, person_id)
values (39, 186971826);
insert into TRAINS_IN (gym_number, person_id)
values (39, 270436980);
insert into TRAINS_IN (gym_number, person_id)
values (39, 332700112);
insert into TRAINS_IN (gym_number, person_id)
values (39, 336899848);
commit;
prompt 300 records committed...
insert into TRAINS_IN (gym_number, person_id)
values (39, 482913375);
insert into TRAINS_IN (gym_number, person_id)
values (39, 645260478);
insert into TRAINS_IN (gym_number, person_id)
values (39, 807894763);
insert into TRAINS_IN (gym_number, person_id)
values (40, 143450646);
insert into TRAINS_IN (gym_number, person_id)
values (40, 287056883);
insert into TRAINS_IN (gym_number, person_id)
values (40, 450378456);
insert into TRAINS_IN (gym_number, person_id)
values (40, 622710490);
insert into TRAINS_IN (gym_number, person_id)
values (40, 855737641);
insert into TRAINS_IN (gym_number, person_id)
values (40, 860618977);
insert into TRAINS_IN (gym_number, person_id)
values (40, 889114374);
insert into TRAINS_IN (gym_number, person_id)
values (40, 922954022);
insert into TRAINS_IN (gym_number, person_id)
values (41, 22608321);
insert into TRAINS_IN (gym_number, person_id)
values (41, 311230449);
insert into TRAINS_IN (gym_number, person_id)
values (41, 383155495);
insert into TRAINS_IN (gym_number, person_id)
values (41, 415525906);
insert into TRAINS_IN (gym_number, person_id)
values (41, 418865652);
insert into TRAINS_IN (gym_number, person_id)
values (41, 695131325);
insert into TRAINS_IN (gym_number, person_id)
values (41, 910834121);
insert into TRAINS_IN (gym_number, person_id)
values (41, 982111666);
insert into TRAINS_IN (gym_number, person_id)
values (42, 121399588);
insert into TRAINS_IN (gym_number, person_id)
values (42, 166730141);
insert into TRAINS_IN (gym_number, person_id)
values (42, 338258344);
insert into TRAINS_IN (gym_number, person_id)
values (42, 442799071);
insert into TRAINS_IN (gym_number, person_id)
values (42, 773097313);
insert into TRAINS_IN (gym_number, person_id)
values (42, 883305631);
insert into TRAINS_IN (gym_number, person_id)
values (42, 940153696);
insert into TRAINS_IN (gym_number, person_id)
values (43, 48591713);
insert into TRAINS_IN (gym_number, person_id)
values (43, 66242318);
insert into TRAINS_IN (gym_number, person_id)
values (43, 84279082);
insert into TRAINS_IN (gym_number, person_id)
values (43, 88847666);
insert into TRAINS_IN (gym_number, person_id)
values (43, 286359632);
insert into TRAINS_IN (gym_number, person_id)
values (43, 332700112);
insert into TRAINS_IN (gym_number, person_id)
values (43, 526289796);
insert into TRAINS_IN (gym_number, person_id)
values (43, 568933983);
insert into TRAINS_IN (gym_number, person_id)
values (44, 336899848);
insert into TRAINS_IN (gym_number, person_id)
values (44, 710690978);
insert into TRAINS_IN (gym_number, person_id)
values (44, 752537794);
insert into TRAINS_IN (gym_number, person_id)
values (44, 804626341);
insert into TRAINS_IN (gym_number, person_id)
values (45, 143450646);
insert into TRAINS_IN (gym_number, person_id)
values (45, 941326323);
insert into TRAINS_IN (gym_number, person_id)
values (46, 22608321);
insert into TRAINS_IN (gym_number, person_id)
values (46, 89807477);
insert into TRAINS_IN (gym_number, person_id)
values (46, 404616118);
insert into TRAINS_IN (gym_number, person_id)
values (46, 548380542);
insert into TRAINS_IN (gym_number, person_id)
values (46, 570953575);
insert into TRAINS_IN (gym_number, person_id)
values (46, 629006255);
insert into TRAINS_IN (gym_number, person_id)
values (47, 43126911);
insert into TRAINS_IN (gym_number, person_id)
values (47, 225440261);
insert into TRAINS_IN (gym_number, person_id)
values (47, 558102976);
insert into TRAINS_IN (gym_number, person_id)
values (47, 568933983);
insert into TRAINS_IN (gym_number, person_id)
values (47, 570953575);
insert into TRAINS_IN (gym_number, person_id)
values (47, 631209336);
insert into TRAINS_IN (gym_number, person_id)
values (47, 666931958);
insert into TRAINS_IN (gym_number, person_id)
values (47, 706388337);
insert into TRAINS_IN (gym_number, person_id)
values (47, 739730077);
insert into TRAINS_IN (gym_number, person_id)
values (47, 833152003);
insert into TRAINS_IN (gym_number, person_id)
values (47, 835544906);
insert into TRAINS_IN (gym_number, person_id)
values (47, 936296296);
insert into TRAINS_IN (gym_number, person_id)
values (48, 88847666);
insert into TRAINS_IN (gym_number, person_id)
values (48, 132924806);
insert into TRAINS_IN (gym_number, person_id)
values (48, 341491772);
insert into TRAINS_IN (gym_number, person_id)
values (48, 450378456);
insert into TRAINS_IN (gym_number, person_id)
values (48, 681776145);
insert into TRAINS_IN (gym_number, person_id)
values (48, 826426071);
insert into TRAINS_IN (gym_number, person_id)
values (48, 833152003);
insert into TRAINS_IN (gym_number, person_id)
values (48, 872264579);
insert into TRAINS_IN (gym_number, person_id)
values (48, 889114374);
insert into TRAINS_IN (gym_number, person_id)
values (49, 371437164);
insert into TRAINS_IN (gym_number, person_id)
values (49, 392375337);
insert into TRAINS_IN (gym_number, person_id)
values (49, 428693989);
insert into TRAINS_IN (gym_number, person_id)
values (49, 510896901);
insert into TRAINS_IN (gym_number, person_id)
values (49, 621394627);
insert into TRAINS_IN (gym_number, person_id)
values (50, 371437164);
insert into TRAINS_IN (gym_number, person_id)
values (50, 446464107);
insert into TRAINS_IN (gym_number, person_id)
values (50, 631209336);
insert into TRAINS_IN (gym_number, person_id)
values (50, 695131325);
insert into TRAINS_IN (gym_number, person_id)
values (50, 804361204);
insert into TRAINS_IN (gym_number, person_id)
values (50, 817112047);
insert into TRAINS_IN (gym_number, person_id)
values (50, 956293618);
insert into TRAINS_IN (gym_number, person_id)
values (50, 984798679);
insert into TRAINS_IN (gym_number, person_id)
values (50, 997116426);
insert into TRAINS_IN (gym_number, person_id)
values (51, 48591713);
insert into TRAINS_IN (gym_number, person_id)
values (51, 88847666);
insert into TRAINS_IN (gym_number, person_id)
values (51, 239567444);
insert into TRAINS_IN (gym_number, person_id)
values (51, 294207967);
insert into TRAINS_IN (gym_number, person_id)
values (51, 336899848);
insert into TRAINS_IN (gym_number, person_id)
values (51, 358254239);
insert into TRAINS_IN (gym_number, person_id)
values (51, 367002722);
insert into TRAINS_IN (gym_number, person_id)
values (51, 383155495);
insert into TRAINS_IN (gym_number, person_id)
values (51, 425818193);
insert into TRAINS_IN (gym_number, person_id)
values (51, 739730077);
insert into TRAINS_IN (gym_number, person_id)
values (51, 992774372);
commit;
prompt 392 records loaded
prompt Loading USED_IN...
insert into USED_IN (class_number, device_number)
values (1, 36);
insert into USED_IN (class_number, device_number)
values (1, 157);
insert into USED_IN (class_number, device_number)
values (1, 286);
insert into USED_IN (class_number, device_number)
values (1, 372);
insert into USED_IN (class_number, device_number)
values (1, 412);
insert into USED_IN (class_number, device_number)
values (2, 234);
insert into USED_IN (class_number, device_number)
values (3, 245);
insert into USED_IN (class_number, device_number)
values (9, 256);
insert into USED_IN (class_number, device_number)
values (9, 282);
insert into USED_IN (class_number, device_number)
values (10, 78);
insert into USED_IN (class_number, device_number)
values (10, 87);
insert into USED_IN (class_number, device_number)
values (10, 210);
insert into USED_IN (class_number, device_number)
values (10, 270);
insert into USED_IN (class_number, device_number)
values (10, 371);
insert into USED_IN (class_number, device_number)
values (10, 402);
insert into USED_IN (class_number, device_number)
values (12, 48);
insert into USED_IN (class_number, device_number)
values (12, 212);
insert into USED_IN (class_number, device_number)
values (12, 227);
insert into USED_IN (class_number, device_number)
values (12, 296);
insert into USED_IN (class_number, device_number)
values (16, 55);
insert into USED_IN (class_number, device_number)
values (16, 152);
insert into USED_IN (class_number, device_number)
values (16, 175);
insert into USED_IN (class_number, device_number)
values (16, 226);
insert into USED_IN (class_number, device_number)
values (16, 267);
insert into USED_IN (class_number, device_number)
values (16, 286);
insert into USED_IN (class_number, device_number)
values (16, 351);
insert into USED_IN (class_number, device_number)
values (20, 59);
insert into USED_IN (class_number, device_number)
values (20, 196);
insert into USED_IN (class_number, device_number)
values (20, 367);
insert into USED_IN (class_number, device_number)
values (22, 51);
insert into USED_IN (class_number, device_number)
values (22, 90);
insert into USED_IN (class_number, device_number)
values (22, 135);
insert into USED_IN (class_number, device_number)
values (22, 201);
insert into USED_IN (class_number, device_number)
values (22, 312);
insert into USED_IN (class_number, device_number)
values (22, 322);
insert into USED_IN (class_number, device_number)
values (22, 415);
insert into USED_IN (class_number, device_number)
values (23, 335);
insert into USED_IN (class_number, device_number)
values (25, 141);
insert into USED_IN (class_number, device_number)
values (25, 295);
insert into USED_IN (class_number, device_number)
values (25, 361);
insert into USED_IN (class_number, device_number)
values (25, 364);
insert into USED_IN (class_number, device_number)
values (27, 4);
insert into USED_IN (class_number, device_number)
values (27, 340);
insert into USED_IN (class_number, device_number)
values (27, 398);
insert into USED_IN (class_number, device_number)
values (33, 40);
insert into USED_IN (class_number, device_number)
values (33, 157);
insert into USED_IN (class_number, device_number)
values (33, 286);
insert into USED_IN (class_number, device_number)
values (34, 51);
insert into USED_IN (class_number, device_number)
values (34, 201);
insert into USED_IN (class_number, device_number)
values (34, 222);
insert into USED_IN (class_number, device_number)
values (34, 303);
insert into USED_IN (class_number, device_number)
values (34, 365);
insert into USED_IN (class_number, device_number)
values (35, 63);
insert into USED_IN (class_number, device_number)
values (35, 186);
insert into USED_IN (class_number, device_number)
values (39, 22);
insert into USED_IN (class_number, device_number)
values (39, 48);
insert into USED_IN (class_number, device_number)
values (39, 141);
insert into USED_IN (class_number, device_number)
values (39, 155);
insert into USED_IN (class_number, device_number)
values (39, 162);
insert into USED_IN (class_number, device_number)
values (39, 184);
insert into USED_IN (class_number, device_number)
values (39, 389);
insert into USED_IN (class_number, device_number)
values (39, 408);
insert into USED_IN (class_number, device_number)
values (42, 146);
insert into USED_IN (class_number, device_number)
values (42, 301);
insert into USED_IN (class_number, device_number)
values (42, 317);
insert into USED_IN (class_number, device_number)
values (44, 126);
insert into USED_IN (class_number, device_number)
values (44, 144);
insert into USED_IN (class_number, device_number)
values (44, 176);
insert into USED_IN (class_number, device_number)
values (44, 314);
insert into USED_IN (class_number, device_number)
values (44, 341);
insert into USED_IN (class_number, device_number)
values (46, 250);
insert into USED_IN (class_number, device_number)
values (46, 264);
insert into USED_IN (class_number, device_number)
values (46, 296);
insert into USED_IN (class_number, device_number)
values (46, 361);
insert into USED_IN (class_number, device_number)
values (47, 1);
insert into USED_IN (class_number, device_number)
values (47, 140);
insert into USED_IN (class_number, device_number)
values (47, 208);
insert into USED_IN (class_number, device_number)
values (47, 280);
insert into USED_IN (class_number, device_number)
values (47, 302);
insert into USED_IN (class_number, device_number)
values (47, 401);
insert into USED_IN (class_number, device_number)
values (47, 405);
insert into USED_IN (class_number, device_number)
values (49, 34);
insert into USED_IN (class_number, device_number)
values (49, 41);
insert into USED_IN (class_number, device_number)
values (49, 65);
insert into USED_IN (class_number, device_number)
values (49, 238);
insert into USED_IN (class_number, device_number)
values (51, 56);
insert into USED_IN (class_number, device_number)
values (51, 79);
insert into USED_IN (class_number, device_number)
values (51, 112);
insert into USED_IN (class_number, device_number)
values (51, 156);
insert into USED_IN (class_number, device_number)
values (51, 197);
insert into USED_IN (class_number, device_number)
values (51, 380);
insert into USED_IN (class_number, device_number)
values (58, 354);
insert into USED_IN (class_number, device_number)
values (59, 7);
insert into USED_IN (class_number, device_number)
values (59, 37);
insert into USED_IN (class_number, device_number)
values (59, 54);
insert into USED_IN (class_number, device_number)
values (59, 63);
insert into USED_IN (class_number, device_number)
values (59, 107);
insert into USED_IN (class_number, device_number)
values (59, 209);
insert into USED_IN (class_number, device_number)
values (59, 268);
insert into USED_IN (class_number, device_number)
values (59, 311);
commit;
prompt 100 records committed...
insert into USED_IN (class_number, device_number)
values (59, 355);
insert into USED_IN (class_number, device_number)
values (59, 381);
insert into USED_IN (class_number, device_number)
values (59, 387);
insert into USED_IN (class_number, device_number)
values (66, 5);
insert into USED_IN (class_number, device_number)
values (66, 95);
insert into USED_IN (class_number, device_number)
values (66, 104);
insert into USED_IN (class_number, device_number)
values (66, 161);
insert into USED_IN (class_number, device_number)
values (66, 332);
insert into USED_IN (class_number, device_number)
values (66, 360);
insert into USED_IN (class_number, device_number)
values (66, 400);
insert into USED_IN (class_number, device_number)
values (67, 109);
insert into USED_IN (class_number, device_number)
values (67, 298);
insert into USED_IN (class_number, device_number)
values (73, 62);
insert into USED_IN (class_number, device_number)
values (73, 200);
insert into USED_IN (class_number, device_number)
values (73, 214);
insert into USED_IN (class_number, device_number)
values (73, 257);
insert into USED_IN (class_number, device_number)
values (73, 279);
insert into USED_IN (class_number, device_number)
values (74, 375);
insert into USED_IN (class_number, device_number)
values (80, 10);
insert into USED_IN (class_number, device_number)
values (80, 23);
insert into USED_IN (class_number, device_number)
values (80, 61);
insert into USED_IN (class_number, device_number)
values (80, 90);
insert into USED_IN (class_number, device_number)
values (80, 156);
insert into USED_IN (class_number, device_number)
values (80, 203);
insert into USED_IN (class_number, device_number)
values (80, 249);
insert into USED_IN (class_number, device_number)
values (80, 406);
insert into USED_IN (class_number, device_number)
values (81, 6);
insert into USED_IN (class_number, device_number)
values (81, 238);
insert into USED_IN (class_number, device_number)
values (87, 95);
insert into USED_IN (class_number, device_number)
values (87, 151);
insert into USED_IN (class_number, device_number)
values (87, 259);
insert into USED_IN (class_number, device_number)
values (87, 387);
insert into USED_IN (class_number, device_number)
values (88, 105);
insert into USED_IN (class_number, device_number)
values (88, 242);
insert into USED_IN (class_number, device_number)
values (88, 324);
insert into USED_IN (class_number, device_number)
values (93, 158);
insert into USED_IN (class_number, device_number)
values (93, 185);
insert into USED_IN (class_number, device_number)
values (93, 273);
insert into USED_IN (class_number, device_number)
values (94, 60);
insert into USED_IN (class_number, device_number)
values (94, 191);
insert into USED_IN (class_number, device_number)
values (94, 222);
insert into USED_IN (class_number, device_number)
values (100, 78);
insert into USED_IN (class_number, device_number)
values (100, 87);
insert into USED_IN (class_number, device_number)
values (100, 229);
insert into USED_IN (class_number, device_number)
values (100, 266);
insert into USED_IN (class_number, device_number)
values (101, 30);
insert into USED_IN (class_number, device_number)
values (107, 125);
insert into USED_IN (class_number, device_number)
values (107, 173);
insert into USED_IN (class_number, device_number)
values (107, 224);
insert into USED_IN (class_number, device_number)
values (107, 358);
insert into USED_IN (class_number, device_number)
values (108, 35);
insert into USED_IN (class_number, device_number)
values (108, 100);
insert into USED_IN (class_number, device_number)
values (108, 126);
insert into USED_IN (class_number, device_number)
values (108, 234);
insert into USED_IN (class_number, device_number)
values (108, 257);
insert into USED_IN (class_number, device_number)
values (108, 304);
insert into USED_IN (class_number, device_number)
values (108, 411);
insert into USED_IN (class_number, device_number)
values (108, 419);
insert into USED_IN (class_number, device_number)
values (112, 98);
insert into USED_IN (class_number, device_number)
values (112, 131);
insert into USED_IN (class_number, device_number)
values (113, 103);
insert into USED_IN (class_number, device_number)
values (113, 215);
insert into USED_IN (class_number, device_number)
values (113, 244);
insert into USED_IN (class_number, device_number)
values (114, 39);
insert into USED_IN (class_number, device_number)
values (114, 109);
insert into USED_IN (class_number, device_number)
values (115, 23);
insert into USED_IN (class_number, device_number)
values (115, 49);
insert into USED_IN (class_number, device_number)
values (115, 77);
insert into USED_IN (class_number, device_number)
values (115, 286);
insert into USED_IN (class_number, device_number)
values (115, 301);
insert into USED_IN (class_number, device_number)
values (115, 350);
insert into USED_IN (class_number, device_number)
values (115, 354);
insert into USED_IN (class_number, device_number)
values (117, 38);
insert into USED_IN (class_number, device_number)
values (117, 87);
insert into USED_IN (class_number, device_number)
values (117, 174);
insert into USED_IN (class_number, device_number)
values (117, 276);
insert into USED_IN (class_number, device_number)
values (117, 323);
insert into USED_IN (class_number, device_number)
values (117, 379);
insert into USED_IN (class_number, device_number)
values (117, 388);
insert into USED_IN (class_number, device_number)
values (117, 400);
insert into USED_IN (class_number, device_number)
values (117, 404);
insert into USED_IN (class_number, device_number)
values (118, 42);
insert into USED_IN (class_number, device_number)
values (118, 182);
insert into USED_IN (class_number, device_number)
values (118, 289);
insert into USED_IN (class_number, device_number)
values (119, 33);
insert into USED_IN (class_number, device_number)
values (119, 84);
insert into USED_IN (class_number, device_number)
values (119, 152);
insert into USED_IN (class_number, device_number)
values (120, 41);
insert into USED_IN (class_number, device_number)
values (120, 82);
insert into USED_IN (class_number, device_number)
values (120, 96);
insert into USED_IN (class_number, device_number)
values (120, 201);
insert into USED_IN (class_number, device_number)
values (120, 256);
insert into USED_IN (class_number, device_number)
values (120, 297);
insert into USED_IN (class_number, device_number)
values (121, 23);
insert into USED_IN (class_number, device_number)
values (121, 50);
insert into USED_IN (class_number, device_number)
values (121, 52);
insert into USED_IN (class_number, device_number)
values (121, 111);
insert into USED_IN (class_number, device_number)
values (121, 209);
insert into USED_IN (class_number, device_number)
values (122, 140);
insert into USED_IN (class_number, device_number)
values (122, 149);
commit;
prompt 200 records committed...
insert into USED_IN (class_number, device_number)
values (122, 199);
insert into USED_IN (class_number, device_number)
values (122, 395);
insert into USED_IN (class_number, device_number)
values (123, 4);
insert into USED_IN (class_number, device_number)
values (124, 197);
insert into USED_IN (class_number, device_number)
values (124, 410);
insert into USED_IN (class_number, device_number)
values (125, 42);
insert into USED_IN (class_number, device_number)
values (125, 82);
insert into USED_IN (class_number, device_number)
values (125, 158);
insert into USED_IN (class_number, device_number)
values (125, 224);
insert into USED_IN (class_number, device_number)
values (125, 239);
insert into USED_IN (class_number, device_number)
values (125, 313);
insert into USED_IN (class_number, device_number)
values (126, 126);
insert into USED_IN (class_number, device_number)
values (126, 193);
insert into USED_IN (class_number, device_number)
values (126, 212);
insert into USED_IN (class_number, device_number)
values (127, 50);
insert into USED_IN (class_number, device_number)
values (127, 186);
insert into USED_IN (class_number, device_number)
values (127, 288);
insert into USED_IN (class_number, device_number)
values (127, 324);
insert into USED_IN (class_number, device_number)
values (127, 365);
insert into USED_IN (class_number, device_number)
values (128, 113);
insert into USED_IN (class_number, device_number)
values (128, 129);
insert into USED_IN (class_number, device_number)
values (128, 177);
insert into USED_IN (class_number, device_number)
values (128, 194);
insert into USED_IN (class_number, device_number)
values (128, 258);
insert into USED_IN (class_number, device_number)
values (128, 325);
insert into USED_IN (class_number, device_number)
values (129, 106);
insert into USED_IN (class_number, device_number)
values (129, 133);
insert into USED_IN (class_number, device_number)
values (129, 156);
insert into USED_IN (class_number, device_number)
values (130, 40);
insert into USED_IN (class_number, device_number)
values (130, 47);
insert into USED_IN (class_number, device_number)
values (130, 138);
insert into USED_IN (class_number, device_number)
values (130, 338);
insert into USED_IN (class_number, device_number)
values (131, 56);
insert into USED_IN (class_number, device_number)
values (131, 137);
insert into USED_IN (class_number, device_number)
values (131, 154);
insert into USED_IN (class_number, device_number)
values (131, 162);
insert into USED_IN (class_number, device_number)
values (131, 260);
insert into USED_IN (class_number, device_number)
values (132, 28);
insert into USED_IN (class_number, device_number)
values (132, 101);
insert into USED_IN (class_number, device_number)
values (132, 109);
insert into USED_IN (class_number, device_number)
values (132, 153);
insert into USED_IN (class_number, device_number)
values (132, 269);
insert into USED_IN (class_number, device_number)
values (133, 189);
insert into USED_IN (class_number, device_number)
values (133, 268);
insert into USED_IN (class_number, device_number)
values (133, 270);
insert into USED_IN (class_number, device_number)
values (133, 296);
insert into USED_IN (class_number, device_number)
values (133, 311);
insert into USED_IN (class_number, device_number)
values (133, 399);
insert into USED_IN (class_number, device_number)
values (135, 236);
insert into USED_IN (class_number, device_number)
values (135, 250);
insert into USED_IN (class_number, device_number)
values (135, 334);
insert into USED_IN (class_number, device_number)
values (136, 41);
insert into USED_IN (class_number, device_number)
values (136, 76);
insert into USED_IN (class_number, device_number)
values (136, 80);
insert into USED_IN (class_number, device_number)
values (136, 98);
insert into USED_IN (class_number, device_number)
values (136, 112);
insert into USED_IN (class_number, device_number)
values (137, 246);
insert into USED_IN (class_number, device_number)
values (137, 303);
insert into USED_IN (class_number, device_number)
values (138, 93);
insert into USED_IN (class_number, device_number)
values (139, 211);
insert into USED_IN (class_number, device_number)
values (139, 346);
insert into USED_IN (class_number, device_number)
values (139, 370);
insert into USED_IN (class_number, device_number)
values (139, 402);
insert into USED_IN (class_number, device_number)
values (140, 171);
insert into USED_IN (class_number, device_number)
values (140, 270);
insert into USED_IN (class_number, device_number)
values (140, 283);
insert into USED_IN (class_number, device_number)
values (141, 16);
insert into USED_IN (class_number, device_number)
values (141, 58);
insert into USED_IN (class_number, device_number)
values (141, 284);
insert into USED_IN (class_number, device_number)
values (141, 306);
insert into USED_IN (class_number, device_number)
values (141, 333);
insert into USED_IN (class_number, device_number)
values (141, 398);
insert into USED_IN (class_number, device_number)
values (142, 60);
insert into USED_IN (class_number, device_number)
values (142, 144);
insert into USED_IN (class_number, device_number)
values (142, 328);
insert into USED_IN (class_number, device_number)
values (142, 417);
insert into USED_IN (class_number, device_number)
values (143, 44);
insert into USED_IN (class_number, device_number)
values (143, 78);
insert into USED_IN (class_number, device_number)
values (143, 182);
insert into USED_IN (class_number, device_number)
values (143, 331);
insert into USED_IN (class_number, device_number)
values (144, 132);
insert into USED_IN (class_number, device_number)
values (144, 136);
insert into USED_IN (class_number, device_number)
values (144, 203);
insert into USED_IN (class_number, device_number)
values (144, 240);
insert into USED_IN (class_number, device_number)
values (144, 273);
insert into USED_IN (class_number, device_number)
values (144, 369);
insert into USED_IN (class_number, device_number)
values (144, 420);
insert into USED_IN (class_number, device_number)
values (145, 47);
insert into USED_IN (class_number, device_number)
values (145, 208);
insert into USED_IN (class_number, device_number)
values (145, 401);
insert into USED_IN (class_number, device_number)
values (146, 123);
insert into USED_IN (class_number, device_number)
values (146, 241);
insert into USED_IN (class_number, device_number)
values (146, 251);
insert into USED_IN (class_number, device_number)
values (146, 305);
insert into USED_IN (class_number, device_number)
values (147, 47);
insert into USED_IN (class_number, device_number)
values (147, 94);
insert into USED_IN (class_number, device_number)
values (147, 98);
insert into USED_IN (class_number, device_number)
values (147, 249);
insert into USED_IN (class_number, device_number)
values (147, 260);
insert into USED_IN (class_number, device_number)
values (147, 344);
commit;
prompt 300 records committed...
insert into USED_IN (class_number, device_number)
values (147, 386);
insert into USED_IN (class_number, device_number)
values (147, 389);
insert into USED_IN (class_number, device_number)
values (148, 57);
insert into USED_IN (class_number, device_number)
values (148, 231);
insert into USED_IN (class_number, device_number)
values (148, 323);
insert into USED_IN (class_number, device_number)
values (149, 107);
insert into USED_IN (class_number, device_number)
values (149, 152);
insert into USED_IN (class_number, device_number)
values (149, 279);
insert into USED_IN (class_number, device_number)
values (149, 411);
insert into USED_IN (class_number, device_number)
values (150, 108);
insert into USED_IN (class_number, device_number)
values (150, 122);
insert into USED_IN (class_number, device_number)
values (150, 127);
insert into USED_IN (class_number, device_number)
values (151, 87);
insert into USED_IN (class_number, device_number)
values (151, 314);
insert into USED_IN (class_number, device_number)
values (151, 324);
insert into USED_IN (class_number, device_number)
values (151, 354);
insert into USED_IN (class_number, device_number)
values (152, 23);
insert into USED_IN (class_number, device_number)
values (152, 43);
insert into USED_IN (class_number, device_number)
values (152, 190);
insert into USED_IN (class_number, device_number)
values (152, 272);
insert into USED_IN (class_number, device_number)
values (152, 276);
insert into USED_IN (class_number, device_number)
values (152, 289);
insert into USED_IN (class_number, device_number)
values (152, 419);
insert into USED_IN (class_number, device_number)
values (153, 5);
insert into USED_IN (class_number, device_number)
values (153, 126);
insert into USED_IN (class_number, device_number)
values (153, 341);
insert into USED_IN (class_number, device_number)
values (154, 55);
insert into USED_IN (class_number, device_number)
values (154, 134);
insert into USED_IN (class_number, device_number)
values (154, 328);
insert into USED_IN (class_number, device_number)
values (155, 136);
insert into USED_IN (class_number, device_number)
values (155, 270);
insert into USED_IN (class_number, device_number)
values (155, 305);
insert into USED_IN (class_number, device_number)
values (155, 397);
insert into USED_IN (class_number, device_number)
values (156, 215);
insert into USED_IN (class_number, device_number)
values (156, 285);
insert into USED_IN (class_number, device_number)
values (156, 357);
insert into USED_IN (class_number, device_number)
values (156, 404);
insert into USED_IN (class_number, device_number)
values (157, 69);
insert into USED_IN (class_number, device_number)
values (157, 175);
insert into USED_IN (class_number, device_number)
values (157, 368);
insert into USED_IN (class_number, device_number)
values (158, 140);
insert into USED_IN (class_number, device_number)
values (158, 338);
insert into USED_IN (class_number, device_number)
values (158, 366);
insert into USED_IN (class_number, device_number)
values (158, 370);
insert into USED_IN (class_number, device_number)
values (158, 380);
insert into USED_IN (class_number, device_number)
values (158, 407);
insert into USED_IN (class_number, device_number)
values (159, 100);
insert into USED_IN (class_number, device_number)
values (159, 332);
insert into USED_IN (class_number, device_number)
values (160, 57);
insert into USED_IN (class_number, device_number)
values (160, 112);
insert into USED_IN (class_number, device_number)
values (160, 120);
insert into USED_IN (class_number, device_number)
values (160, 184);
insert into USED_IN (class_number, device_number)
values (160, 218);
insert into USED_IN (class_number, device_number)
values (160, 328);
insert into USED_IN (class_number, device_number)
values (161, 18);
insert into USED_IN (class_number, device_number)
values (161, 44);
insert into USED_IN (class_number, device_number)
values (162, 4);
insert into USED_IN (class_number, device_number)
values (162, 26);
insert into USED_IN (class_number, device_number)
values (162, 271);
insert into USED_IN (class_number, device_number)
values (162, 389);
insert into USED_IN (class_number, device_number)
values (163, 37);
insert into USED_IN (class_number, device_number)
values (163, 107);
insert into USED_IN (class_number, device_number)
values (163, 283);
insert into USED_IN (class_number, device_number)
values (163, 382);
insert into USED_IN (class_number, device_number)
values (164, 55);
insert into USED_IN (class_number, device_number)
values (164, 122);
insert into USED_IN (class_number, device_number)
values (164, 301);
insert into USED_IN (class_number, device_number)
values (164, 318);
insert into USED_IN (class_number, device_number)
values (164, 385);
insert into USED_IN (class_number, device_number)
values (164, 386);
insert into USED_IN (class_number, device_number)
values (165, 45);
insert into USED_IN (class_number, device_number)
values (165, 52);
insert into USED_IN (class_number, device_number)
values (165, 105);
insert into USED_IN (class_number, device_number)
values (165, 161);
insert into USED_IN (class_number, device_number)
values (165, 165);
insert into USED_IN (class_number, device_number)
values (165, 211);
insert into USED_IN (class_number, device_number)
values (165, 221);
insert into USED_IN (class_number, device_number)
values (165, 384);
insert into USED_IN (class_number, device_number)
values (166, 48);
insert into USED_IN (class_number, device_number)
values (166, 59);
insert into USED_IN (class_number, device_number)
values (166, 142);
insert into USED_IN (class_number, device_number)
values (167, 53);
insert into USED_IN (class_number, device_number)
values (167, 160);
insert into USED_IN (class_number, device_number)
values (167, 181);
insert into USED_IN (class_number, device_number)
values (167, 237);
insert into USED_IN (class_number, device_number)
values (167, 286);
insert into USED_IN (class_number, device_number)
values (167, 400);
insert into USED_IN (class_number, device_number)
values (168, 39);
insert into USED_IN (class_number, device_number)
values (168, 48);
insert into USED_IN (class_number, device_number)
values (168, 130);
insert into USED_IN (class_number, device_number)
values (168, 167);
insert into USED_IN (class_number, device_number)
values (168, 243);
insert into USED_IN (class_number, device_number)
values (169, 6);
insert into USED_IN (class_number, device_number)
values (169, 64);
insert into USED_IN (class_number, device_number)
values (169, 176);
insert into USED_IN (class_number, device_number)
values (169, 294);
insert into USED_IN (class_number, device_number)
values (169, 362);
insert into USED_IN (class_number, device_number)
values (170, 25);
insert into USED_IN (class_number, device_number)
values (170, 81);
insert into USED_IN (class_number, device_number)
values (170, 121);
commit;
prompt 400 records committed...
insert into USED_IN (class_number, device_number)
values (170, 138);
insert into USED_IN (class_number, device_number)
values (170, 209);
insert into USED_IN (class_number, device_number)
values (170, 314);
insert into USED_IN (class_number, device_number)
values (170, 317);
insert into USED_IN (class_number, device_number)
values (171, 60);
insert into USED_IN (class_number, device_number)
values (171, 202);
insert into USED_IN (class_number, device_number)
values (171, 271);
insert into USED_IN (class_number, device_number)
values (171, 393);
insert into USED_IN (class_number, device_number)
values (171, 400);
insert into USED_IN (class_number, device_number)
values (172, 204);
insert into USED_IN (class_number, device_number)
values (172, 275);
insert into USED_IN (class_number, device_number)
values (172, 298);
insert into USED_IN (class_number, device_number)
values (172, 385);
insert into USED_IN (class_number, device_number)
values (173, 338);
insert into USED_IN (class_number, device_number)
values (174, 37);
insert into USED_IN (class_number, device_number)
values (174, 109);
insert into USED_IN (class_number, device_number)
values (174, 327);
insert into USED_IN (class_number, device_number)
values (175, 115);
insert into USED_IN (class_number, device_number)
values (175, 154);
insert into USED_IN (class_number, device_number)
values (175, 158);
insert into USED_IN (class_number, device_number)
values (175, 248);
insert into USED_IN (class_number, device_number)
values (175, 257);
insert into USED_IN (class_number, device_number)
values (175, 411);
insert into USED_IN (class_number, device_number)
values (176, 199);
insert into USED_IN (class_number, device_number)
values (176, 255);
insert into USED_IN (class_number, device_number)
values (176, 259);
insert into USED_IN (class_number, device_number)
values (176, 276);
insert into USED_IN (class_number, device_number)
values (176, 332);
insert into USED_IN (class_number, device_number)
values (176, 343);
insert into USED_IN (class_number, device_number)
values (177, 103);
insert into USED_IN (class_number, device_number)
values (177, 109);
insert into USED_IN (class_number, device_number)
values (177, 281);
insert into USED_IN (class_number, device_number)
values (177, 356);
insert into USED_IN (class_number, device_number)
values (178, 116);
insert into USED_IN (class_number, device_number)
values (178, 129);
insert into USED_IN (class_number, device_number)
values (178, 343);
insert into USED_IN (class_number, device_number)
values (178, 369);
insert into USED_IN (class_number, device_number)
values (178, 409);
insert into USED_IN (class_number, device_number)
values (179, 293);
insert into USED_IN (class_number, device_number)
values (179, 299);
insert into USED_IN (class_number, device_number)
values (180, 71);
insert into USED_IN (class_number, device_number)
values (180, 131);
insert into USED_IN (class_number, device_number)
values (180, 164);
insert into USED_IN (class_number, device_number)
values (180, 210);
insert into USED_IN (class_number, device_number)
values (180, 260);
insert into USED_IN (class_number, device_number)
values (180, 262);
insert into USED_IN (class_number, device_number)
values (180, 270);
insert into USED_IN (class_number, device_number)
values (181, 156);
insert into USED_IN (class_number, device_number)
values (181, 208);
insert into USED_IN (class_number, device_number)
values (181, 212);
insert into USED_IN (class_number, device_number)
values (181, 397);
insert into USED_IN (class_number, device_number)
values (182, 41);
insert into USED_IN (class_number, device_number)
values (182, 150);
insert into USED_IN (class_number, device_number)
values (182, 324);
insert into USED_IN (class_number, device_number)
values (182, 326);
insert into USED_IN (class_number, device_number)
values (182, 394);
insert into USED_IN (class_number, device_number)
values (183, 60);
insert into USED_IN (class_number, device_number)
values (183, 214);
insert into USED_IN (class_number, device_number)
values (183, 258);
insert into USED_IN (class_number, device_number)
values (183, 274);
insert into USED_IN (class_number, device_number)
values (183, 285);
insert into USED_IN (class_number, device_number)
values (183, 292);
insert into USED_IN (class_number, device_number)
values (184, 152);
insert into USED_IN (class_number, device_number)
values (184, 242);
insert into USED_IN (class_number, device_number)
values (185, 169);
insert into USED_IN (class_number, device_number)
values (185, 299);
insert into USED_IN (class_number, device_number)
values (185, 317);
insert into USED_IN (class_number, device_number)
values (185, 368);
insert into USED_IN (class_number, device_number)
values (186, 55);
insert into USED_IN (class_number, device_number)
values (186, 58);
insert into USED_IN (class_number, device_number)
values (186, 96);
insert into USED_IN (class_number, device_number)
values (186, 135);
insert into USED_IN (class_number, device_number)
values (186, 166);
insert into USED_IN (class_number, device_number)
values (186, 292);
insert into USED_IN (class_number, device_number)
values (186, 322);
insert into USED_IN (class_number, device_number)
values (186, 361);
insert into USED_IN (class_number, device_number)
values (187, 9);
insert into USED_IN (class_number, device_number)
values (187, 70);
insert into USED_IN (class_number, device_number)
values (187, 234);
insert into USED_IN (class_number, device_number)
values (187, 295);
insert into USED_IN (class_number, device_number)
values (188, 20);
insert into USED_IN (class_number, device_number)
values (188, 25);
insert into USED_IN (class_number, device_number)
values (188, 64);
insert into USED_IN (class_number, device_number)
values (188, 228);
insert into USED_IN (class_number, device_number)
values (189, 76);
insert into USED_IN (class_number, device_number)
values (189, 103);
insert into USED_IN (class_number, device_number)
values (189, 288);
insert into USED_IN (class_number, device_number)
values (189, 330);
insert into USED_IN (class_number, device_number)
values (190, 140);
insert into USED_IN (class_number, device_number)
values (190, 350);
insert into USED_IN (class_number, device_number)
values (191, 4);
insert into USED_IN (class_number, device_number)
values (191, 17);
insert into USED_IN (class_number, device_number)
values (191, 82);
insert into USED_IN (class_number, device_number)
values (191, 103);
insert into USED_IN (class_number, device_number)
values (191, 110);
insert into USED_IN (class_number, device_number)
values (191, 307);
insert into USED_IN (class_number, device_number)
values (191, 365);
commit;
prompt 497 records loaded
prompt Enabling foreign key constraints for COACH...
alter table COACH enable constraint SYS_C007226;
prompt Enabling foreign key constraints for HALL...
alter table HALL enable constraint SYS_C007251;
prompt Enabling foreign key constraints for CLASS_LESSON...
alter table CLASS_LESSON enable constraint SYS_C007264;
alter table CLASS_LESSON enable constraint SYS_C007265;
prompt Enabling foreign key constraints for DEVICE...
alter table DEVICE enable constraint SYS_C007272;
prompt Enabling foreign key constraints for TRAINEE...
alter table TRAINEE enable constraint SYS_C007235;
prompt Enabling foreign key constraints for TAKES...
alter table TAKES enable constraint SYS_C007281;
alter table TAKES enable constraint SYS_C007282;
prompt Enabling foreign key constraints for TRAINS_IN...
alter table TRAINS_IN enable constraint SYS_C007244;
alter table TRAINS_IN enable constraint SYS_C007245;
prompt Enabling foreign key constraints for USED_IN...
alter table USED_IN enable constraint SYS_C007276;
alter table USED_IN enable constraint SYS_C007277;
prompt Enabling triggers for PERSON...
alter table PERSON enable all triggers;
prompt Enabling triggers for COACH...
alter table COACH enable all triggers;
prompt Enabling triggers for GYM...
alter table GYM enable all triggers;
prompt Enabling triggers for HALL...
alter table HALL enable all triggers;
prompt Enabling triggers for CLASS_LESSON...
alter table CLASS_LESSON enable all triggers;
prompt Enabling triggers for DEVICE...
alter table DEVICE enable all triggers;
prompt Enabling triggers for TRAINEE...
alter table TRAINEE enable all triggers;
prompt Enabling triggers for TAKES...
alter table TAKES enable all triggers;
prompt Enabling triggers for TRAINS_IN...
alter table TRAINS_IN enable all triggers;
prompt Enabling triggers for USED_IN...
alter table USED_IN enable all triggers;
set feedback on
set define on
prompt Done.
