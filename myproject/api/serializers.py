from rest_framework import serializers
from .models import *
from drf_writable_nested import WritableNestedModelSerializer


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

class ReceivingDetailSNSerializer(serializers.ModelSerializer):
    class Meta:
        model = receiving_detail_sn
        fields = '__all__'


class ReceivingDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = receiving_detail
        fields = '__all__'


class ReceivingHeaderSerializer(serializers.ModelSerializer):
    class Meta:
        model = receiving_header
        fields = '__all__'


class NestedReceivingDetailSerializer(WritableNestedModelSerializer):
    RDISN = ReceivingDetailSNSerializer(many=True)

    class Meta:
        model = receiving_detail
        fields = ['receiving_detail_id', 'qty', 'note', 'receiving_header_id', 'master_item_id', 'uom_id', 'RDISN']


class NestedReceivingHeaderSerializer(WritableNestedModelSerializer):
    RDHeader = NestedReceivingDetailSerializer(many=True)

    class Meta:
        model = receiving_header
        fields = ['receiving_header_id', 'date', 'number', 'number_preix', 'counter', 'status', 'approval1_date',
                  'approval1', 'note', 'vendor_id', 'location_id', 'user_id', 'RDHeader']


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


class NestedRentalHeaderSerializer(WritableNestedModelSerializer):
    RentalDetailHeader = RentalDetailSerializer(many=True)

    class Meta:
        model = rental_header
        fields = ['rental_header_id', 'date', 'user_id', 'number', 'number_prefix', 'counter', 'discount_type',
                  'discount', 'tax', 'delivery_cost', 'amount', 'notes', 'salesman', 'notes_kwitansi', 'status',
                  'rental_start_date', 'rental_end_date', 'pay_type', 'sales_order_id', 'customer_id', 'location_id',
                  'approved_by', 'approved_date', 'RentalDetailHeader']


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


class NestedStockSNSerializer(WritableNestedModelSerializer):
    StockSNHistory = StockSNHistorySerializer(many=True)

    class Meta:
        model = rental_stock_sn
        fields = ['stock_code_id', 'first_sn', 'new_sn', 'receiving_detail_sn_id', 'stock_card_id', 'StockSNHistory']


class NestedStockCardSerializer(WritableNestedModelSerializer):
    StockSNFromRSC = NestedStockSNSerializer(many=True)

    class Meta:
        model = rental_stock_card
        fields = ['stock_card_id', 'item_master_id', 'location_id', 'qty', 'rental_header_id', 'rental_detail_id',
                  'receiving_header_id', 'receiving_detail_id', 'StockSNFromRSC']
