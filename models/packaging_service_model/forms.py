from django import forms
from .models import PackagingService


class AddPackagingServiceForm(forms.ModelForm):
    class Meta:
        model = PackagingService
        fields = [
            'service_area', 'product_type', 'product_name', 'min_amount',
            'package_type', 'price_per_kg', 'example_image'
        ]
