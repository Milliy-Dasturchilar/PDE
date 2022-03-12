from django.urls import path
from .views import check_user, create_user, UserCreateAPIView


urlpatterns = [
    path('check-user/', check_user),
    path('create/', create_user),
]
