from django.db import models

from .invoice_header import invoice_header
from .master_user import master_user


class invoice_detail(models.Model):
    invoice_detail_id = models.BigAutoField(primary_key=True)
    date = models.DateField(blank=True)
    type_payment = models.CharField(max_length=50, blank=True)
    pay_amount = models.CharField(max_length=100, blank=True)
    noted = models.TextField(blank=True)
    invoice_header_id = models.ForeignKey(invoice_header, on_delete=models.DO_NOTHING, blank=True, null=True)
    status = models.CharField(max_length=50, blank=True)
    user_id = models.ForeignKey(master_user, on_delete=models.DO_NOTHING, blank=True, null=True)

    class Meta:
        db_table = 'InvoiceDetail'

    def __str__(self):
        return str(self.invoice_detail_id)
