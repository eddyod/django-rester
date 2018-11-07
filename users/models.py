from django.db import models
from django.contrib.auth.models import User
from django.contrib.auth.models import AbstractUser

class User(AbstractUser):
    phone = models.CharField(max_length=20, null=True, blank=True)
    address1 = models.CharField(max_length=50, null=True, blank=True)
    address2 = models.CharField(max_length=50, null=True, blank=True)
    city = models.CharField(max_length=50, null=True, blank=True)
    postalCode = models.CharField(max_length=50, null=True, blank=True)
    province = models.CharField(max_length=500, null=True, blank=True)
    country = models.CharField(max_length=500, null=True, blank=True)

    class Meta:
        db_table = u'auth_user'
        verbose_name = 'User'
        verbose_name_plural = 'Users'
        ordering = ['last_name']
                                    
    def __str__(self):
        return self.last_name
