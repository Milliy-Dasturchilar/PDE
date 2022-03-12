from rest_framework import generics
from rest_framework import permissions
from django.contrib.auth import get_user_model
from .serializers import UserSerializer, UserCreateSerializer
from django.contrib.auth import authenticate
from rest_framework.response import Response
from rest_framework.decorators import api_view, permission_classes
from rest_framework.status import HTTP_200_OK, HTTP_400_BAD_REQUEST, HTTP_404_NOT_FOUND, HTTP_201_CREATED


@api_view(['POST'])
@permission_classes([permissions.AllowAny])
def check_user(request):
    username = request.data.get('username')
    password = request.data.get('password')
    if username is None or password is None:
        return Response({'error': 'Please provide both username and password'},
                        status=HTTP_400_BAD_REQUEST)
    user = authenticate(username=username, password=password)
    if not user:
        return Response({'error': 'Invalid Credentials'},
                        status=HTTP_404_NOT_FOUND)

    serializer = UserSerializer(user, many=False)
    return Response(serializer.data, status=HTTP_200_OK)


class UserCreateAPIView(generics.CreateAPIView):
    queryset = get_user_model().objects.all()
    serializer_class = UserCreateSerializer
    permission_classes = (permissions.AllowAny,)


@api_view(['POST'])
@permission_classes([permissions.AllowAny])
def create_user(request):
    username = request.data.get('username')
    fist_name = request.data.get('first_name')
    last_name = request.data.get('last_name')
    password = request.data.get('password')

    if username is None or fist_name is None or password is None:
        return Response({'error': 'Please provide all the fields'},
                        status=HTTP_400_BAD_REQUEST)

    if get_user_model().objects.filter(username=username).exists():
        return Response({'error': 'User already exists'},
                        status=HTTP_400_BAD_REQUEST)

    user = get_user_model().objects.create_user(
        username=username, first_name=fist_name, last_name=last_name, password=password)
    user.save()
    serializer = UserSerializer(user, many=False)
    return Response(serializer.data, status=HTTP_201_CREATED)
