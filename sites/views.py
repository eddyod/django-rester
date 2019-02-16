import django_filters
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import generics, viewsets
from rest_framework.filters import SearchFilter, OrderingFilter
from rest_framework.pagination import PageNumberPagination
from django.contrib.auth.models import User
from rest_framework.views import APIView
from rest_framework.generics import CreateAPIView
from rest_framework.response import Response
from rest_framework import status, permissions
from django.contrib.auth import get_user_model # 


from .models import Site
from .serializers import SiteSerializer


class LargeResultsSetPagination(PageNumberPagination):
    page_size = 1000
    page_size_query_param = 'page_size'
    max_page_size = 10000


# url = sites
# default pagination, search and sort
class SiteViewSet(viewsets.ModelViewSet):
    queryset = Site.objects.all()
    filter_backends = (SearchFilter,OrderingFilter)
    search_fields = ('name',)
    ordering_fields = '__all__'
    serializer_class = SiteSerializer
