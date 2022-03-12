from rest_framework import generics
from models.packaging_book_model.models import PackagingBook
from .serializers import PackagingBookSerializer


class PackagingBookListAPIView(generics.ListAPIView):
    serializer_class = PackagingBookSerializer

    def get_queryset(self):
        return PackagingBook.objects.filter(user_id=self.request.user)


class PackagingBookDetailAPIView(generics.RetrieveAPIView):
    queryset = PackagingBook.objects.all()
    serializer_class = PackagingBookSerializer


class PackagingBookCreateAPIView(generics.CreateAPIView):
    queryset = PackagingBook.objects.all()
    serializer_class = PackagingBookSerializer

