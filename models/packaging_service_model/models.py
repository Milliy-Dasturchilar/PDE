from django.db import models
from models.company_model.models import Company

# Create your models here.


class PackagingService(models.Model):
    PRODUCT_TYPE = (
        ('Meva', 'Meva'),
        ('Poliz', 'Poliz'),
        ('Sabzavot', 'Sabzavot'),
        ('Dukkakli', 'Dukkakli'),
        ('Ziravor', 'Ziravor'),
    )
    company = models.ForeignKey(Company, on_delete=models.CASCADE, related_name='packaging_service')
    service_area = models.TextField()
    product_type = models.CharField(
        choices=PRODUCT_TYPE, default='Meva', max_length=255)
    product_name = models.CharField(max_length=255)
    min_amount = models.CharField(max_length=255)
    package_type = models.CharField(max_length=255)
    price_per_kg = models.CharField(max_length=255)
    example_image = models.ImageField(blank=True)

    def __str__(self):
        return f'{self.company.name} - {self.product_type} - {self.product_name}'
