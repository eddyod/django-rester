from django.db import models
from django.utils import timezone
from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.utils.translation import ugettext_lazy as _
from .UserManager import UserManager
from sites.models import Site

class User(AbstractBaseUser, PermissionsMixin):
    id = models.BigAutoField(primary_key=True)
    email = models.EmailField(_('email'), max_length=254, unique=True)
    first_name = models.CharField(_('first_name'), max_length=30, blank=True)
    last_name = models.CharField(_('last_name'), max_length=30, blank=True)
    is_staff = models.BooleanField(_('is_staff'), default=False,
            help_text=_('Designates whether the user can log into this admin site.'))
    is_active = models.BooleanField(_('is_active'), default=True,
     help_text=_('Designates whether this user should be treated as active. Unselect this instead of deleting accounts.'))
    is_superuser = models.BooleanField(_('is_superuser'), default=True,
     help_text=_('Designates whether this user should be treated as active. Unselect this instead of deleting accounts.'))
    date_joined = models.DateTimeField(_('date_joined'), default=timezone.now)
    site = models.ForeignKey(Site, on_delete=models.SET_NULL, blank=True, null=True)

    objects = UserManager()    
    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []
    
    class Meta:
        db_table = u'auth_user'
        verbose_name = 'User'
        verbose_name_plural = 'Users'
    def getFullname(self):
        '''
        Returns the first_name plus the last_name, with a space in between.
        '''
        fullName = '%s %s' % (self.first_name, self.last_name)
        return fullName.strip()

@receiver(post_save, sender=Site)
def update_user(sender, instance, created, **kwargs):
    if created:
        User.objects.filter(id=instance.owner).update(site=instance)

