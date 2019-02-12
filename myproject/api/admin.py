from django.contrib import admin
from .models import *

admin.site.register(master_location)
admin.site.register(master_item)
admin.site.register(master_merk)
admin.site.register(master_uom)
admin.site.register(master_group_item)
admin.site.register(master_vendor)
admin.site.register(master_customer)
admin.site.register(receiving_detail)
admin.site.register(receiving_header)
admin.site.register(master_user)
admin.site.register(master_employee)
admin.site.register(receiving_detail_sn)
admin.site.register(rental_order_header)
admin.site.register(rental_order_detail)
