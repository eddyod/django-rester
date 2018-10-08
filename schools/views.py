from .models import School
from .serializers import SchoolSerializer
from rest_framework import generics, viewsets
from rest_framework.filters import SearchFilter
from rest_framework.pagination import PageNumberPagination

class LargeResultsSetPagination(PageNumberPagination):
    page_size = 1000
    page_size_query_param = 'page_size'
    max_page_size = 10000

# url = list-schools
# has default pagination and search
class SchoolListAPIView(generics.ListCreateAPIView):
    queryset = School.objects.all()
    filter_backends = (SearchFilter,)
    search_fields = ('name','isActive')
    serializer_class = SchoolSerializer

# url = schools
# no paging
class SchoolViewSet(viewsets.ModelViewSet):
    queryset = School.objects.all()
    pagination_class = None
    serializer_class = SchoolSerializer
