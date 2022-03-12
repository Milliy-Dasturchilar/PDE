from django.urls import path
from .views import check_user, create_user


urlpatterns = [
    path('check-user/', check_user),
    path('create/', create_user),
]
