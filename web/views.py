from django.contrib.auth import authenticate, login, logout
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from models.company_model.models import Company
from models.packaging_service_model.models import PackagingService
from models.delivery_service_model.models import DeliveryService
from models.export_service_model.models import ExportService
from models.packaging_service_model.forms import AddPackagingServiceForm


# Create your views here.


def auto_login(request, pk, username, password):
    if request.user.is_authenticated:
        return redirect('index')
    user = authenticate(request, username=username, password=password)
    if user is not None and user.pk == int(pk):
        login(request, user)
        return redirect('index')
    return redirect('login_user')


def login_user(request):
    if request.user.is_authenticated:
        return redirect('index')
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            return redirect('index')
        else:
            return render(request, 'login.html', {'error': 'Invalid username or password'})
    return render(request, 'login.html')


def logout_user(request):
    logout(request)
    return redirect('login_user')


@login_required(login_url='login_user')
def create_company(request):
    company = Company.objects.filter(user=request.user).first()
    if company is not None:
        return redirect('index')

    if request.method == 'POST':
        user = request.user
        name = request.POST.get('name')
        phone_number = request.POST.get('phone_number')
        address = request.POST.get('address')
        logo_img = request.FILES.get('logo_img')
        if logo_img:
            company = Company(user=user, name=name, phone_number=phone_number, address=address, logo_img=logo_img)
        else:
            company = Company(user=user, name=name, phone_number=phone_number, address=address)
        company.save()
        return redirect('index')
    return render(request, 'create_company.html')


@login_required(login_url='login_user')
def index(request):
    company = Company.objects.filter(user=request.user).first()
    if company is None:
        return redirect('create_company')
    packaging_services = PackagingService.objects.filter(company=company)
    delivery_services = DeliveryService.objects.filter(company=company)
    context = {
        'company': company,
        'packaging_services': packaging_services,
        'delivery_services': delivery_services
    }
    return render(request, 'index.html', context=context)


def delete_packaging_service(request, pk):
    packaging_service = PackagingService.objects.filter(pk=pk).first()
    if packaging_service is None:
        return redirect('index')
    packaging_service.delete()
    return redirect('index')


def delete_delivery_service(request, pk):
    delivery_service = DeliveryService.objects.filter(pk=pk).first()
    if delivery_service is None:
        return redirect('index')
    delivery_service.delete()
    return redirect('index')


def add_packaging_service(request):
    company = Company.objects.filter(user=request.user).first()
    errors = ""
    if company is None:
        return redirect('create_company')
    print(request.POST)
    if request.method == 'POST':
        form = AddPackagingServiceForm(request.POST, request.FILES)
        print(request.POST)
        print(form.is_valid())
        errors = form.errors
        if form.is_valid():
            service = form.save(commit=False)
            service.company = company
            service.save()
            return redirect('index')
    form = AddPackagingServiceForm()
    context = {
        'form': form,
        'title': 'Qadoqlash xizmati qo\'shish',
        'errors': errors
    }
    return render(request, 'add_packaging_service.html', context=context)


def update_packaging_service(request, pk):
    errors = ""
    service = PackagingService.objects.filter(pk=pk).first()
    if request.method == 'POST':
        form = AddPackagingServiceForm(request.POST, request.FILES)
        errors = form.errors
        if form.is_valid():
            service.service_area = form.cleaned_data['service_area']
            service.product_type = form.cleaned_data['product_type']
            service.product_name = form.cleaned_data['product_name']
            service.min_amount = form.cleaned_data['min_amount']
            service.package_type = form.cleaned_data['package_type']
            service.price_per_kg = form.cleaned_data['price_per_kg']
            service.example_image = form.cleaned_data['example_image']
            service.save()
            return redirect('index')
    form = AddPackagingServiceForm(instance=service)
    context = {
        'form': form,
        'title': 'Qadoqlash xizmatini yangilash',
        'errors': errors
    }
    return render(request, 'add_packaging_service.html', context=context)
