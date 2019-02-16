from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver
import random, string


class Site(models.Model):
    id = models.AutoField(primary_key=True)
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
    active = models.BooleanField(default=True)


    class Meta:
        db_table = u'site'
        verbose_name = 'Site'
        verbose_name_plural = 'Sites'
        ordering = ['name']

    def __str__(self):
        return self.name

class Employee(models.Model):
    id = models.AutoField(primary_key=True)
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

    user = models.OneToOneField(User,db_column='user_id', on_delete=models.CASCADE)

    class Meta:
        db_table = u'employee'
        verbose_name = 'Employee'
        verbose_name_plural = 'Employees'
        ordering = ['name']

    def __str__(self):
        return self.name


@receiver(post_save, sender=Employee)
def create_user_employee(sender, instance, created, **kwargs):
    if created:
        password =  ''.join(random.sample(string.ascii_lowercase, 8))
        user = User.objects.create_user(employee=instance, password=password, username = instance.email, email=instance.email, is_staff=1)
        instance.user_id = user.id
        instance.save()

@receiver(post_save, sender=Employee)
def save_user_employee(sender, instance, **kwargs):
    instance.user.save()

class Location(models.Model):
    id = models.AutoField(primary_key=True)
    site = models.ForeignKey(Site, on_delete=models.CASCADE, blank=False, null=False)
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
    created = models.DateTimeField("Created on", auto_now_add=True)
    active = models.BooleanField(default=True)

    class Meta:
        db_table = u'location'
        verbose_name = 'Location'
        verbose_name_plural = 'Locations'
        ordering = ['name']

    def __str__(self):
        return self.name

class Schedule(models.Model):
    id = models.AutoField(primary_key=True)
    site = models.ForeignKey(Site, on_delete=models.CASCADE, blank=False, null=False)
    location = models.ForeignKey(Location, related_name='locations', on_delete=models.CASCADE, blank=True, null=False)
    employee = models.ForeignKey(Employee, related_name='employees', on_delete=models.CASCADE, blank=True, null=False)
    start = models.DateTimeField(blank=False, null=False)
    end = models.DateTimeField(blank=False, null=False)
    pay_rate = models.DecimalField(max_digits=20, decimal_places=2)
    created = models.DateTimeField("Created on", auto_now_add=True)
    completed = models.BooleanField(default=True)

    class Meta:
        db_table = u'schedule'
        verbose_name = 'Schedule'
        verbose_name_plural = 'Schedules'

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