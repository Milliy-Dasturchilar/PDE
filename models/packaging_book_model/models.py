from django.db import models
from django.contrib.auth import get_user_model
from models.packaging_service_model.models import PackagingService

# Create your models here.


class PackagingBook(models.Model):
    user_id = models.ForeignKey(
        get_user_model(), on_delete=models.CASCADE, related_name='packaging_book')
    packaging_service_id = models.ForeignKey(
        PackagingService, on_delete=models.CASCADE, related_name='packaging_book')
    address = models.TextField()
    date = models.CharField(max_length=255)
    is_done = models.BooleanField(default=False)
    in_progress = models.BooleanField(default=False)
    booked_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.user_id.username + ' - ' + self.packaging_service_id.product_type + \
            ' - ' + self.packaging_service_id.product_name
