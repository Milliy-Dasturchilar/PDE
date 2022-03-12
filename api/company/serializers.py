from rest_framework.serializers import ModelSerializer
from api.user_serializers import UserSerializer
from models.company_model.models import Company


class CompanySerializer(ModelSerializer):
    user = UserSerializer(many=False)

    class Meta:
        model = Company
        fields = '__all__'
