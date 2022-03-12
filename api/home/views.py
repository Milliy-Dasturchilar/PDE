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
        },
    }
    return Response(router)
