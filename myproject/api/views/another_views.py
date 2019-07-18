from django.http import Http404, HttpResponse
from django.views.decorators.csrf import csrf_exempt
from rest_framework.decorators import api_view

from myproject.api.models import receiving_header, receiving_detail, rental_stock_card, rental_stock_sn, \
    stock_sn_history, master_item, rental_header, rental_order_header, invoice_header, master_uom, master_customer, \
    master_location, rental_order_detail, rental_detail, master_group_item
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from django.dispatch import receiver, Signal
from myproject.api.serializers import NestedReceivingHeaderWriteSerializer, NestedReceivingHeaderReadSerializer, \
    NestedStockCardSerializer, NestedRentalHeaderReadSerializer, NestedRentalHeaderWriteSerializer, \
    NestedRentalOrderHeaderWriteSerializer, NestedRentalOrderHeaderReadSerializer, RentalStockSNSerializer, \
    UOMSerializer, StockSNHistorySerializer, ItemReadSerializer, NestedInvoiceSerializer
import datetime
from django.db import models

from django.contrib.auth.decorators import login_required

# This view is purposely used for testing only, improvement is considered and might used in further development

update_on_nested_serializer = Signal(providing_args=['test'])  # custom signal
update_on_rental_register = Signal(providing_args=['test'])  # custom signal 2
update_on_rental_order = Signal(providing_args=['test'])  # custom signal 3
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
        serializers = NestedReceivingHeaderReadSerializer(headers, many=True)
        return Response(serializers.data)

    def post(self, request, format=None):
        request.data['number'] = getDocumentNumber(3)  # get document number for this request
        request.data['counter'] = getCounter(3)  # get counter for this request
        request.data['date'] = datetime.datetime.today().strftime('%Y-%m-%d')

        serializers = NestedReceivingHeaderWriteSerializer(data=request.data)
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
        serializer = NestedReceivingHeaderReadSerializer(header)
        return Response(serializer.data)

    def put(self, request, pk, format=None):
        header = self.get_object(pk)
        if request.data['status'] == "APPROVED":
            request.data['approval1_date'] = datetime.datetime.today().strftime('%Y-%m-%d')
        serializer = NestedReceivingHeaderWriteSerializer(header, data=request.data)
        if serializer.is_valid():
            serializer.save()
            if request.data['status'] == "APPROVED":
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
                        stock_sn_history.objects.create(date=todaysDate, status="MASUK",
                                                        IncomingRef_id=ReceivingHeaderData['receiving_header_id'],
                                                        stock_code_id=stockSN)
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
        serializers = NestedRentalHeaderReadSerializer(rentalHeader, many=True)
        return Response(serializers.data)

    def post(self, request, format=None):
        request.data['number'] = getDocumentNumber(2)  # get document number for this request
        request.data['counter'] = getCounter(2)  # get counter for this request

        RDH = request.data['RentalDetailHeader']
        discount = float(request.data['discount'])
        amount = 0

        for x in RDH:
            if x['discount_method'] == "By Item":
                if x['discount_type'] == "Percent":
                    # print("Percent is used from By Item")
                    subTotal = float(x['price']) * (discount / 100)
                    x['total'] = (float(x['price']) - subTotal) * x['qty']
                elif x['discount_type'] == "Value":
                    # print("Value is used from By Item")
                    x['total'] = (float(x['price']) - discount) * x['qty']
            elif x['discount_method'] == "By Total Item":
                if x['discount_type'] == "Percent":
                    # print("Percent is used from By Total Item")
                    subTotal = float(x['price']) * (discount / 100)
                    x['total'] = (float(x['price']) * x['qty']) - subTotal
                elif x['discount_type'] == "Value":
                    # print("Value is used from By Total Item")
                    x['total'] = (float(x['price']) * x['qty']) - discount
            amount = amount + float(x['total'])

        request.data['amount'] = str(amount)

        # sns = request.data.pop("SNS", None)
        # now = datetime.datetime.today().strftime('%Y-%m-%d')
        # for sn in sns:
        #     print(sn['id'])
        #     stock_sn_history.objects.create(
        #         date=now,
        #         status="KELUAR",
        #         ref_id=None,
        #         stock_code_id=rental_stock_sn(sn['id'])
        #     )

        # return Response(request.data)
        serializers = NestedRentalHeaderWriteSerializer(data=request.data)
        if serializers.is_valid():
            serializers.save()
            return Response(serializers.data, status=status.HTTP_201_CREATED)
        return Response(serializers.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(['GET'])
def getAllRentalOrderApproved(request):
    rentalOrderHeader = rental_order_header.objects.filter(status="APPROVED")
    serializers = NestedRentalOrderHeaderReadSerializer(rentalOrderHeader, many=True)
    return Response(serializers.data)


# Rental Register Details
class NestedRentalRegisterDetails(APIView):
    def get_object(self, pk):
        try:
            return rental_header.objects.get(pk=pk)
        except rental_header.DoesNotExist:
            raise Http404

    def get(self, request, pk, format=None):
        rentalHeader = self.get_object(pk)
        serializers = NestedRentalHeaderReadSerializer(rentalHeader)
        snhistoryIncoming = stock_sn_history.objects.filter(IncomingRef_id=pk)
        snhistoryRental = stock_sn_history.objects.filter(RentalRef_id=pk)
        if snhistoryRental.count() > 0:
            SNSHistory = StockSNHistorySerializer(snhistoryRental, many=True)
            newDict = serializers.data
            newDict['SNS'] = SNSHistory.data
            return Response(newDict)
        elif snhistoryIncoming.count() > 0:
            SNSHistory = StockSNHistorySerializer(snhistoryIncoming, many=True)
            newDict = serializers.data
            newDict['SNS'] = SNSHistory.data
            return Response(newDict)
        return Response(serializers.data)

    def put(self, request, pk, format=None):
        rentalHeader = self.get_object(pk)

        sns = request.data.pop("SNS", None)
        now = datetime.datetime.today().strftime('%Y-%m-%d')

        rentalHeaderId = pk

        if request.data['status'] == "APPROVED":
            for sn in sns:
                print(sn['id'])
                targetedRental = rental_stock_sn.objects.get(pk=sn['id'])
                targetedRental.status = "KELUAR"
                targetedRental.save()
                stock_sn_history.objects.create(
                    date=now,
                    status="KELUAR",
                    RentalRef_id=rentalHeaderId,
                    stock_code_id=rental_stock_sn(sn['id'])
                )

        serializers = NestedRentalHeaderWriteSerializer(rentalHeader, data=request.data)
        if serializers.is_valid():
            serializers.save()
            update_on_rental_register.send(sender=rental_header, test=serializers.data)
            return Response(serializers.data, status=status.HTTP_200_OK)
        return Response(serializers.errors, status=status.HTTP_400_BAD_REQUEST)


@receiver(update_on_rental_register)
def addToInvoice(sender, **kwargs):
    RentalRegisterData = kwargs['test']

    # print(RentalRegisterData['status'])
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
        serializer = NestedRentalOrderHeaderReadSerializer(rentalOrderHeader, many=True)
        return Response(serializer.data)

    def post(self, request, format=None):
        request.data['number'] = getDocumentNumber(1)  # get document number for this request
        request.data['counter'] = getCounter(1)  # get counter for this request

        serializers = NestedRentalOrderHeaderWriteSerializer(data=request.data)
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
        serializers = NestedRentalOrderHeaderReadSerializer(rentalOrderHeader)
        return Response(serializers.data)

    def put(self, request, pk, format=None):
        rentalOrderHeader = self.get_object(pk)
        serializers = NestedRentalOrderHeaderWriteSerializer(rentalOrderHeader, data=request.data)
        if serializers.is_valid():
            serializers.save()
            update_on_rental_order.send(sender=rental_order_header, test=serializers.data)
            return Response(serializers.data, status=status.HTTP_200_OK)
        return Response(serializers.errors, status=status.HTTP_400_BAD_REQUEST)


@receiver(update_on_rental_order)
def addToRentalRegister(sender, **kwargs):
    dataRental = kwargs['test']

    if dataRental['status'] == "APPROVED":
        timeNow = datetime.datetime.now().strftime('%Y-%m-%d')
        numberRR = getDocumentNumber(2)
        counterRR = getCounter(2)

        # print(dataRental)

        rentalHeader = rental_header.objects.create(
            date=timeNow,
            number=numberRR,
            number_prefix="",
            counter=counterRR,
            tax=dataRental['tax'],
            discount_type=dataRental['discount_type'],
            discount=dataRental['discount'],
            delivery_cost=dataRental['delivery_fee'],
            amount=dataRental['amount'],
            notes=dataRental['notes'],
            salesman=dataRental['salesman'],
            notes_kwitansi="",
            status="DRAFT",
            rental_start_date=dataRental['rental_start_date'],
            rental_end_date=dataRental['rental_end_date'],
            sales_order_id=rental_order_header(dataRental['sales_order_id']),
            customer_id=master_customer(dataRental['customer_id']),
            location_id=master_location(dataRental['location_id']),
            approved_by=dataRental['approved_by'],
            approved_date=dataRental['approved_date'],
            pay_type=1,
            pay_method=1,
            note_kwitansi=dataRental['notes_kwitansi']
        )

        RODHeader = dataRental.pop('RODHeader', None)

        for x in RODHeader:
            rental_detail.objects.create(
                price=x['price'],
                qty=x['qty'],
                discount_type=x['discount_type'],
                discount_method=x['discount_method'],
                total=x['total'],
                rental_header_id=rentalHeader,
                order_detail_id=rental_order_detail(x['order_detail_id']),
                master_item_id=master_item(x['master_item_id'])
            )


# Invoice Management
class NestedInvoiceManagement(APIView):
    def get(self, request, format=None):
        invoiceHeader = invoice_header.objects.all()
        serializer = NestedInvoiceSerializer(invoiceHeader, many=True)
        return Response(serializer.data)

    def post(self, request, format=None):
        serializer = NestedInvoiceSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class NestedInvoiceManagementDetails(APIView):
    def get_object(self, pk):
        try:
            return invoice_header.objects.get(pk=pk)
        except invoice_header.DoesNotExists:
            raise Http404

    def get(self, request, pk, format=None):
        invoiceHeader = self.get_object(pk)
        serializer = NestedInvoiceSerializer(invoiceHeader)
        return Response(serializer.data)

    def put(self, request, pk, format=None):
        invoiceHeader = self.get_object(pk)
        serializers = NestedInvoiceSerializer(invoiceHeader, data=request.data)
        if serializers.is_valid():
            serializers.save()
            return Response(serializers.data, status=status.HTTP_200_OK)
        return Response(serializers.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(['GET'])
def getItemByCategory(request, b=1):
    item = master_item.objects.filter(master_group_id=b)
    serializer = ItemReadSerializer(item, many=True)
    return Response(serializer.data)


@api_view(['GET'])
def getItemSNs(request, i=1):
    sns = rental_stock_sn.objects.filter(stock_card_id__in=(rental_stock_card.objects.filter(item_master_id=i)))
    serializers = RentalStockSNSerializer(sns, many=True)
    return Response(serializers.data, status=status.HTTP_200_OK)


@api_view(['GET'])
def getItemSNsAvailable(request, i=1):
    sns = rental_stock_sn.objects.filter(stock_card_id__in=(rental_stock_card.objects.filter(item_master_id=i))).filter(
        status="MASUK")
    serializers = RentalStockSNSerializer(sns, many=True)
    return Response(serializers.data, status=status.HTTP_200_OK)


@api_view(['GET'])
def getUnapprovedHeader(request, s=1):
    incomingHeader = receiving_header.objects.filter(status=s)
    serializers = NestedReceivingHeaderReadSerializer(incomingHeader, many=True)
    return Response(serializers.data, status=status.HTTP_200_OK)


@api_view(['GET'])
def getDistinctItem(request):
    stocks = rental_stock_card.objects.distinct('item_master_id')
    serializers = NestedStockCardSerializer(stocks, many=True)

    a = serializers.data

    for x in a:
        SNSQty = rental_stock_sn.objects.filter(
            stock_card_id__in=(rental_stock_card.objects.filter(item_master_id=x['item_master_id']))).filter(
            status="MASUK").count()
        x['qty'] = SNSQty

    # return Response(serializers.data, status=status.HTTP_200_OK)
    return Response(a, status=status.HTTP_200_OK)


@api_view(['GET'])
def getStockHistoryBySN(request, i=1):
    SNHistory = stock_sn_history.objects.filter(stock_code_id=i)
    serializers = StockSNHistorySerializer(SNHistory, many=True)
    return Response(serializers.data, status=status.HTTP_200_OK)


@api_view(['POST'])
def getRentalWithFilter(request):
    fromDate = request.data['dateFrom']
    toDate = request.data['dateTo']

    if request.data['locationCheck'] == 1:
        val = request.data['value']
        rentalRegister = rental_header.objects.filter(date__gte=fromDate, date__lte=toDate, location_id=val)
    elif request.data['groupCheck'] == 1:
        val = request.data['value']
        rentalRegister = rental_header.objects.filter(date__gte=fromDate, date__lte=toDate).filter(
            rental_header_id__in=(
                rental_detail.objects.filter(master_item_id__in=(master_item.objects.filter(master_group_id=val)))))
    else:
        rentalRegister = rental_header.objects.filter(date__gte=fromDate, date__lte=toDate)

    serializers = NestedRentalHeaderReadSerializer(rentalRegister, many=True)
    return Response(serializers.data, status=status.HTTP_200_OK)


@api_view(['POST'])
def getPrice(request):
    rentalHeader = request.data['rental_header_id']
    periode = request.data['periode']

    price1 = 0
    price2 = 0
    price3 = 0
    rentalDetails = rental_detail.objects.filter(rental_header_id=rentalHeader)
    for rentalDetail in rentalDetails:
        itemId = rentalDetail.master_item_id_id
        item = master_item.objects.get(pk=itemId)
        price1 = price1 + int(float(item.price1))
        price2 = price2 + int(float(item.price2))
        if(item.price3 == ""): price3 = price3
        else: price3 = price3 + int(float(item.price3))

    priceDict = {
        'price1': price1 * int(periode),
        'price2': price2 * int(periode),
        'price3': price3 * int(periode)
    }

    print(priceDict)
    return Response(priceDict)


# @login_required
@api_view(['GET'])
def testView(request):
    # this is to pop out item from a dict / request body
    # print("This is inside request body : ")
    # print(request.data)
    #
    # a = request.data.pop("world", None)
    #
    # for idx,x in enumerate(a):
    #     print(idx)
    #     print(" ")
    #     print(x['test'])
    #
    # print("This is the poped out dict : ")
    # print(a)
    # return Response(request.data)

    # this is to get the latest data
    # stocks = stock_sn_history.objects.latest('date')
    # serializers = StockSNHistorySerializer(stocks)

    # rentalRegister = rental_header.objects.filter(date__gte=models.DateField().to_python("2019-04-01"),
    #                                               date__lte=models.DateField().to_python("2019-05-13"))
    # serializers = NestedRentalHeaderReadSerializer(rentalRegister, many=True)
    # return Response(serializers.data)

    x = master_item.objects.filter(master_group_id=1)
    y = rental_detail.objects.filter(master_item_id__in=x)
    z = rental_header.objects.filter(rental_header_id__in=y)
    print(y)

    return Response("Test")
