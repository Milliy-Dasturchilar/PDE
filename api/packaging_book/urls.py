from django.urls import path
from .views import PackagingBookListAPIView, PackagingBookDetailAPIView


urlpatterns = [
    path('', PackagingBookListAPIView.as_view()),
    path('<str:pk>/', PackagingBookDetailAPIView.as_view()),
]
