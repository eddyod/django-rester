# Generated by Django 2.1.1 on 2018-12-18 11:41

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('sites', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='site',
            name='owner',
            field=models.IntegerField(db_column='owner_id'),
        ),
    ]