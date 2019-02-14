from django.http import HttpResponse
from django.views.generic import View

from myproject.utils import render_to_pdf

from myproject.api.models.receiving_header import receiving_header
from myproject.api.models.receiving_detail import receiving_detail
from myproject.api.models.receiving_detail_sn import receiving_detail_sn


class generateInvoice(View):
    def get(self, request, *args, **kwargs):
        data = {
            # 'today': datetime.date.today(),
            # 'amount': 39.99,
            # 'customer_name': 'Cooper Mann',
            # 'order_id': 1233434,
        }
        pdf = render_to_pdf('invoice.html', data)
        return HttpResponse(pdf, content_type='application/pdf')


class generateKwitansi(View):
    def get(self, request, *args, **kwargs):
        data = {
            # 'today': datetime.date.today(),
            # 'amount': 39.99,
            # 'customer_name': 'Cooper Mann',
            # 'order_id': 1233434,
        }
        pdf = render_to_pdf('kwitansi.html', data)
        return HttpResponse(pdf, content_type='application/pdf')


class generateReceiving(View):
    def get(self, request, pk, *args, **kwargs):
        receivingHeader = receiving_header.objects.get(pk=pk)
        receivingDetail = receiving_detail.objects.filter(receiving_header_id=pk)

        data = {
            'header': receivingHeader,
            'detail': receivingDetail
        }

        pdf = render_to_pdf('receiving.html', data)
        return HttpResponse(pdf, content_type='application/pdf')


class generateSuratJalan(View):
    def get(self, request, *args, **kwargs):
        data = {
            # 'today': datetime.date.today(),
            # 'amount': 39.99,
            # 'customer_name': 'Cooper Mann',
            # 'order_id': 1233434,
        }
        pdf = render_to_pdf('suratjalan.html', data)
        return HttpResponse(pdf, content_type='application/pdf')
