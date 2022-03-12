from django.urls import path
from .views import DeliveryServiceListAPIView, DeliveryServiceDetailAPIView


urlpatterns = [
    path('', DeliveryServiceListAPIView.as_view()),
    path('<str:pk>/', DeliveryServiceDetailAPIView.as_view()),
]
