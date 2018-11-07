from django.contrib import admin

from .models import Schedule
from schools.models import School
from teachers.models import Teacher


class ScheduleAdmin(admin.ModelAdmin):
    list_display = ('id', 'start', 'end', 'school_id', 'teacher_id','pay_rate','createdBy','createdOn')
    fields = ['start', 'end', 'school', 'teacher','pay_rate','createdBy',]
    search_fields = (School,Teacher,'start')
    ordering = ['-start']
    
admin.site.register(Schedule, ScheduleAdmin)
                


