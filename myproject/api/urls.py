from rest_framework import routers
from django.conf.urls import include
from django.conf.urls import url
from myproject.api.views import viewsets_views, another_views, other_views

router = routers.DefaultRouter()
router.register(r'master_kategori', viewsets_views.master_kategori)  # Master management starts here
router.register(r'master_uom', viewsets_views.master_unit)
router.register(r'master_merk', viewsets_views.master_merk)
router.register(r'master_location', viewsets_views.master_location)
router.register(r'master_vendor', viewsets_views.master_vendor)
router.register(r'master_customer', viewsets_views.master_pelanggan)
router.register(r'master_item', viewsets_views.master_item)
router.register(r'master_user', viewsets_views.master_user)
router.register(r'master_employee', viewsets_views.master_employee)
router.register(r'receiving_detail_sn', viewsets_views.receiving_detail_sn)  # Receiving Management starts here
router.register(r'receiving_detail', viewsets_views.receiving_detail)
router.register(r'receiving_header', viewsets_views.receiving_header)
router.register(r'rental_order_header', viewsets_views.rental_order_header)
router.register(r'rental_order_detail', viewsets_views.rental_order_detail)
router.register(r'rental_header', viewsets_views.rental_header)  # Rental management starts here
router.register(r'rental_detail', viewsets_views.rental_detail)
router.register(r'rental_stock_card', viewsets_views.rental_stock_card)  # Stock management starts here
router.register(r'rental_stock_sn', viewsets_views.rental_stock_sn)
router.register(r'stock_sn_history', viewsets_views.stock_sn_history)
router.register(r'invoice_header', viewsets_views.invoice_header)
router.register(r'invoice_detail', viewsets_views.invoice_detail)

urlpatterns = [
    url(r'^', include(router.urls)),
    url(r'^testView/', another_views.testView),
    url(r'^NestedReceivingManagement/', another_views.NestedReceivingManagement.as_view()),
    url(r'^NestedReceivingManagementDetails/(?P<pk>\d+)/$',
        another_views.NestedReceivingManagementDetails.as_view()),
    url(r'^NestedStockManagement/', another_views.NestedStockManagement.as_view()),
    url(r'^NestedStockManagementDetails/(?P<pk>\d+)/$',
        another_views.NestedStockManagementDetails.as_view()),
    url(r'^NestedRentalRegister/', another_views.NestedRentalRegister.as_view()),
    url(r'^NestedKembaliRentalRegister/', another_views.NestedKembaliRentalRegister.as_view()),
    url(r'^NestedRentalRegisterDetails/(?P<pk>[0-9]+)/$',
        another_views.NestedRentalRegisterDetails.as_view()),
    url(r'^NestedRentalOrderManagement/', another_views.NestedRentalOrderManagement.as_view()),
    url(r'^NestedRentalOrderManagementDetails/(?P<pk>[0-9]+)/$',
        another_views.NestedRentalOrderManagementDetails.as_view()),
    url(r'^NestedInvoiceManagement/', another_views.NestedInvoiceManagement.as_view()),
    url(r'^NestedInvoiceManagementDetails/(?P<pk>[0-9]+)/$', another_views.NestedInvoiceManagementDetails.as_view()),
    url(r'getItemByCat/(?P<b>\d+)/$', another_views.getItemByCategory, name='GetItemByCategory'),
    url(r'getItemByBarcode/(?P<b>\d+)/$', another_views.getItemByBarcode, name='GetItemByBarcode'),
    url(r'getItemSNs/(?P<i>\d+)/$', another_views.getItemSNs, name='GetSNsByItem'),
    url(r'getRentalOrderHeaderApproved/', another_views.getAllRentalOrderApproved, name="GetAllRentalRegisterApproved"),
    url(r'getItemSNsAvailable/(?P<i>\d+)/$', another_views.getItemSNsAvailable, name='GetSNsByItemAvailable'),
    url(r'^getUnapprovedHeader/(\d+)/', another_views.getUnapprovedHeader, name="GetUnapprovedHeader"),
    url(r'^getDistinctStocks/', another_views.getDistinctItem, name="GetDistinctStock"),
    url(r'^MasterEmployee/', another_views.MasterEmployee.as_view(), name="MasterEmployee"),
    url(r'^getHistoryBySN/(?P<i>\d+)/$', another_views.getStockHistoryBySN, name="GetHistoryBySN"),
    url(r'^getRentalWithFilter', another_views.getRentalWithFilter, name="GetRentalWithFilter"),
    url(r'^getAllPriceForHeader', another_views.getPrice, name="GetPriceForEachItemInHeaders"),
    url(r'^getAllPriceItem', another_views.getPriceMasterItem.as_view(), name="getAllPriceItem"),
    url(r'^returningStock', another_views.returnStock, name="ReturningStock"),
    url(r'^signup/', other_views.signup, name='signup'),
    url(r'^makeGroupPermission/', other_views.createGroup, name="createGroup"),
    url(r'^getUser/', other_views.getUser, name="GetUser"),
    url(r'^assignGroup/', other_views.assignGroupToUser, name="AssignGroupToUser"),
    url(r'^removeGroupFromUser/', other_views.removeGroupFromUser, name="RemoveGroupFromUser"),
    url(r'^editGroup/', other_views.editGroup, name="EditGroup"),
    url(r'^getAllGroup/', other_views.getAllGroups, name="GetAllGroups"),
    url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    #url baru
    url(r'^UserLevelPermission/', another_views.UserLevelPermission.as_view(), name="UserLevelPermission"),
    url(r'^createNewGroup/', other_views.createNewGroup, name="createNewGroup"),
]
