from django.conf.urls import url, include
from django.contrib import admin
from django.urls import path
from rest_framework.documentation import include_docs_urls

API_TITLE = 'Rental API'
API_DESCRIPTION = '...'

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include('myproject.api.urls')),
    url(r'docs/', include_docs_urls(title=API_TITLE, description=API_DESCRIPTION))
]

