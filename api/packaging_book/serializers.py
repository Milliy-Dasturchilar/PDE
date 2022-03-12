from rest_framework.serializers import ModelSerializer
from models.packaging_book_model.models import PackagingBook


class PackagingBookSerializer(ModelSerializer):
    
    class Meta:
        model = PackagingBook
        fields = '__all__'
