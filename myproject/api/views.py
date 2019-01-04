from rest_framework import viewsets
from .serializers import *

class master_kategori(viewsets.ModelViewSet):
    queryset = master_kategori.objects.all()
    serializer_class = KategoriSerializer

class master_unit(viewsets.ModelViewSet):
    queryset = master_unit.objects.all()
    serializer_class = UnitSerializer

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
    queryset = master_pelanggan.objects.all()
    serializer_class = PelangganSerializer

class master_barang(viewsets.ModelViewSet):
    queryset = master_barang.objects.all()
    serializer_class = BarangSerializer

class receiving_detail(viewsets.ModelViewSet):
    queryset = receiving_detail.objects.all()
    serializer_class = ReceivingDetailSerializer

class receiving_header(viewsets.ModelViewSet):
    queryset = receiving_header.objects.all()
    serializer_class = ReceivingHeaderSerializer

class inven_header(viewsets.ModelViewSet):
    queryset = inven_header.objects.all()
    serializer_class = InvenHeaderSerializer

class inven_detail(viewsets.ModelViewSet):
    queryset = inven_detail.objects.all()
    serializer_class = InvenDetailSerializer

class inven_sn(viewsets.ModelViewSet):
    queryset = inven_sn.objects.all()
    serializer_class = InvenSnSerializer