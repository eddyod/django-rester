import django_filters
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import viewsets
from rest_framework.filters import SearchFilter, OrderingFilter

from .models import Employee
from .serializers import EmployeeSerializer

class SidFilter(django_filters.FilterSet):
    site_id = django_filters.NumberFilter(field_name='site_id')
    class Meta:
        fields = ['site_id']
                        

# url = employees
# has default pagination, search and sort
class EmployeeViewSet(viewsets.ModelViewSet):
    queryset = Employee.objects.all()
    filter_backends = (DjangoFilterBackend, SearchFilter, OrderingFilter)
    filter_class = SidFilter
    search_fields = ('name','active')
    ordering_fields = '__all__'
    serializer_class = EmployeeSerializer
