--    phone = models.CharField(max_length=20, null=True, blank=True)
--    address1 = models.CharField(max_length=50, null=True, blank=True)
--    address2 = models.CharField(max_length=50, null=True, blank=True)
--    city = models.CharField(max_length=50, null=True, blank=True)
--    postalCode = models.CharField(max_length=20, null=True, blank=True)
--    province = models.CharField(max_length=50, null=True, blank=True)
--    country = models.CharField(max_length=50, null=True, blank=True)

alter table auth_user add column phone varchar(20);
alter table auth_user add column address1 varchar(100);
alter table auth_user add column address2 varchar(20);
alter table auth_user add column city varchar(20);
alter table auth_user add column postalCode varchar(20);
alter table auth_user add column province varchar(50);
alter table auth_user add column country varchar(20);

alter table schedule change column createdOn created datetime not null;
alter table schedule change column createdBy_id created_id int not null;


alter table schedule drop foreign key schedule_teacher_id_3c8a1fec_fk_teacher_id;
alter table schedule drop column teacher_id;

alter table schedule add column user_id int not null;

alter table schedule add constraint FK_schedule_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) ON UPDATE CASCADE ON DELETE CASCADE;
