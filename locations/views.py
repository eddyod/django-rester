import django_filters
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import viewsets
from rest_framework.filters import SearchFilter, OrderingFilter
from rest_framework.pagination import PageNumberPagination


from .models import Location
from .serializers import LocationSerializer


class LargeResultsSetPagination(PageNumberPagination):
    page_size = 1000
    page_size_query_param = 'page_size'
    max_page_size = 10000


class SidFilter(django_filters.FilterSet):
    site_id = django_filters.NumberFilter(field_name='site_id')
    class Meta:
        fields = ['site_id']

# url = schools
# default pagination, search and sort
class LocationViewSet(viewsets.ModelViewSet):
    queryset = Location.objects.all()
    filter_backends = (DjangoFilterBackend, SearchFilter, OrderingFilter)
    filter_class = SidFilter
    search_fields = ('name','active')
    ordering_fields = '__all__'
    serializer_class = LocationSerializer
