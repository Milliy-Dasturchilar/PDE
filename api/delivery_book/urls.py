from django.urls import path
from .views import DeliveryBookListAPIView, DeliveryBookDetailAPIView, DeliveryBookCreateAPIView


urlpatterns = [
    path('', DeliveryBookListAPIView.as_view()),
    path('<str:pk>/', DeliveryBookDetailAPIView.as_view()),
    path('create/', DeliveryBookCreateAPIView.as_view()),
]
