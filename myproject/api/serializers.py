from rest_framework import serializers
from .models import *

class KategoriSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = master_kategori
        fields = ('kategori_id', 'kode', 'nama')

class UnitSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = master_unit
        fields = ('unit_id', 'satuan')

class MerkSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = master_merk
        fields = ('merk_id', 'merk')

class LocationSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = master_location
        fields = ('location_id', 'type', 'code', 'name')

class VendorSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = master_vendor
        fields = ('vendor_id', 'nama', 'alamat')

class PelangganSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = master_pelanggan
        fields = ('pelanggan_id', 'tipe', 'nama', 'alamat', 'kode_pos', 'telepon', 'fax', 'hp', 'nama_pj', 'hp_pj')

class BarangSerializer(serializers.ModelSerializer):
    class Meta:
        model = master_barang
        fields = '__all__'

class ReceivingDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = receiving_detail
        fields = '__all__'

class ReceivingHeaderSerializer(serializers.ModelSerializer):
    class Meta:
        model = receiving_header
        fields = '__all__'

class InvenHeaderSerializer(serializers.ModelSerializer):
    class Meta:
        model = inven_header
        fields = '__all__'

class InvenDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = inven_detail
        fields = '__all__'

class InvenSnSerializer(serializers.ModelSerializer):
    class Meta:
        model = inven_sn
        fields = '__all__'