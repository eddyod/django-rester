"""
WSGI config for simplecrm project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/2.0/howto/deployment/wsgi/
"""

import os, sys
import django.core.handlers.wsgi
from django.core.wsgi import get_wsgi_application
sys.path.append('/home/httpd/rester')

from django.core.wsgi import get_wsgi_application

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "rester.settings")

application = get_wsgi_application()
