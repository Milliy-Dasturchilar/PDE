from django.urls import path
from .views import PackagingServiceListAPIView, PackagingServiceDetailAPIView


urlpatterns = [
    path('', PackagingServiceListAPIView.as_view()),
    path('<str:pk>/', PackagingServiceDetailAPIView.as_view()),
]
