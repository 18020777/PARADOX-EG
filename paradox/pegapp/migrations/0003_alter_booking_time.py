# Generated by Django 4.1.2 on 2023-05-20 06:16

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('pegapp', '0002_booking'),
    ]

    operations = [
        migrations.AlterField(
            model_name='booking',
            name='time',
            field=models.TimeField(choices=[('10', '10:00'), ('11', '11:00'), ('12', '12:00'), ('14', '14:00'), ('15', '15:00'), ('16', '16:00'), ('17', '17:00'), ('18', '18:00')]),
        ),
    ]
