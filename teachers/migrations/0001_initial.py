# Generated by Django 2.1.1 on 2018-09-23 14:24

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Teacher',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=150)),
                ('email', models.EmailField(max_length=254)),
                ('phone', models.CharField(max_length=20)),
                ('address1', models.CharField(blank=True, max_length=50)),
                ('address2', models.CharField(blank=True, max_length=50)),
                ('city', models.CharField(blank=True, max_length=50)),
                ('postalCode', models.CharField(blank=True, max_length=50)),
                ('province', models.CharField(blank=True, max_length=50)),
                ('country', models.CharField(blank=True, max_length=50)),
                ('latitude', models.DecimalField(blank=True, decimal_places=4, max_digits=9, null=True)),
                ('longitude', models.DecimalField(blank=True, decimal_places=4, max_digits=9, null=True)),
                ('description', models.TextField(blank=True, null=True)),
                ('createdOn', models.DateTimeField(auto_now_add=True, verbose_name='Created on')),
                ('isActive', models.BooleanField(default=True)),
            ],
            options={
                'db_table': 'teacher',
                'verbose_name_plural': 'Teachers',
                'verbose_name': 'Teacher',
            },
        ),
    ]
