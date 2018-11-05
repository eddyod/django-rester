from .models import School
from .serializers import SchoolSerializer
from rest_framework import viewsets
from rest_framework.filters import SearchFilter, OrderingFilter


# url = schools
# default pagination, search and sort
class SchoolViewSet(viewsets.ModelViewSet):
    queryset = School.objects.all()
    filter_backends = (SearchFilter,OrderingFilter)
    search_fields = ('name','isActive')
    ordering_fields = '__all__'
    serializer_class = SchoolSerializer
