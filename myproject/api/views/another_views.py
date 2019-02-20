from myproject.api.models import receiving_header, rental_stock_card
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from myproject.api.serializers import NestedReceivingHeaderSerializer, NestedStockCardSerializer


# This view is purposely used for testing only

# View for nested serializer on incoming/receiving management
class NestedReceivingManagement(APIView):

    def get(self, request, format=None):
        headers = receiving_header.objects.all()
        serializers = NestedReceivingHeaderSerializer(headers, many=True)
        return Response(serializers.data)

    def post(self, request, format=None):
        serializers = NestedReceivingHeaderSerializer(data=request.data)
        if serializers.is_valid():
            serializers.save()
            return Response(serializers.data, status=status.HTTP_201_CREATED)
        return Response(serializers.errors, status=status.HTTP_400_BAD_REQUEST)


# View for nested serializer on stock mannagement
class NestedStockManagement(APIView):
    def get(self, request, format=None):
        stockmanagement = rental_stock_card.objects.all()
        serializers = NestedStockCardSerializer(stockmanagement, many=True)
        return Response(serializers.data)

    def post(self, request, format=None):
        serializers = NestedStockCardSerializer(data=request.data)
        if serializers.is_valid():
            serializers.save()
            return Response(serializers.data, status=status.HTTP_201_CREATED)
        return Response(serializers.errors, status=status.HTTP_400_BAD_REQUEST)
