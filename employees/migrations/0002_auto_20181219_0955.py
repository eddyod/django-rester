# Generated by Django 2.1.1 on 2018-12-19 09:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('employees', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='employee',
            name='id',
            field=models.BigAutoField(primary_key=True, serialize=False),
        ),
    ]
