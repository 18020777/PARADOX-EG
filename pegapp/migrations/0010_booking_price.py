# Generated by Django 4.1.2 on 2023-07-12 22:21

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('pegapp', '0009_faqelement'),
    ]

    operations = [
        migrations.AddField(
            model_name='booking',
            name='price',
            field=models.DecimalField(decimal_places=2, default=0.0, max_digits=5),
        ),
    ]