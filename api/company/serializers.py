from rest_framework.serializers import ModelSerializer
from api.users.serializers import UserSerializer
from models.company_model.models import Company


class CompanySerializer(ModelSerializer):
    user = UserSerializer(many=False)

    class Meta:
        model = Company
        fields = '__all__'
