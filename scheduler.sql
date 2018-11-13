

insert into site (owner_id,name,email,created,active ) values (1,'Fast Eddys Bar and Grill','eddyod@yahoo.com',NOW(),1);
insert into site (owner_id,name,email,created,active ) values (2,'Premier English','jason@jason.com',NOW(),1);

INSERT INTO location (name, email, phone, address1, created, active, site_id) 
VALUES ('Bloomsburg State College','buc@buc.edu','555-1212','Bloomsburg PA',NOW(),1,1);
INSERT INTO location (name, email, phone, address1, created, active, site_id) 
VALUES ('Reading Area Community College','racc@racc.edu','215-555-1212','Reading PA',NOW(),1,1);
INSERT INTO location (name, email, phone, address1, created, active, site_id) 
VALUES ('Kutztown Uni','ku@ku.edu','215-555-1212','Kutztown PA',NOW(),1,1);


INSERT INTO location (name, email, phone, address1, created, active, site_id) 
VALUES ('Beer Bar','buc@buc.edu','555-1212','Bloomsburg PA',NOW(),1,2);
INSERT INTO location (name, email, phone, address1, created, active, site_id) 
VALUES ('Marks Bar','racc@racc.edu','215-555-1212','Reading PA',NOW(),1,2);
INSERT INTO location (name, email, phone, address1, created, active, site_id) 
VALUES ('Joes Bar','ku@ku.edu','215-555-1212','Kutztown PA',NOW(),1,2);
