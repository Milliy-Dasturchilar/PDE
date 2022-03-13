from django import forms
from .models import PackagingService


class AddPackagingServiceForm(forms.ModelForm):
    class Meta:
        model = PackagingService
        fields = '__all__'
        