from django.db import models
from models.company_model.models import Company

# Create your models here.


class ExportService(models.Model):
    company = models.ForeignKey(Company, on_delete=models.CASCADE, related_name='export_service')
    product_name = models.CharField(max_length=255)
    price_per_kg = models.CharField(max_length=255)
    max_volume = models.CharField(max_length=255)
    address = models.TextField()

    def __str__(self):
        return f'{self.company.name} - {self.product_name}'
