# Generated by Django 2.1.1 on 2018-09-27 18:41

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('schedules', '0002_remove_schedule_name'),
    ]

    operations = [
        migrations.RenameField(
            model_name='schedule',
            old_name='endTime',
            new_name='end',
        ),
        migrations.RenameField(
            model_name='schedule',
            old_name='startTime',
            new_name='start',
        ),
        migrations.AlterField(
            model_name='schedule',
            name='school',
            field=models.ForeignKey(blank=True, on_delete=django.db.models.deletion.CASCADE, related_name='schools', to='schools.School'),
        ),
    ]
