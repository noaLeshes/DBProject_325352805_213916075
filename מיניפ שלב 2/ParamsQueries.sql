-- Query 1 --
select * 
from class_lesson c
join (select g.gym_number, g.gym_name
      from gym g) o on o.gym_number = c.gym_number
where o.gym_name = (&<name=gymname list= "select distinct gy.gym_name from gym gy order by gy.gym_name " required=true type=string > )
and c.start_date between &<name = from_date type = date> and &<name = to_date type = date> 

select * from class_lesson



-- Query 2 --
select cl.class_number,cl.class_name,t.device_model, t.device_number
from class_lesson cl
join ( select u.class_number, d.device_model, d.device_number
     from device d
     join used_in u on d.device_number = u.device_number) t on cl.class_number = t.class_number
where cl.class_number = &<name=class_number hint = "number between 1-150"  required=true type=integer > 





-- Query 3 --
select c.class_day, p.full_name, p.person_id, c.class_name, c.class_number
from person p
join class_lesson c on p.person_id = c.person_id
where c.class_day in (&<name= class_day list= "' Sunday', ' Monday', ' Tuesday', ' Wednesday', ' Thursday', ' Friday'" required=true multiselect="true">)
order by c.class_day &<name="dec order" checkbox="asc,desc">




-- Query 4 --
&<name = "choose_coulmn" list = "tr.subscription,tr.training_plan,tr.health,tr.payment_details,tr.age,tr.joining_date,tr.person_id
,pr.full_name,pr.phone,pr.email,pr.address" 
prefix = "select " suffix = " from person pr join trainee tr on pr.person_id = tr.person_id "
required=true multiselect="true">
&<name = "agelimit" prefix = " where tr.age> " required=true hint = "choose between 14-99" >
















