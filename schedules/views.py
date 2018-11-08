import django_filters
from django_filters.rest_framework import DjangoFilterBackend
from .models import Schedule
from .serializers import ScheduleSerializer
from rest_framework import generics, viewsets
from rest_framework.filters import SearchFilter, OrderingFilter
from rest_framework.pagination import PageNumberPagination


class ScheduleFilter(django_filters.FilterSet):
    start_lte = django_filters.DateTimeFilter(field_name='start', lookup_expr='lte')
    start_gte = django_filters.DateTimeFilter(field_name='start', lookup_expr='gte')
    location = django_filters.CharFilter(field_name='location.name')
    employee = django_filters.CharFilter(field_name='employee.name')
    location_id = django_filters.NumberFilter(field_name='location_id')
    employee_id = django_filters.NumberFilter(field_name='employee_id')
    class Meta:
        model = Schedule
        fields = ['start', 'start_lte', 'start_gte', 'location', 'employee', 'location_id', 'employee_id']
                                

class LargeResultsSetPagination(PageNumberPagination):
    page_size = 1000
    page_size_query_param = 'page_size'
    max_page_size = 10000

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
    #filter_class = ScheduleFilter
    filter_backends = (SearchFilter, OrderingFilter)
    search_fields = ('location__name','employee__last_name','start')
    ordering_fields = '__all__'
    serializer_class = ScheduleSerializer

