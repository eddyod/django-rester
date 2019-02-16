from django.db import models
from sites.models import Site

class Location(models.Model):
    id = models.BigAutoField(primary_key=True)
    site = models.ForeignKey(Site, on_delete=models.CASCADE, blank=False, null=False)
    name = models.CharField(max_length=255, blank=False, null=False, default='Name of location')
    email = models.EmailField()
    phone = models.CharField(max_length=20)
    address1 = models.CharField(max_length=50, blank=False, null=False)
    address2 = models.CharField(max_length=50, null=True, blank=True)
    city = models.CharField(max_length=50, null=True, blank=True)
    postal_code = models.CharField(max_length=50, null=True, blank=True)
    province = models.CharField(max_length=50, null=True, blank=True)
    country = models.CharField(max_length=50, null=True, blank=True)
    latitude = models.DecimalField(max_digits=9, decimal_places=4, null=True, blank=True)
    longitude = models.DecimalField(max_digits=9, decimal_places=4, null=True, blank=True)
    description = models.TextField(null=True, blank=True)
    created = models.DateTimeField("Created on", auto_now_add=True)
    updated = models.DateTimeField("Updated on", auto_now_add=True)
    active = models.BooleanField(default=True)

    class Meta:
        db_table = u'location'
        verbose_name = 'Location'
        verbose_name_plural = 'Locations'
        ordering = ['name']

    def __str__(self):
        return self.name
