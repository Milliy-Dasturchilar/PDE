from django.urls import path, include
from .views import overview


urlpatterns = [
    path('', overview),
    path('company/', include('api.company.urls')),
]
