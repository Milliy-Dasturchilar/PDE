from rest_framework import generics
from models.packaging_service_model.models import PackagingService
from api.packaging_service.serializers import PackagingServiceSerializer


class PackagingServiceListAPIView(generics.ListAPIView):
    queryset = PackagingService.objects.all()
    serializer_class = PackagingServiceSerializer


class PackagingServiceDetailAPIView(generics.RetrieveAPIView):
    queryset = PackagingService.objects.all()
    serializer_class = PackagingServiceSerializer
