from rest_framework.serializers import ModelSerializer
from models.delivery_book_model.models import DeliveryBook


class DeliveryBookSerializer(ModelSerializer):
    
    class Meta:
        model = DeliveryBook
        fields = '__all__'
