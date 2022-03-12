from rest_framework.serializers import ModelSerializer
from api.company.serializers import CompanySerializer
from models.packaging_service_model.models import PackagingService


class PackagingServiceSerializer(ModelSerializer):
    company = CompanySerializer(many=False)

    class Meta:
        model = PackagingService
        fields = '__all__'
