# Generated by Django 2.1.1 on 2018-12-01 07:42

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0008_auto_20181201_1435'),
    ]

    operations = [
        migrations.AddField(
            model_name='inven_detail',
            name='header',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='api.inven_header'),
        ),
        migrations.AddField(
            model_name='inven_header',
            name='nomor_doc',
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
    ]
