from django.urls import path, include
from .views import overview


urlpatterns = [
    path('', overview),
    path('company/', include('api.company.urls')),
    path('packaging-service/', include('api.packaging_service.urls')),
]
