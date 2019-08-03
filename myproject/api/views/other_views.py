from django.core import serializers
from django.http import HttpResponse
from rest_framework import status
from rest_framework.response import Response
from rest_framework.decorators import api_view
from myproject.api.forms import SignUpForm
from django.contrib.auth.models import User, Group, Permission
from myproject.api.models import *
from django.db.models import Q


@api_view(['POST'])
def signup(request):
    form = SignUpForm(request.data)
    print(request.data)
    if form.is_valid():
        user = form.save()
        user.refresh_from_db()
        user.master_user.user_level = form.cleaned_data.get('user_level')
        user.master_user.user_type = form.cleaned_data.get('user_type')
        user.master_user.employee_id = master_employee(form.cleaned_data.get('employee_id'))
        user.save()
        return Response("Berhasil membuat account", status=status.HTTP_201_CREATED)
    else:
        return Response(form.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(['POST'])
def createGroup(request):
    group_name = request.data['group_name']
    permissions = request.data['permissions']
    group, created = Group.objects.get_or_create(name=group_name)
    for perm in permissions:
        if perm['kategori'] == "Manajemen Master":
            if perm['jenis_akses'] == "Hanya Lihat":
                listOfPermissions = Permission.objects.filter(name__contains="Can view master")
                for p in listOfPermissions:
                    if p.name == "Can view master_user" or p.name == "Can view master_employee":
                        continue
                    group.permissions.add(p)
            elif perm['jenis_akses'] == "Proses Data":
                listOfPermissions = Permission.objects.filter(name__contains="Can add master")
                for p in listOfPermissions:
                    if p.name == "Can add master_user" or p.name == "Can add master_employee":
                        continue
                    group.permissions.add(p)
                listOfPermissions = Permission.objects.filter(name__contains="Can change master")
                for p in listOfPermissions:
                    if p.name == "Can change master_user" or p.name == "Can change master_employee":
                        continue
                    group.permissions.add(p)
                listOfPermissions = Permission.objects.filter(name__contains="Can delete master")
                for p in listOfPermissions:
                    if p.name == "Can delete master_user" or p.name == "Can delete master_employee":
                        continue
                    group.permissions.add(p)
        elif perm['kategori'] == "Manajemen Inventori":
            if perm['jenis_akses'] == "Hanya Lihat":
                listOfPermissions = Permission.objects.filter(name__contains="Can view receiving")
                for p in listOfPermissions:
                    group.permissions.add(p)
            elif perm['jenis_akses'] == "Proses Data":
                listOfPermissions = Permission.objects.filter(name__contains="Can add receiving")
                for p in listOfPermissions:
                    group.permissions.add(p)
                listOfPermissions = Permission.objects.filter(name__contains="Can change receiving")
                for p in listOfPermissions:
                    group.permissions.add(p)
                listOfPermissions = Permission.objeccts.filter(name__contains="Can delete receiving")
                for p in listOfPermissions:
                    group.permissions.add(p)
        elif perm['kategori'] == "Manajemen Kerja":
            if perm['jenis_akses'] == "Hanya Lihat":
                listOfPermissions = Permission.objects.filter(name__contains="Can view rental")
                for p in listOfPermissions:
                    group.permissions.add(p)
            elif perm['jenis_akses'] == "Proses Data":
                listOfPermissions = Permission.objects.filter(name__contains="Can add rental")
                for p in listOfPermissions:
                    group.permissions.add(p)
                listOfPermissions = Permission.objects.filter(name__contains="Can change rental")
                for p in listOfPermissions:
                    group.permissions.add(p)
                listOfPermissions = Permission.objects.filter(name__contains="Can delete rental")
                for p in listOfPermissions:
                    group.permissions.add(p)
        elif perm['kategori'] == "Manajemen Pengguna":
            if perm['jenis_akses'] == "Hanya Lihat":
                listOfPermissions = Permission.objects.filter(
                    Q(name__contains="Can view master_user") | Q(name__contains="Can view master_employee"))
                for p in listOfPermissions:
                    group.permissions.add(p)
            elif perm['jenis_akses'] == "Proses Data":
                listOfPermissions = Permission.objects.filter(
                    Q(name__contains="master_user") | Q(name__contains="master_employee"))
                for p in listOfPermissions:
                    if p.name == "Can view master_user" or p.name == "Can view master_employee":
                        continue
                    group.permissions.add(p)
    return Response("This works!", status=status.HTTP_200_OK)


@api_view(['GET'])
def getAllGroups(request):
    groups = Group.objects.all()

    data = serializers.serialize('json', groups)
    return HttpResponse(data, content_type='application/json')


@api_view(['POST'])
def getUser(request):
    user_name = request.data['name']
    user = User.objects.get(username=user_name)
    # print(user.user_permissions.all())
    return Response("This functions works!", status=status.HTTP_200_OK)


@api_view(['POST'])
def assignGroupToUser(request):
    user_name = request.data['username']
    groups = request.data['groups']
    u = User.objects.get(username=user_name)

    for group in groups:
        g = Group.objects.get(name=group['name'])
        g.user_set.add(u)

    return Response("This functions works", status=status.HTTP_200_OK)
