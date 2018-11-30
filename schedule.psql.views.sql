drop view if exists attendance;

create view attendance as
SELECT 
row_number() OVER () AS id, si.id as site_id, e.id as employee_id,e.name as employee, 
date_part('month', s.start) as class_month,
date_part('year', s.start) as class_year,
SUM(CASE WHEN s.completed = true THEN 1 ELSE 0 END) AS showed_up,
SUM(CASE WHEN s.completed = false THEN 1 ELSE 0 END) AS no_show,

SUM(CASE WHEN s.completed = true THEN 1 ELSE 0 END) * s.pay_rate AS monthly_pay


FROM schedule s
INNER JOIN employee e on s.employee_id = e.id
INNER JOIN site si ON e.site_id = si.id
GROUP BY si.id, e.id, e.name, class_month, class_year, s.pay_rate
ORDER BY class_year, class_month, e.name
