import os, sys
import django.core.handlers.wsgi
from django.core.wsgi import get_wsgi_application
sys.path.append('/home/httpd/rester')
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "rester.settings")
application = get_wsgi_application()
