# Generated by Django 2.1.1 on 2018-12-19 09:56

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('schedules', '0002_schedule'),
    ]

    operations = [
        migrations.AlterField(
            model_name='schedule',
            name='id',
            field=models.BigAutoField(primary_key=True, serialize=False),
        ),
    ]