drop view if exists attendance;

create view attendance as
SELECT 
s.id as id, si.id as site_id, e.id as employee_id,e.name as employee, 
MONTH(s.start) as class_month,
YEAR(s.start) as class_year,
SUM(CASE WHEN s.completed = 1 THEN 1 ELSE 0 END) AS showed_up,
SUM(CASE WHEN s.completed = 0 THEN 1 ELSE 0 END) AS no_show,

SUM(CASE WHEN s.completed = 1 THEN 1 ELSE 0 END) * s.pay_rate AS monthly_pay


FROM schedule s
INNER JOIN employee e on s.employee_id = e.id
INNER JOIN site si ON e.site_id = si.id
GROUP BY si.id, e.id, e.name, class_month, class_year
ORDER BY class_year, class_month, e.name
