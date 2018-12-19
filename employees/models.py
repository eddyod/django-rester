from django.db import models
#from django.contrib.auth.models import User
from users.models import User
from sites.models import Site

class Employee(models.Model):
    id = models.BigAutoField(primary_key=True)
    site = models.ForeignKey(Site, on_delete=models.CASCADE, blank=False, null=False)
    name = models.CharField(max_length=150)
    email = models.EmailField(null=True, blank=True)
    phone = models.CharField(max_length=20, null=True, blank=True)
    address1 = models.CharField(max_length=50, null=True, blank=True)
    address2 = models.CharField(max_length=50, null=True, blank=True)
    city = models.CharField(max_length=50, null=True, blank=True)
    postal_code = models.CharField(max_length=50, null=True, blank=True)
    province = models.CharField(max_length=50, null=True, blank=True)
    country = models.CharField(max_length=50, null=True, blank=True)
    created = models.DateTimeField("Created on", auto_now_add=True)
    updated = models.DateTimeField("Updated on", auto_now_add=True)
    active = models.BooleanField(default=True)

    user = models.OneToOneField(User,db_column='user_id', on_delete=models.CASCADE, null=True, blank=True)

    class Meta:
        db_table = u'employee'
        verbose_name = 'Employee'
        verbose_name_plural = 'Employees'
        ordering = ['name']

    def __str__(self):
        return self.name
