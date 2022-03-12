from rest_framework.serializers import ModelSerializer
from api.company.serializers import CompanySerializer
from models.export_service_model.models import ExportService


class ExportServiceSerializer(ModelSerializer):
    company = CompanySerializer(many=False)

    class Meta:
        model = ExportService
        fields = '__all__'
