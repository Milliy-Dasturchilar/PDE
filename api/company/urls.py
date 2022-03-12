from django.urls import path
from .views import CompanyListAPIView, CompanyDetailAPIView


urlpatterns = [
    path('', CompanyListAPIView.as_view()),
    path('<str:pk>/', CompanyDetailAPIView.as_view()),
]
