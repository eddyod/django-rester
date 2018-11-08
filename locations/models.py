from django.db import models
from django.contrib.auth.models import User

class Location(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=255, blank=False, null=False, default='Name of location')
    email = models.EmailField()
    phone = models.CharField(max_length=20)
    address1 = models.CharField(max_length=50, blank=True)
    address2 = models.CharField(max_length=50, blank=True)
    city = models.CharField(max_length=50, blank=True)
    postal_code = models.CharField(max_length=50, blank=True)
    province = models.CharField(max_length=50, blank=True)
    country = models.CharField(max_length=50, blank=True)
    latitude = models.DecimalField(null=True, max_digits=9, decimal_places=4, blank=True)
    longitude = models.DecimalField(null=True, max_digits=9, decimal_places=4, blank=True)
    description = models.TextField(blank=True, null=True)
    created_id = models.ForeignKey(User, db_column='created_id', related_name='location_created_by', on_delete=models.CASCADE, default=1)
    created = models.DateTimeField("Created on", auto_now_add=True)
    active = models.BooleanField(default=True)

    class Meta:
        db_table = u'location'
        verbose_name = 'Location'
        verbose_name_plural = 'Locations'
        ordering = ['name']
                                    
    def __str__(self):
        return self.name

