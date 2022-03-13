from rest_framework.response import Response
from rest_framework import permissions
from rest_framework.decorators import api_view, permission_classes
from django.conf import settings


@api_view(['GET'])
@permission_classes([permissions.AllowAny])
def overview(request):
    print(settings.DEBUG)
    url = 'https://pde.pythonanywhere.com/api/'
    if settings.DEBUG:
        url = 'http://127.0.0.1:8000/api/'

    router = {
        'Users': {
            'Check credentials': url + 'users/check-user/',
            'Create user': url + 'users/create/',
        },
        'Company': {
            'Companies list': url + 'company/',
            'Company detail': url + 'company/{id}/',
        },
        'Packaging Service': {
            'Packaging Services list': url + 'packaging-service/',
            'Packaging Service detail': url + 'packaging-service/{id}/',
        },
        'Packaging Book': {
            'Packaging Books list': url + 'packaging-book/',
            'Packaging Book detail': url + 'packaging-book/{id}/',
            'Packaging Book create': url + 'packaging-book/create/',
        },
        'Delivery Service': {
            'Delivery Services list': url + 'delivery-service/',
            'Delivery Service detail': url + 'delivery-service/{id}/',
        },
        'Delivery Book': {
            'Delivery Books list': url + 'delivery-book/',
            'Delivery Book detail': url + 'delivery-book/{id}/',
            'Delivery Book create': url + 'delivery-book/create/',
        },
        'Export Service': {
            'Export Services list': url + 'export-service/',
            'Export Service detail': url + 'export-service/{id}/',
        },
    }
    return Response(router)
