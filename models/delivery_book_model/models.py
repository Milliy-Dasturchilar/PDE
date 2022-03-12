from django.db import models
from django.contrib.auth import get_user_model
from models.delivery_service_model.models import DeliveryService

# Create your models here.


class DeliveryBook(models.Model):
    user_id = models.ForeignKey(
        get_user_model(), on_delete=models.CASCADE, related_name='delivery_book')
    delivery_service_id = models.ForeignKey(
        DeliveryService, on_delete=models.CASCADE, related_name='delivery_book')
    from_address = models.TextField()
    to_address = models.TextField()
    date = models.CharField(max_length=255)
    is_done = models.BooleanField(default=False)
    in_progress = models.BooleanField(default=False)
    booked_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f'{self.user_id.username} - {self.delivery_service_id.car_model}'
