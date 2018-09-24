# Generated by Django 2.1.1 on 2018-09-23 18:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('teachers', '0003_auto_20180923_1806'),
    ]

    operations = [
        migrations.AlterField(
            model_name='teacher',
            name='address1',
            field=models.CharField(max_length=50, null=True),
        ),
        migrations.AlterField(
            model_name='teacher',
            name='address2',
            field=models.CharField(max_length=50, null=True),
        ),
        migrations.AlterField(
            model_name='teacher',
            name='city',
            field=models.CharField(max_length=50, null=True),
        ),
        migrations.AlterField(
            model_name='teacher',
            name='country',
            field=models.CharField(max_length=500, null=True),
        ),
        migrations.AlterField(
            model_name='teacher',
            name='description',
            field=models.TextField(null=True, verbose_name=0),
        ),
        migrations.AlterField(
            model_name='teacher',
            name='email',
            field=models.EmailField(max_length=254, null=True),
        ),
        migrations.AlterField(
            model_name='teacher',
            name='phone',
            field=models.CharField(max_length=20, null=True),
        ),
        migrations.AlterField(
            model_name='teacher',
            name='postalCode',
            field=models.CharField(max_length=50, null=True),
        ),
        migrations.AlterField(
            model_name='teacher',
            name='province',
            field=models.CharField(max_length=500, null=True),
        ),
    ]