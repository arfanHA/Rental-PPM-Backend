# Generated by Django 2.1.5 on 2019-02-07 06:30

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0002_master_employee'),
    ]

    operations = [
        migrations.AlterField(
            model_name='receiving_detail',
            name='master_item_id',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='api.master_item'),
        ),
        migrations.AlterField(
            model_name='receiving_detail',
            name='receiving_header_id',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='api.receiving_header'),
        ),
        migrations.AlterField(
            model_name='receiving_detail',
            name='uom_id',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='api.master_uom'),
        ),
    ]