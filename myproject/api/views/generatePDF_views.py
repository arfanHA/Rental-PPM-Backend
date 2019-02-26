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
            'npwp' : '000 000 000'
        }
        pdf = render_to_pdf('kwitansi.html', data)
        return HttpResponse(pdf, content_type='application/pdf')


class generateReceiving(View):
    def get(self, request, pk, *args, **kwargs):
        sns = []
        receivingHeader = receiving_header.objects.get(pk=pk)
        # receivingDetail = receiving_detail.objects.filter(receiving_header_id=pk)
        receivingDetail = receivingHeader.RDHeader.all()

        for a in receivingDetail:
            # temp = receiving_detail_sn.objects.filter(receiving_detail_id=a.receiving_detail_id)
            temp = a.RDISN.all()
            sns.append(temp)

        data = {
            'header': receivingHeader,
            'detail': receivingDetail,
            'SN': sns
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
