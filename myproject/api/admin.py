from django.contrib import admin
from .models import *

admin.site.register(master_location)
admin.site.register(master_barang)
admin.site.register(master_merk)
admin.site.register(master_unit)
admin.site.register(master_kategori)
admin.site.register(master_vendor)
admin.site.register(master_pelanggan)
admin.site.register(receiving_detail)
admin.site.register(receiving_header)
admin.site.register(inven_header)
admin.site.register(inven_detail)
admin.site.register(inven_sn)

