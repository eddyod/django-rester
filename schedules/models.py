from django.db import models
from django.contrib.auth.models import User
from schools.models import School
from teachers.models import Teacher

class Schedule(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=64)
    school = models.ForeignKey(School, related_name='classes', on_delete=models.CASCADE, blank=True, null=False)
    teacher = models.ForeignKey(Teacher, related_name='teachers', on_delete=models.CASCADE, blank=True, null=False)
    startTime = models.DateTimeField(blank=False, null=False)
    endTime = models.DateTimeField(blank=False, null=False)
    
    description = models.TextField(blank=True, null=True)
    createdBy = models.ForeignKey(User, related_name='schedule_created_by', on_delete=models.CASCADE)
    createdOn = models.DateTimeField("Created on", auto_now_add=True)
    isActive = models.BooleanField(default=False)

    class Meta:
        db_table = u'schedule'
        verbose_name = 'Schedule'
        verbose_name_plural = 'Schedules'
        
    def __str__(self):
        return self.name

