from rest_framework import generics
from models.delivery_service_model.models import DeliveryService
from api.packaging_service.serializers import DeliveryServiceSerializer


class DeliveryServiceListAPIView(generics.ListAPIView):
    queryset = DeliveryService.objects.all()
    serializer_class = DeliveryServiceSerializer


class DeliveryServiceDetailAPIView(generics.RetrieveAPIView):
    queryset = DeliveryService.objects.all()
    serializer_class = DeliveryServiceSerializer
