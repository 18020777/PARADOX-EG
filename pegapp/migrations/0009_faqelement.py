# Generated by Django 4.1.2 on 2023-07-11 23:10

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('pegapp', '0008_priceslist_delete_defaultpricelist'),
    ]

    operations = [
        migrations.CreateModel(
            name='FAQElement',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('question', models.CharField(max_length=200)),
                ('answer', models.CharField(max_length=1000)),
            ],
        ),
    ]
