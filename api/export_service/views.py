from rest_framework import generics
from models.export_service_model.models import ExportService
from .serializers import ExportServiceSerializer


class ExportServiceListAPIView(generics.ListAPIView):
    queryset = ExportService.objects.all()
    serializer_class = ExportServiceSerializer


class ExportServiceDetailAPIView(generics.RetrieveAPIView):
    queryset = ExportService.objects.all()
    serializer_class = ExportServiceSerializer
