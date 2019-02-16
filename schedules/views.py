import django_filters
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import generics, viewsets
from rest_framework.filters import SearchFilter, OrderingFilter
from rest_framework.pagination import PageNumberPagination


from .models import Attendance, Schedule
from .serializers import AttendanceSerializer, ScheduleSerializer


class LargeResultsSetPagination(PageNumberPagination):
    page_size = 1000
    page_size_query_param = 'page_size'
    max_page_size = 10000


class SidFilter(django_filters.FilterSet):
    site_id = django_filters.NumberFilter(field_name='site_id')
    class Meta:
        fields = ['site_id']

class AttendanceFilter(django_filters.FilterSet):
    m = django_filters.NumberFilter(field_name='class_month')
    y = django_filters.NumberFilter(field_name='class_year')
    site_id = django_filters.NumberFilter(field_name='site_id')
    tid = django_filters.NumberFilter(field_name='id')
    class Meta:
        model = Attendance
        fields = ['m', 'y','tid','site_id']


# url = attendance
class AttendanceListAPIView(generics.ListCreateAPIView):
    queryset = Attendance.objects.all().order_by('employee')
    filter_backends = (DjangoFilterBackend, SearchFilter)
    search_fields = ('employee')
    filter_class = AttendanceFilter
    pagination_class = None
    serializer_class = AttendanceSerializer


class ScheduleFilter(django_filters.FilterSet):
    start_lte = django_filters.DateTimeFilter(field_name='start', lookup_expr='lte')
    start_gte = django_filters.DateTimeFilter(field_name='start', lookup_expr='gte')
    location = django_filters.CharFilter(field_name='location.name')
    employee = django_filters.CharFilter(field_name='user.name')
    location_id = django_filters.NumberFilter(field_name='location_id')
    employee_id = django_filters.NumberFilter(field_name='employee_id')
    site_id = django_filters.NumberFilter(field_name='site_id')
    class Meta:
        model = Schedule
        fields = ['start', 'start_lte', 'start_gte', 'location', 'employee', 'location_id', 'employee_id','site_id']

# url = events
# pagination for the calendar
class ScheduleListAPIView(generics.ListCreateAPIView):
    queryset = Schedule.objects.all().order_by('start')
    filter_backends = (DjangoFilterBackend, SearchFilter, OrderingFilter)
    search_fields = ('location_id','employee_id')
    ordering_fields = '__all__'
    filter_class = ScheduleFilter
    pagination_class = LargeResultsSetPagination
    serializer_class = ScheduleSerializer

# url = schedules
# regular pagination, search and sort
class ScheduleViewSet(viewsets.ModelViewSet):
    queryset = Schedule.objects.all()
    filter_backends = (SearchFilter, OrderingFilter)
    filter_backends = (DjangoFilterBackend, SearchFilter, OrderingFilter)
    filter_class = ScheduleFilter
    search_fields = ('location__name','employee__last_name','start')
    ordering_fields = '__all__'
    serializer_class = ScheduleSerializer
