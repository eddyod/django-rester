from django.db import models
#from django.contrib.auth.models import User
from users.models import User
from schools.models import School
from teachers.models import Teacher

class Schedule(models.Model):
    id = models.AutoField(primary_key=True)
    school = models.ForeignKey(School, related_name='schools', on_delete=models.CASCADE, blank=True, null=False)
    teacher = models.ForeignKey(Teacher, related_name='teachers', on_delete=models.CASCADE, blank=True, null=False)
    start = models.DateTimeField(blank=False, null=False)
    end = models.DateTimeField(blank=False, null=False)    
    pay_rate = models.DecimalField(max_digits=20, decimal_places=2)
    createdBy = models.ForeignKey(User, related_name='schedule_created_by', on_delete=models.CASCADE)
    createdOn = models.DateTimeField("Created on", auto_now_add=True)
    completed = models.BooleanField(default=True)

    class Meta:
        db_table = u'schedule'
        verbose_name = 'Schedule'
        verbose_name_plural = 'Schedules'
        
    #def __str__(self):
    #    return self.start


