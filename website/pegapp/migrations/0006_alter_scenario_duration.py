# Generated by Django 4.1.2 on 2023-06-04 08:06

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('pegapp', '0005_alter_booking_time'),
    ]

    operations = [
        migrations.AlterField(
            model_name='scenario',
            name='duration',
            field=models.DurationField(default=datetime.timedelta(seconds=3600)),
        ),
    ]