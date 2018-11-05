from django.db import models

class Attendance(models.Model):
    id = models.AutoField(primary_key=True)
    teacher = models.CharField(max_length=50)
    class_month = models.IntegerField()
    class_year = models.IntegerField()
    showed_up = models.IntegerField()
    no_show = models.IntegerField()

    class Meta:
        db_table = u'attendance'
        verbose_name = 'Attendance'
        verbose_name_plural = 'Attendance'


