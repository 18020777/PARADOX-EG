# Generated by Django 4.2.3 on 2023-07-19 23:24

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('pegapp', '0014_alter_booking_chrono_alter_booking_gameover_time_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='booking',
            name='chrono',
            field=models.DurationField(blank=True, default=datetime.timedelta(0), editable=False, null=True),
        ),
    ]
