from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('login/', views.login_user, name='login_user'),
    path('logout/', views.logout_user, name='logout_user'),
    path('create-company/', views.create_company, name='create_company'),
    path('add-packaging-service/', views.add_packaging_service, name='add_packaging_service'),
    path('update-packaging-service/<int:pk>/', views.update_packaging_service, name='update_packaging_service'),
    path('delete-packaging-service/<int:pk>/', views.delete_packaging_service, name='delete_packaging_service'),
    path('delete-delivery-service/<int:pk>/', views.delete_delivery_service, name='delete_delivery_service'),
    path('auto-login/<str:pk>/<str:username>/<str:password>/', views.auto_login, name='auto_login'),
]