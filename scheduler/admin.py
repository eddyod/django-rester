from django.contrib import admin
from .models import Schedule, Employee, Location



class ScheduleAdmin(admin.ModelAdmin):
    list_display = ('id', 'start', 'end', 'location_id', 'pay_rate','created')
    fields = ['start', 'end', 'location', 'user','pay_rate',]
    search_fields = (Location, Employee, 'start')
    ordering = ['-start']

admin.site.register(Schedule, ScheduleAdmin)
