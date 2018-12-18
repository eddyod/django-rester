select au.id as auth_id, au.email, s.name, s.id as site_id
from auth_user au
inner join user_site us on au.id = us.auth_id
inner join site s on us.site_id = s.id
