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
admin.site.register(rental_header) # Rental Management starts here
admin.site.register(rental_detail)
admin.site.register(rental_detail_sn)
admin.site.register(rental_stock_card) # Stock Management starts here
admin.site.register(rental_stock_sn)
admin.site.register(stock_sn_history)
