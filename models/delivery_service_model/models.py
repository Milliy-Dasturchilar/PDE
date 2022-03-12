from django.db import models
from models.company_model.models import Company

# Create your models here.


class DeliveryService(models.Model):
    company = models.ForeignKey(Company, on_delete=models.CASCADE)
    car_model = models.CharField(max_length=255)
    products = models.TextField()
    service_area = models.TextField()
    price_per_km = models.CharField(max_length=255)
    min_distance = models.CharField(max_length=255)

    def __str__(self):
        return self.company.name + ' ' + self.car_model
