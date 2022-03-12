from rest_framework.response import Response
from rest_framework.decorators import api_view
from django.conf import settings


@api_view(['GET'])
def overview(request):
    print(settings.DEBUG)
    url = 'https://pde.pythonanywhere.com/api/'
    if settings.DEBUG:
        url = 'http://127.0.0.1:8000/api/'

    router = {
        'Company': {
            'Companies list': url + 'company/',
            'Company detail': url + 'company/{id}/',
        },
        'Packaging Service': {
            'Packaging Services list': url + 'packaging-service/',
            'Packaging Service detail': url + 'packaging-service/{id}/',
        },
    }
    return Response(router)
