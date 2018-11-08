from .models import Employee
from .serializers import EmployeeSerializer
from rest_framework import viewsets
from rest_framework.filters import SearchFilter, OrderingFilter

    
# url = employees
# has default pagination, search and sort
class EmployeeViewSet(viewsets.ModelViewSet):
    queryset = Employee.objects.all()
    filter_backends = (SearchFilter,OrderingFilter)
    search_fields = ('name','active')
    ordering_fields = '__all__'
    serializer_class = EmployeeSerializer
