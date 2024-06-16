-- Query 1 --
select g.speciality, count(g.person_id) as NumOfPeople, avg(t.age) as avrageAge
from coach g
join trainee t on g.person_id = t.person_id
join person p on g.person_id = p.person_id
where p.gender = 'Female'
group by speciality



-- Query 2 --
select c.class_name, o.full_name as coach_name, c.hall_number ,gy.gym_name, c.start_date
from class_lesson c 
join hall h on c.hall_number = h.hall_number 
            and c.gym_number = h.gym_number
join (select p.person_id, p.full_name
     from person p
     join coach co on p.person_id = co.person_id) o on o.person_id = c.person_id
join gym gy on gy.gym_number = c.gym_number
where h.capacity > c.capacity
order by c.start_date ,c.class_name



-- Query 3 --
select count(de.device_number) as not_in_use, de.device_model
from device de 
where de.device_number not in (select ui.device_number 
                              from used_in ui join class_lesson a on a.class_number = ui.class_number
                              where a.gym_number in (select b.gym_number
                                                     from class_lesson b join gym gy on gy.gym_number = b.gym_number
                                                    where gy.gym_name != 'Elite Gym'
                                                    and b.finish_date > sysdate))
group by de.device_model



-- Query 4 --
select p.person_id,p.full_name
from person p 
where exists (select tk.person_id
             from takes tk 
             join class_lesson cl on cl.class_number = tk.class_number
             where cl.class_name =' Pilates' and p.person_id = tk.person_id)
intersect
             select p.person_id,p.full_name
             from person p 
             where not exists (select cl.class_number
                               from takes tk 
                               join class_lesson cl on cl.class_number = tk.class_number
                                where cl.class_name !=' Pilates' and p.person_id = tk.person_id)
                                
                                
                                
-- Delete Query 1 --
delete 
from (select tk.person_id, tk.class_number
     from takes tk
      join trainee tr on tk.person_id = tr.person_id
     join class_lesson cl on tk.class_number = cl.class_number
     where tr.health = 'Chronic Respiratory Conditions' or tr.health = 'Heart Disease'
     and cl.class_name = ' Dance Cardio') o


     
-- Delete Query 2 --
delete
from class_lesson cl
where exists (select g.gym_number, g.gym_name
              from gym g
              join hall h on h.gym_number = g.gym_number
              where h.capacity < cl.capacity
              and  cl.gym_number = g.gym_number)
and extract(month from cl.finish_date) <= extract(month from sysdate)



insert into CLASS_LESSON (start_date, capacity, terms, class_name, class_number, finish_date, class_day, class_hour, person_id, hall_number, gym_number)
values (to_date('22-01-2024', 'dd-mm-yyyy'),200, 'Age: 15-18 Gender: male Fitness Level: Intermediate Medical Conditions: no asthma', 
'Body Sculpt', 195, to_date('22-06-2024', 'dd-mm-yyyy'), 'Thursday', '11:00', 328828217, 6, 35);


-- Update Query 1 --
update coach
set salary = salary + 1500
where person_id in (select cl.person_id
                    from class_lesson cl
                    group by cl.person_id 
                    having count(cl.class_number)>= 10)



-- Update Query 2 --
update class_lesson cl
set finish_date = TRUNC(SYSDATE)
where exists (SELECT o.number_part
              from (SELECT TO_NUMBER(REGEXP_SUBSTR(co.experience, '\d+')) AS number_part,co.person_id
                   from coach co) o
              where  o.number_part > 20 and o.person_id = cl.person_id)

















