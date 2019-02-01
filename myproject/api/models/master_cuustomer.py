from django.db import models


class master_customer(models.Model):
    customer_id = models.BigAutoField(primary_key=True)
    customer_type = models.CharField(max_length=100)
    name = models.CharField(max_length=300)
    address = models.CharField(max_length=500)
    pos_code = models.CharField(max_length=100, blank=True)
    phone_code = models.IntegerField(blank=True, null=True)
    phone = models.IntegerField(blank=True, null=True)
    fax_code = models.IntegerField(blank=True, null=True)
    fax = models.IntegerField(blank=True, null=True)
    mobile_phone = models.CharField(max_length=100, blank=True)
    pic_name = models.CharField(max_length=100, blank=True)
    pic_number = models.CharField(max_length=100, blank=True)

    class Meta:
        db_table = 'MasterCustomer'

    def __str__(self):
        return self.name
