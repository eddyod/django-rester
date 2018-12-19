from django.db import models

from sites.models import Site
from locations.models import Location
from employees.models import Employee

class Schedule(models.Model):
    id = models.BigAutoField(primary_key=True)
    site = models.ForeignKey(Site, on_delete=models.CASCADE, blank=False, null=False)
    location = models.ForeignKey(Location, related_name='locations', on_delete=models.CASCADE, blank=True, null=False)
    employee = models.ForeignKey(Employee, related_name='employees', on_delete=models.CASCADE, blank=True, null=False)
    start = models.DateTimeField(blank=False, null=False)
    end = models.DateTimeField(blank=False, null=False)
    pay_rate = models.DecimalField(max_digits=20, decimal_places=2)
    created = models.DateTimeField("Created on", auto_now_add=True)
    updated = models.DateTimeField("Updated on", auto_now_add=True)
    completed = models.BooleanField(default=True)

    class Meta:
        db_table = u'schedule'
        verbose_name = 'Schedule'
        verbose_name_plural = 'Schedules'
        
class Attendance(models.Model):
    id = models.AutoField(primary_key=True)
    site_id = models.IntegerField()
    employee = models.CharField(max_length=50)
    class_month = models.IntegerField()
    class_year = models.IntegerField()
    showed_up = models.IntegerField()
    no_show = models.IntegerField()

    class Meta:
        db_table = u'attendance'
        verbose_name = 'Attendance'
        verbose_name_plural = 'Attendance'
        managed = False
