# Generated by Django 4.0.3 on 2022-03-12 07:26

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('packaging_book_model', '0003_alter_packagingbook_is_done'),
    ]

    operations = [
        migrations.AddField(
            model_name='packagingbook',
            name='in_progress',
            field=models.BooleanField(default=False),
        ),
    ]
