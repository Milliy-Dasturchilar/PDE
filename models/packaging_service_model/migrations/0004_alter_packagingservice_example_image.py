# Generated by Django 4.0.3 on 2022-03-12 14:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('packaging_service_model', '0003_packagingservice_example_image'),
    ]

    operations = [
        migrations.AlterField(
            model_name='packagingservice',
            name='example_image',
            field=models.ImageField(upload_to=''),
        ),
    ]
