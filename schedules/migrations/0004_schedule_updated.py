# Generated by Django 2.1.1 on 2018-12-19 09:59

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('schedules', '0003_auto_20181219_0956'),
    ]

    operations = [
        migrations.AddField(
            model_name='schedule',
            name='updated',
            field=models.DateTimeField(auto_now_add=True, default=django.utils.timezone.now, verbose_name='Updated on'),
            preserve_default=False,
        ),
    ]