from rest_framework.serializers import ModelSerializer
from api.company.serializers import CompanySerializer
from models.delivery_service_model.models import DeliveryService


class DeliveryServiceSerializer(ModelSerializer):
    company = CompanySerializer(many=False)

    class Meta:
        model = DeliveryService
        fields = '__all__'
