from django.http import Http404, HttpResponse
from rest_framework.decorators import api_view

from myproject.api.models import receiving_header, receiving_detail, rental_stock_card, rental_stock_sn, \
    stock_sn_history, master_item, rental_header, rental_order_header, invoice_header
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from django.dispatch import receiver, Signal
from myproject.api.serializers import NestedReceivingHeaderSerializer, NestedStockCardSerializer, \
    NestedRentalHeaderSerializer, ItemSerializer, NestedRentalOrderHeaderSerializer, RentalStockSNSerializer, \
    RentalStockCardSerializer, StockSNHistorySerializer
import datetime

from django.contrib.auth.decorators import login_required

# This view is purposely used for testing only, improvement is considered and might used in further development

update_on_nested_serializer = Signal(providing_args=['test'])  # custom signal
update_on_rental_register = Signal(providing_args=['test'])  # custom signal 2
todaysDate = datetime.datetime.today().strftime('%Y-%m-%d')  # get current date


def getDocumentNumber(r):
    now = datetime.datetime.now()
    docNumb = ""
    if r == 1:
        # This is for Rental Order Management
        docNumb += "RO/"
        query = rental_order_header.objects.count()
        if query < 1:
            docNumb += "0001"
        else:
            query2 = rental_order_header.objects.all().order_by('-counter')[:1].get()
            j = query2.counter + 1
            docNumb += str(j).zfill(4)
    elif r == 2:
        # This is for Rental Register
        docNumb += "RN/"
        query = rental_header.objects.count()
        if query < 1:
            docNumb += "0001"
        else:
            query2 = rental_header.objects.all().order_by('-counter')[:1].get()
            j = query2.counter + 1
            docNumb += str(j).zfill(4)
    elif r == 3:
        # This is for Incoming or Receiving Management
        docNumb += "IN/"
        query = receiving_header.objects.count()
        if query < 1:
            docNumb += "0001"
        else:
            query2 = receiving_header.objects.all().order_by('-counter')[:1].get()
            j = query2.counter + 1
            docNumb += str(j).zfill(4)
    docNumb += "/" + now.strftime("%m") + "/" + now.strftime("%Y")
    return docNumb


def getCounter(r):
    c = ""
    if r == 1:
        query = rental_order_header.objects.count()
        if query < 1:
            c += "1"
        else:
            query2 = rental_order_header.objects.all().order_by('-counter')[:1].get()
            c += str(query2.counter + 1)
    elif r == 2:
        query = rental_header.objects.count()
        if query < 1:
            c += "1"
        else:
            query2 = rental_header.objects.all().order_by('-counter')[:1].get()
            c += str(query2.counter + 1)
    elif r == 3:
        query = receiving_header.objects.count()
        if query < 1:
            c += "1"
        else:
            query2 = receiving_header.objects.all().order_by('-counter')[:1].get()
            c += str(query2.counter + 1)
    return c


# This view is used to get and post object of incoming management module
class NestedReceivingManagement(APIView):
    def get(self, request, format=None):
        headers = receiving_header.objects.all()
        serializers = NestedReceivingHeaderSerializer(headers, many=True)
        return Response(serializers.data)

    def post(self, request, format=None):
        request.data['number'] = getDocumentNumber(3)  # get document number for this request
        request.data['counter'] = getCounter(3)  # get counter for this request
        request.data['date'] = datetime.datetime.today().strftime('%Y-%m-%d')

        serializers = NestedReceivingHeaderSerializer(data=request.data)
        if serializers.is_valid():
            serializers.save()
            return Response(serializers.data, status=status.HTTP_201_CREATED)
        return Response(serializers.errors, status=status.HTTP_400_BAD_REQUEST)


# This view is use to get and update specific object of incoming management module
class NestedReceivingManagementDetails(APIView):
    def get_object(self, pk):
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
        if request.data['status'] == "APPROVED":
            request.data['approval1_date'] = datetime.datetime.today().strftime('%Y-%m-%d')
        serializer = NestedReceivingHeaderSerializer(header, data=request.data)
        if serializer.is_valid():
            serializer.save()
            update_on_nested_serializer.send(sender=receiving_header, test=serializer.data)
            return Response(serializer.data, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


# This is the receiver of signal to add new objects upon updating status in incoming module
@receiver(update_on_nested_serializer)
def addToStock(sender, **kwargs):
    ReceivingHeaderData = kwargs['test']
    Detail_from_ReceivingHeaderData = ReceivingHeaderData['RDHeader']

    if "DRAFT" is ReceivingHeaderData['status']:
        print('DRAFT, because the status is still DRAFT, so nothing happened XD')
    else:
        print('APPROVED')
        # Adding each detail in incoming module on selected header to rental stock card
        for EachDetail in Detail_from_ReceivingHeaderData:
            stockCardData = rental_stock_card.objects.create(item_master_id=EachDetail['master_item_id'],
                                                             location_id=ReceivingHeaderData['location_id'],
                                                             qty=EachDetail['qty'],
                                                             rental_header_id=None,
                                                             rental_detail_id=None,
                                                             receiving_header_id=receiving_header(
                                                                 EachDetail['receiving_header_id']),
                                                             receiving_detail_id=receiving_detail(
                                                                 EachDetail['receiving_detail_id']))
            # Check whether the object creation is success or not, if yes, put every SN in each details into
            # rental stock sn and stock sn history with status equals to 1 or available
            if stockCardData:
                # print(stockCardData)
                sn = []

                # Move all SN in RDISN of each Detail into a variable called sn, then create rental stock sn objects for each rental stock card
                for EachSNArray in EachDetail['RDISN']:
                    temp = {}
                    # print(EachSNArray)
                    for keys, values in EachSNArray.items():
                        # print("This is inside EachSNArray.items() = ", keys, values)
                        temp[keys] = values
                    sn.append(temp)

                for SN in sn:
                    stockSN = rental_stock_sn.objects.create(first_sn=SN['first_serial_number'],
                                                             new_sn=SN['new_serial_number'],
                                                             status="MASUK",
                                                             stock_card_id=stockCardData)

                    if stockSN:
                        # print("Create Rental Stock SN object success!! the ID of this object is = ", stockSN)
                        stock_sn_history.objects.create(date=todaysDate, status="MASUK", stock_code_id=stockSN)
                    else:
                        print("Failed to create Rental Stock SN Object")
            else:
                print("Failed create object")


# This view is used to get and post on stock management module including
# rental stock card, rental stock sn, and stock sn history
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


# This view is used to get rental stock card, rental stock sn, and stock sn history
class NestedStockManagementDetails(APIView):
    def get_object(selfs, pk):
        try:
            return rental_stock_card.objects.get(pk=pk)
        except receiving_header.DoesNotExist:
            raise Http404

    def get(self, request, pk, format=None):
        header = self.get_object(pk)
        serializer = NestedStockCardSerializer(header)
        return Response(serializer.data)


# Rental Register
class NestedRentalRegister(APIView):
    def get(self, request, format=None):
        rentalHeader = rental_header.objects.all()
        serializers = NestedRentalHeaderSerializer(rentalHeader, many=True)
        return Response(serializers.data)

    def post(self, request, format=None):
        request.data['number'] = getDocumentNumber(2)  # get document number for this request
        request.data['counter'] = getCounter(2)  # get counter for this request

        serializers = NestedRentalHeaderSerializer(data=request.data)
        if serializers.is_valid():
            serializers.save()
            return Response(serializers.data, status=status.HTTP_201_CREATED)
        return Response(serializers.errors, status=status.HTTP_400_BAD_REQUEST)


# Rental Register Details
class NestedRentalRegisterDetails(APIView):
    def get_object(self, pk):
        try:
            return rental_header.objects.get(pk=pk)
        except rental_header.DoesNotExist:
            raise Http404

    def get(self, request, pk, format=None):
        rentalHeader = self.get_object(pk)
        serializers = NestedRentalHeaderSerializer(rentalHeader)
        return Response(serializers.data)

    def put(self, request, pk, format=None):
        rentalHeader = self.get_object(pk)
        serializers = NestedRentalHeaderSerializer(rentalHeader, data=request.data)
        if serializers.is_valid():
            serializers.save()
            update_on_rental_register.send(sender=rental_header, test=serializers.data)
            return Response(serializers.data, status=status.HTTP_200_OK)
        return Response(serializers.errors, status=status.HTTP_400_BAD_REQUEST)


@receiver(update_on_rental_register)
def addToInvoice(sender, **kwargs):
    RentalRegisterData = kwargs['test']

    print(RentalRegisterData['status'])
    if "DRAFT" == RentalRegisterData['status']:
        print("This is DRAFT, nothing happen")
    else:
        print("APPROVED")

        timeNow = datetime.datetime.now().strftime('%Y-%m-%d')
        invoice_header.objects.create(date=timeNow,
                                      amount=RentalRegisterData['amount'],
                                      customer=RentalRegisterData['customer_id'],
                                      pay_method=RentalRegisterData['pay_method'],
                                      rental_header_id=rental_header(RentalRegisterData['rental_header_id']))


# Rental Order Management
class NestedRentalOrderManagement(APIView):
    def get(self, request, format=None):
        rentalOrderHeader = rental_order_header.objects.all()
        serializer = NestedRentalOrderHeaderSerializer(rentalOrderHeader, many=True)
        return Response(serializer.data)

    def post(self, request, format=None):
        request.data['number'] = getDocumentNumber(1)  # get document number for this request
        request.data['counter'] = getCounter(1)  # get counter for this request

        serializers = NestedRentalOrderHeaderSerializer(data=request.data)
        if serializers.is_valid():
            serializers.save()
            return Response(serializers.data, status=status.HTTP_200_OK)
        return Response(serializers.errors, status=status.HTTP_400_BAD_REQUEST)


# Rental Order Management Details
class NestedRentalOrderManagementDetails(APIView):
    def get_object(self, pk):
        try:
            return rental_order_header.objects.get(pk=pk)
        except rental_order_header.DoesNotExist:
            raise Http404

    def get(self, request, pk, format=None):
        rentalOrderHeader = self.get_object(pk)
        serializers = NestedRentalOrderHeaderSerializer(rentalOrderHeader)
        return Response(serializers.data)

    def put(self, request, pk, format=None):
        rentalOrderHeader = self.get_object(pk)
        serializers = NestedRentalOrderHeaderSerializer(rentalOrderHeader, data=request.data)
        if serializers.is_valid():
            serializers.save()
            return Response(serializers.data, status=status.HTTP_200_OK)
        return Response(serializers.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(['GET'])
def getItemByCategory(request, b=1):
    item = master_item.objects.filter(master_group_id=b)
    serializer = ItemSerializer(item, many=True)
    return Response(serializer.data)


@api_view(['GET'])
def getItemSNs(request, i=1):
    sns = rental_stock_sn.objects.filter(stock_card_id__in=(rental_stock_card.objects.filter(item_master_id=i)))
    serializers = RentalStockSNSerializer(sns, many=True)
    return Response(serializers.data, status=status.HTTP_200_OK)


@api_view(['GET'])
def getItemSNsAvailable(request, i=1):
    sns = rental_stock_sn.objects.filter(stock_card_id__in=(rental_stock_card.objects.filter(item_master_id=i))).filter(
        status="1")
    serializers = RentalStockSNSerializer(sns, many=True)
    return Response(serializers.data, status=status.HTTP_200_OK)


@api_view(['GET'])
def getUnapprovedHeader(request, s=1):
    incomingHeader = receiving_header.objects.filter(status=s)
    serializers = NestedReceivingHeaderSerializer(incomingHeader, many=True)
    return Response(serializers.data, status=status.HTTP_200_OK)


@login_required
@api_view(['GET'])
def testView(request):
    return Response("this is a test view")
