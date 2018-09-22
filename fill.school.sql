
insert into contacts_contact
(first_name, last_name, email, phone, address, description, createdOn, isActive, account_id, createdBy_id)
select first_name, 
last_name,
email,
phone,
bargaining_unit as address,
middle_name as description,
update_ts as createdOn,
enabled as isActive,
2 as account_id,
1 as createdBy_id

from eddyod.se5aug2010 limit 666;
