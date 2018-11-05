import django_filters
from django_filters.rest_framework import DjangoFilterBackend
from .models import Attendance
from .serializers import AttendanceSerializer
from rest_framework import generics, viewsets
from rest_framework.filters import SearchFilter
from rest_framework.pagination import PageNumberPagination


class AttendanceFilter(django_filters.FilterSet):
    m = django_filters.NumberFilter(field_name='class_month')
    y = django_filters.NumberFilter(field_name='class_year')
    tid = django_filters.NumberFilter(field_name='id')
    class Meta:
        model = Attendance
        fields = ['m', 'y','tid']
                                

class LargeResultsSetPagination(PageNumberPagination):
    page_size = 1000
    page_size_query_param = 'page_size'
    max_page_size = 10000

# url = attendance
class AttendanceListAPIView(generics.ListCreateAPIView):
    queryset = Attendance.objects.all().order_by('teacher')
    filter_backends = (DjangoFilterBackend, SearchFilter)
    search_fields = ('school','teacher')
    filter_class = AttendanceFilter
    pagination_class = None
    serializer_class = AttendanceSerializer
