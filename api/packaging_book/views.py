from rest_framework import generics
from models.packaging_book_model.models import PackagingBook
from .serializers import PackagingBookSerializer


class PackagingBookListAPIView(generics.ListAPIView):
    queryset = PackagingBook.objects.all()
    serializer_class = PackagingBookSerializer


class PackagingBookDetailAPIView(generics.RetrieveAPIView):
    queryset = PackagingBook.objects.all()
    serializer_class = PackagingBookSerializer
