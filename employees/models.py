from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver

class Employee(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=150)
    #email = models.EmailField(null=True, blank=True)
    phone = models.CharField(max_length=20, null=True, blank=True)
    address1 = models.CharField(max_length=50, null=True, blank=True)
    address2 = models.CharField(max_length=50, null=True, blank=True)
    city = models.CharField(max_length=50, null=True, blank=True)
    postal_code = models.CharField(max_length=50, null=True, blank=True)
    province = models.CharField(max_length=50, null=True, blank=True)
    country = models.CharField(max_length=50, null=True, blank=True)
    created = models.DateTimeField("Created on", auto_now_add=True)
    active = models.BooleanField(default=True)
    
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
        user = User.objects.create_user(employee=instance)
        instance.user_id = user.id
        instance.save()
        
#@receiver(post_save, sender=Employee)
#def save_user_employee(sender, instance, **kwargs):
#    instance.user.save()
