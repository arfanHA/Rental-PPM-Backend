from rest_framework import serializers
from .models import *


# Master Management

class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = master_group_item
        fields = '__all__'


class UOMSerializer(serializers.ModelSerializer):
    class Meta:
        model = master_uom
        fields = '__all__'


class MerkSerializer(serializers.ModelSerializer):
    class Meta:
        model = master_merk
        fields = '__all__'


class LocationSerializer(serializers.ModelSerializer):
    class Meta:
        model = master_location
        fields = '__all__'


class VendorSerializer(serializers.ModelSerializer):
    class Meta:
        model = master_vendor
        fields = '__all__'


class CustomerSerializer(serializers.ModelSerializer):
    class Meta:
        model = master_customer
        fields = '__all__'


class ItemSerializer(serializers.ModelSerializer):
    class Meta:
        model = master_item
        fields = '__all__'


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = master_user
        fields = '__all__'


class EmployeeSerializer(serializers.ModelSerializer):
    class Meta:
        model = master_employee
        fields = '__all__'


# Receiving Management

class ReceivingHeaderSerializer(serializers.ModelSerializer):
    class Meta:
        model = receiving_header
        fields = '__all__'


class ReceivingDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = receiving_detail
        fields = '__all__'


class ReceivingDetailSNSerializer(serializers.ModelSerializer):
    class Meta:
        model = receiving_detail_sn
        fields = '__all__'


class ReceivingDetailAllSerializer(serializers.ModelSerializer):
    RDISN = ReceivingDetailSNSerializer(many=True)

    class Meta:
        model = receiving_detail
        fields = ['receiving_detail_id', 'qty', 'note', 'receiving_header_id', 'master_item_id', 'uom_id', 'RDISN']

    # def create(self, validated_data):
    #     snDetail = validated_data.pop('RDISN')
    #     detail = receiving_detail.objects.create(**validated_data)
    #     for sn in snDetail:
    #         receiving_detail_sn.objects.create(receiving_detail=detail, **sn)
    #     return detail


class ReceivingHeaderAllSerializer(serializers.ModelSerializer):
    # RDHeader = ReceivingDetailSerializer(many=True)
    RDHeader = ReceivingDetailAllSerializer(many=True)
    # RDISN = ReceivingDetailSNSerializer(many=True)

    class Meta:
        model = receiving_header
        fields = ['receiving_header_id', 'date', 'number', 'number_preix', 'counter', 'status', 'approval1_date',
                  'approval1', 'note', 'vendor_id', 'location_id', 'user_id', 'RDHeader']

    # first try on writeable multiple nested serializers
    def create(self, validated_data):
        detailData = validated_data.pop('RDHeader')
        header = receiving_header.objects.create(**validated_data)
        for detail in detailData:
            aaa = receiving_detail.objects.create(receiving_header_id=header, **detail)
            snData = validated_data.pop('RDISN')
            for sn in snData:
                receiving_detail_sn.objects.create(receiving_detail_id=aaa, **sn)
                # sn.set(receiving_detail_id=aaa)
        return header


# Rental Order Management

class RentalOrderHeaderSerializer(serializers.ModelSerializer):
    class Meta:
        model = rental_order_header
        fields = '__all__'


class RentalOrderDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = rental_order_detail
        fields = '__all__'


# Rental Management

class RentalHeaderSerializer(serializers.ModelSerializer):
    class Meta:
        model = rental_header
        fields = '__all__'


class RentalDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = rental_detail
        fields = '__all__'


# Stock Management

class RentalStockCardSerializer(serializers.ModelSerializer):
    class Meta:
        model = rental_stock_card
        fields = '__all__'


class RentalStockSNSerializer(serializers.ModelSerializer):
    class Meta:
        model = rental_stock_sn
        fields = '__all__'


class StockSNHistorySerializer(serializers.ModelSerializer):
    class Meta:
        model = stock_sn_history
        fields = '__all__'
