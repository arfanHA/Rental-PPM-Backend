from django.http import Http404

from myproject.api.models import receiving_header, rental_stock_card, receiving_detail
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from django.dispatch import receiver, Signal
from myproject.api.serializers import NestedReceivingHeaderSerializer, NestedStockCardSerializer, \
    RentalStockCardSerializer
import json

# This view is purposely used for testing only

update_on_nested_serializer = Signal(providing_args=['test'])  # custom signal


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


class NestedReceivingManagementDetails(APIView):
    def get_object(selfs, pk):
        try:
            return receiving_header.objects.get(pk=pk)
        except receiving_header.DoesNotExist:
            raise Http404

    def get(self, request, pk, format=None):
        header = self.get_object(pk)
        serializer = NestedReceivingHeaderSerializer(header)
        return Response(serializer.data)

    def put(self, request, pk, format=None):
        header = self.get_object(pk)
        serializer = NestedReceivingHeaderSerializer(header, data=request.data)
        if serializer.is_valid():
            serializer.save()
            update_on_nested_serializer.send(sender=receiving_header, test=serializer.data)
            return Response(serializer.data, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@receiver(update_on_nested_serializer)
def yolo(sender, **kwargs):
    ReceivingHeaderData = kwargs['test']
    Detail_from_ReceivingHeaderData = ReceivingHeaderData['RDHeader']

    # print(Detail_from_ReceivingHeaderData[1]['receiving_detail_id'])

    for EachDetail in Detail_from_ReceivingHeaderData:
        stockCardData = rental_stock_card.objects.create(item_master_id=1,
                                                         location_id=ReceivingHeaderData['location_id'],
                                                         qty=EachDetail['qty'],
                                                         rental_header_id=None,
                                                         rental_detail_id=None,
                                                         receiving_header_id=receiving_header(
                                                             EachDetail['receiving_header_id']),
                                                         receiving_detail_id=receiving_detail(
                                                             EachDetail['receiving_detail_id']))
        if stockCardData:
            # print("Success create object")
            print(stockCardData)
        else:
            print("Failed create object")

        # a = kwargs['test']
    # b = a['RDHeader']
    # c = json.dumps(b, indent=4)
    # d = json.dumps(a, indent=4)
    # e = json.loads(c)
    # # print(e[0])
    # for x in e:
    #     temp = []
    # if "1" is a['status']:
    #     print('DRAFT')
    # else:
    #     print('APPROVED')


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
