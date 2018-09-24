
insert into teacher
(name, email, phone, address1, createdOn, isActive, createdBy_id)

select concat(last_name,', ', last_name) as name,
email,
phone,
bargaining_unit as address1,
update_ts as createdOn,
enabled as isActive,
1 as createdBy_id

from eddyod.se5aug2010 
where first_name is not null and last_name is not null
order by rand()
limit 33;
