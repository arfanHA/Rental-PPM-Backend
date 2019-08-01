from django.conf.urls import url, include
from django.contrib import admin
from django.urls import path
from rest_framework.documentation import include_docs_urls
from rest_framework.authtoken.views import obtain_auth_token

API_TITLE = 'Rental API'
API_DESCRIPTION = '...'

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include('myproject.api.urls')),
    path('api-token-auth/', obtain_auth_token, name="api_token_auth"),
    url(r'docs/', include_docs_urls(title=API_TITLE, description=API_DESCRIPTION))
]

