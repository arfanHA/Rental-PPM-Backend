# Generated by Django 2.1.5 on 2019-01-29 06:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='master_employee',
            fields=[
                ('employee_id', models.BigAutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=100)),
                ('address', models.CharField(max_length=300)),
                ('id_type', models.CharField(max_length=100)),
                ('id_number', models.CharField(max_length=100)),
                ('employee_status', models.CharField(max_length=100)),
                ('dob', models.DateField()),
                ('phone_number', models.CharField(max_length=50)),
            ],
            options={
                'db_table': 'MasterEmployee',
            },
        ),
    ]