from django.db import models
from django.contrib.auth.models import AbstractUser
from django.db.models.signals import post_save
from django.dispatch import receiver

from sites.models import Site

class User(AbstractUser):
    id = models.BigAutoField(primary_key=True)
    site = models.ForeignKey(Site, on_delete=models.SET_NULL, blank=True, null=True)
    #company = models.IntegerField(db_column='site_id', null=True)
    class Meta:
        db_table = u'auth_user'
        verbose_name = 'User'
        verbose_name_plural = 'Users'


@receiver(post_save, sender=Site)
def update_user(sender, instance, created, **kwargs):
    if created:
        #user = User.objects.get(id=instance.owner)
        #User.objects.update(site=instance)
        User.objects.filter(id=instance.owner).update(site=instance)
