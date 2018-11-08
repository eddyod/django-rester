from django.db import models
from django.contrib.auth.models import User
from employees.models import Employee
from locations.models import Location

class Schedule(models.Model):
    id = models.AutoField(primary_key=True)
    location = models.ForeignKey(Location, related_name='locations', on_delete=models.CASCADE, blank=True, null=False)
    employee = models.ForeignKey(Employee, related_name='employees', on_delete=models.CASCADE, blank=True, null=False)
    start = models.DateTimeField(blank=False, null=False)
    end = models.DateTimeField(blank=False, null=False)    
    pay_rate = models.DecimalField(max_digits=20, decimal_places=2)
    created_id = models.ForeignKey(User, db_column='created_id', related_name='schedule_created_by', on_delete=models.CASCADE)
    created = models.DateTimeField("Created on", auto_now_add=True)
    completed = models.BooleanField(default=True)

    class Meta:
        db_table = u'schedule'
        verbose_name = 'Schedule'
        verbose_name_plural = 'Schedules'
        
    #def __str__(self):
    #    return self.start


