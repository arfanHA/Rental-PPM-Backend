from rest_framework import routers
from django.conf.urls import include
from django.conf.urls import url
from myproject.api.views import viewsets_views, generatePDF_views

router = routers.DefaultRouter()
router.register(r'master_kategori', viewsets_views.master_kategori)
router.register(r'master_uom', viewsets_views.master_unit)
router.register(r'master_merk', viewsets_views.master_merk)
router.register(r'master_location', viewsets_views.master_location)
router.register(r'master_vendor', viewsets_views.master_vendor)
router.register(r'master_customer', viewsets_views.master_pelanggan)
router.register(r'master_item', viewsets_views.master_item)
router.register(r'receiving_detail', viewsets_views.receiving_detail)
router.register(r'receiving_header', viewsets_views.receiving_header)
router.register(r'master_user', viewsets_views.master_user)
router.register(r'master_employee', viewsets_views.master_employee)
router.register(r'receiving_detail_sn', viewsets_views.receiving_detail_sn)
# router.register(r'inven_header', views.inven_header)
# router.register(r'inven_detail', views.inven_detail)
# router.register(r'inven_sn', views.inven_sn)

urlpatterns = [
    url(r'^', include(router.urls)),
    url(r'^generatePDF/$', generatePDF_views.GeneratePdf.as_view()),
    url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework'))
]
