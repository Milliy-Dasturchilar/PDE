from django.urls import path, include
from .views import overview


urlpatterns = [
    path('', overview),
    path('users/', include('api.users.urls')),
    path('company/', include('api.company.urls')),
    path('packaging-service/', include('api.packaging_service.urls')),
    path('packaging-book/', include('api.packaging_book.urls')),
    path('delivery-service/', include('api.delivery_service.urls')),
    path('delivery-book/', include('api.delivery_book.urls')),
    path('export-service/', include('api.export_service.urls')),
]
