from django.db import models
from users.models import User


class School(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=255, blank=False, null=False, default='Name of school')
    email = models.EmailField()
    phone = models.CharField(max_length=20)
    address1 = models.CharField(max_length=50, blank=True)
    address2 = models.CharField(max_length=50, blank=True)
    city = models.CharField(max_length=50, blank=True)
    postalCode = models.CharField(max_length=50, blank=True)
    province = models.CharField(max_length=50, blank=True)
    country = models.CharField(max_length=50, blank=True)
    latitude = models.DecimalField(null=True, max_digits=9, decimal_places=4, blank=True)
    longitude = models.DecimalField(null=True, max_digits=9, decimal_places=4, blank=True)
    description = models.TextField(blank=True, null=True)
    createdBy = models.ForeignKey(User, related_name='school_created_by', on_delete=models.CASCADE, default=1)
    createdOn = models.DateTimeField("Created on", auto_now_add=True)
    isActive = models.BooleanField(default=True)

    class Meta:
        db_table = u'school'
        verbose_name = 'School'
        verbose_name_plural = 'Schools'
        ordering = ['name']
                                    
    def __str__(self):
        return self.name

