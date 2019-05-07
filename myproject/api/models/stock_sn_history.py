from django.db import models

from .rental_stock_sn import rental_stock_sn


class stock_sn_history(models.Model):
    stock_sn_history_id = models.BigAutoField(primary_key=True)
    date = models.DateField()
    status = models.CharField(max_length=50, blank=True)
    ref_id = models.BigIntegerField(null=True, blank=True)
    stock_code_id = models.ForeignKey(rental_stock_sn, on_delete=models.DO_NOTHING, blank=True, null=True,
                                      related_name='StockSNHistory')

    class Meta:
        db_table = 'StockSNHistory'

    def __str__(self):
        return str(self.stock_sn_history_id)
