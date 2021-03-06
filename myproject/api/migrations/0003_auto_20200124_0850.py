# Generated by Django 2.1.1 on 2020-01-24 01:50

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0002_auto_20200121_1032'),
    ]

    operations = [
        migrations.AddField(
            model_name='master_item',
            name='serial_number',
            field=models.BooleanField(default=True),
        ),
        migrations.AlterField(
            model_name='master_item',
            name='master_group_id',
            field=models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, related_name='MasterGroup', to='api.master_group_item'),
        ),
    ]
