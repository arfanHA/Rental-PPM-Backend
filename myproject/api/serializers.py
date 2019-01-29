from rest_framework import serializers
from .models import *


class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = master_group_item
        # fields = ('kategori_id', 'kode', 'nama')
        fields = '__all__'


class UOMSerializer(serializers.ModelSerializer):
    class Meta:
        model = master_uom
        # fields = ('unit_id', 'satuan')
        fields = '__all__'


class MerkSerializer(serializers.ModelSerializer):
    class Meta:
        model = master_merk
        # fields = ('merk_id', 'merk')
        fields = '__all__'


class LocationSerializer(serializers.ModelSerializer):
    class Meta:
        model = master_location
        # fields = ('location_id', 'type', 'code', 'name')
        fields = '__all__'


class VendorSerializer(serializers.ModelSerializer):
    class Meta:
        model = master_vendor
        # fields = ('vendor_id', 'nama', 'alamat')
        fields = '__all__'


class CustomerSerializer(serializers.ModelSerializer):
    class Meta:
        model = master_customer
        # fields = ('pelanggan_id', 'tipe', 'nama', 'alamat', 'kode_pos', 'telepon', 'fax', 'hp', 'nama_pj', 'hp_pj')
        fields = '__all__'


class ItemSerializer(serializers.ModelSerializer):
    class Meta:
        model = master_item
        # fields = '__all__'
        fields = '__all__'


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = master_user
        fields = '__all__'


class ReceivingDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = receiving_detail
        # fields = '__all__'
        fields = '__all__'


class ReceivingHeaderSerializer(serializers.ModelSerializer):
    class Meta:
        model = receiving_header
        # fields = '__all__'
        fields = '__all__'


class EmployeeSerializer(serializers.ModelSerializer):
    class Meta:
        model = master_employee
        fields = '__all__'

# class InvenHeaderSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = inven_header
#         fields = '__all__'
#
# class InvenDetailSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = inven_detail
#         fields = '__all__'
#
# class InvenSnSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = inven_sn
#         fields = '__all__'
