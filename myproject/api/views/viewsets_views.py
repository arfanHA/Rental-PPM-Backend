from rest_framework import viewsets
from myproject.api.serializers import *


class master_kategori(viewsets.ModelViewSet):
    queryset = master_group_item.objects.all()
    serializer_class = CategorySerializer


class master_unit(viewsets.ModelViewSet):
    queryset = master_uom.objects.all()
    serializer_class = UOMSerializer


class master_user(viewsets.ModelViewSet):
    queryset = master_user.objects.all()
    serializer_class = UserSerializer


class master_merk(viewsets.ModelViewSet):
    queryset = master_merk.objects.all()
    serializer_class = MerkSerializer


class master_location(viewsets.ModelViewSet):
    queryset = master_location.objects.all()
    serializer_class = LocationSerializer


class master_vendor(viewsets.ModelViewSet):
    queryset = master_vendor.objects.all()
    serializer_class = VendorSerializer


class master_pelanggan(viewsets.ModelViewSet):
    queryset = master_customer.objects.all()
    serializer_class = CustomerSerializer


class master_employee(viewsets.ModelViewSet):
    queryset = master_employee.objects.all()
    serializer_class = EmployeeSerializer


class master_item(viewsets.ModelViewSet):
    queryset = master_item.objects.all()
    serializer_class = ItemSerializer


class receiving_detail(viewsets.ModelViewSet):
    queryset = receiving_detail.objects.all()
    serializer_class = ReceivingDetailSerializer


class receiving_header(viewsets.ModelViewSet):
    queryset = receiving_header.objects.all()
    serializer_class = ReceivingHeaderSerializer


class receiving_detail_sn(viewsets.ModelViewSet):
    queryset = receiving_detail_sn.objects.all()
    serializer_class = ReceivingDetailSNSerializer


class rental_order_header(viewsets.ModelViewSet):
    queryset = rental_order_header.objects.all()
    serializer_class = RentalOrderHeaderSerializer


class rental_order_detail(viewsets.ModelViewSet):
    queryset = rental_order_detail.objects.all()
    serializer_class = RentalOrderDetailSerializer

# class inven_header(viewsets.ModelViewSet):
#     queryset = inven_header.objects.all()
#     serializer_class = InvenHeaderSerializer
#
# class inven_detail(viewsets.ModelViewSet):
#     queryset = inven_detail.objects.all()
#     serializer_class = InvenDetailSerializer
#
# class inven_sn(viewsets.ModelViewSet):
#     queryset = inven_sn.objects.all()
#     serializer_class = InvenSnSerializer
