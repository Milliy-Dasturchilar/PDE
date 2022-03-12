from rest_framework import generics
from models.delivery_book_model.models import DeliveryBook
from .serializers import DeliveryBookSerializer


class DeliveryBookListAPIView(generics.ListAPIView):
    serializer_class = DeliveryBookSerializer

    def get_queryset(self):
        return DeliveryBook.objects.filter(user_id=self.request.user)


class DeliveryBookDetailAPIView(generics.RetrieveAPIView):
    queryset = DeliveryBook.objects.all()
    serializer_class = DeliveryBookSerializer


class DeliveryBookCreateAPIView(generics.CreateAPIView):
    queryset = DeliveryBook.objects.all()
    serializer_class = DeliveryBookSerializer

