from django.urls import path
from .views import ExportServiceListAPIView, ExportServiceDetailAPIView


urlpatterns = [
    path('', ExportServiceListAPIView.as_view()),
    path('<str:pk>/', ExportServiceDetailAPIView.as_view()),
]
