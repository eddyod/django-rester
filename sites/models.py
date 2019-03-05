from django.db import models


class Site(models.Model):
    id = models.BigAutoField(primary_key=True)
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
    #  owner = models.ForeignKey(User, db_column='owner_id', blank=False, null=False, on_delete=models.CASCADE,
    #    limit_choices_to={'is_staff': True},)
    owner = models.BigIntegerField(db_column='owner_id', blank=False, null=False)

    class Meta:
        db_table = u'site'
        verbose_name = 'Site'
        verbose_name_plural = 'Sites'
        ordering = ['name']

    def __str__(self):
        return self.name
