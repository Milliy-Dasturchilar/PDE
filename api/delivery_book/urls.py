from django.urls import path
from .views import PackagingBookListAPIView, PackagingBookDetailAPIView, PackagingBookCreateAPIView


urlpatterns = [
    path('', PackagingBookListAPIView.as_view()),
    path('<str:pk>/', PackagingBookDetailAPIView.as_view()),
    path('create/', PackagingBookCreateAPIView.as_view()),
]
