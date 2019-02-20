from myproject.api.models import receiving_header
from myproject.api.serializers import ReceivingHeaderSerializer
from django.http import Http404
from rest_framework.views import APIView
from rest_framework .response import Response
from rest_framework import status
from rest_framework import serializers
from myproject.api.serializers import ReceivingHeaderAllSerializer


import logging

logging.basicConfig(level=logging.DEBUG)


class TestView(APIView):
    def post(self, request, format=None):
        # serializers = ReceivingHeaderSerializer(data=request.data)
        # logging.debug(serializers)
        data = request.data
        logging.debug(data)
        return Response('Hello World')


class RetrieveAllReceivingHeader(APIView):
    # queryset = receiving_header.objects.all()

    def get(self, request, format=None):
        headers = receiving_header.objects.all()
        serializers = ReceivingHeaderAllSerializer(headers, many=True)
        return Response(serializers.data)

    def post(self, request, format=None):
        serializers = ReceivingHeaderAllSerializer(data=request.data)
        # serializers = ReceivingAddToAllSerializer(data=request.data)
        if serializers.is_valid():
            serializers.save()
            return Response(serializers.data, status=status.HTTP_201_CREATED)
        return Response(serializers.errors, status=status.HTTP_400_BAD_REQUEST)