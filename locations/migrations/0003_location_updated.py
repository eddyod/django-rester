# Generated by Django 2.1.1 on 2018-12-19 10:00

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('locations', '0002_auto_20181219_0955'),
    ]

    operations = [
        migrations.AddField(
            model_name='location',
            name='updated',
            field=models.DateTimeField(auto_now_add=True, default=django.utils.timezone.now, verbose_name='Updated on'),
            preserve_default=False,
        ),
    ]
