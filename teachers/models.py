from django.db import models
from django.contrib.auth.models import User


class Teacher(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=150)
    email = models.EmailField(null=True, blank=True)
    phone = models.CharField(max_length=20, null=True, blank=True)
    address1 = models.CharField(max_length=50, null=True, blank=True)
    address2 = models.CharField(max_length=50, null=True, blank=True)
    city = models.CharField(max_length=50, null=True, blank=True)
    postalCode = models.CharField(max_length=50, null=True, blank=True)
    province = models.CharField(max_length=500, null=True, blank=True)
    country = models.CharField(max_length=500, null=True, blank=True)
    latitude = models.DecimalField(max_digits=15, decimal_places=10, null=True)
    longitude = models.DecimalField(max_digits=15, decimal_places=10, null=True)
    description = models.TextField(0, null=True, blank=True)
    createdBy = models.ForeignKey(User, related_name='teacher_created_by', on_delete=models.CASCADE)
    createdOn = models.DateTimeField("Created on", auto_now_add=True)
    isActive = models.BooleanField(default=True)

    class Meta:
        db_table = u'teacher'
        verbose_name = 'Teacher'
        verbose_name_plural = 'Teachers'
        ordering = ['name']
                                    
    def __str__(self):
        return self.name

