from django.db import models

from .rental_detail import rental_detail
from .rental_stock_sn import rental_stock_sn


class rental_detail_sn(models.Model):
    rental_detail_sn_id = models.BigAutoField(primary_key=True)
    serial_number = models.CharField(max_length=100)
    rental_detail_id = models.ForeignKey(rental_detail, on_delete=models.DO_NOTHING, blank=True, null=True)
    stock_code_id = models.OneToOneField(rental_stock_sn, on_delete=models.DO_NOTHING, blank=True, null=True)

    class Meta:
        db_table = 'RentalDetailSN'

    def __str__(self):
        return str(self.rental_detail_sn_id)
