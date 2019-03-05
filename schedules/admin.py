from django.contrib import admin
from .models import Schedule


class ScheduleAdmin(admin.ModelAdmin):
    list_display = ('employee', 'location', 'site', 'start', 'end', 'pay_rate', 'created')
    fields = ['employee', 'location', 'site', 'start', 'end', 'pay_rate']
    search_fields = ('employee', 'location', 'site',)
    ordering = ['start']


admin.site.register(Schedule, ScheduleAdmin)
