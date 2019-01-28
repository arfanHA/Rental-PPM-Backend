from rest_framework import routers
from django.conf.urls import include
from django.conf.urls import url
from . import views

router = routers.DefaultRouter()
router.register(r'master_kategori', views.master_kategori)
router.register(r'master_unit', views.master_unit)
router.register(r'master_merk', views.master_merk)
router.register(r'master_location', views.master_location)
router.register(r'master_vendor', views.master_vendor)
router.register(r'master_pelanggan', views.master_pelanggan)
router.register(r'master_barang', views.master_barang)
router.register(r'receiving_detail', views.receiving_detail)
router.register(r'receiving_header', views.receiving_header)
# router.register(r'inven_header', views.inven_header)
# router.register(r'inven_detail', views.inven_detail)
# router.register(r'inven_sn', views.inven_sn)

urlpatterns = [
    url(r'^', include(router.urls)),
    url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework'))
]
