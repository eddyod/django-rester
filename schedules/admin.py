from django.contrib import admin

from .models import Schedule
from locations.models import Location
from employees.models import Employee


class ScheduleAdmin(admin.ModelAdmin):
    list_display = ('id', 'start', 'end', 'location_id', 'pay_rate','created_id','created')
    fields = ['start', 'end', 'location', 'user','pay_rate','created_id',]
    search_fields = (Location,Employee,'start')
    ordering = ['-start']
    
admin.site.register(Schedule, ScheduleAdmin)
                


