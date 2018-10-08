import django_filters
from django_filters.rest_framework import DjangoFilterBackend
from .models import Schedule
from .serializers import ScheduleSerializer
from rest_framework import generics, viewsets
from rest_framework.filters import SearchFilter
from rest_framework.pagination import PageNumberPagination


class ScheduleFilter(django_filters.FilterSet):
    start_lte = django_filters.DateTimeFilter(field_name='start', lookup_expr='lte')
    start_gte = django_filters.DateTimeFilter(field_name='start', lookup_expr='gte')
    school_id = django_filters.NumberFilter(field_name='school_id')
    teacher_id = django_filters.NumberFilter(field_name='teacher_id')
    class Meta:
        model = Schedule
        fields = ['start', 'start_lte', 'start_gte', 'teacher_id', 'school_id']
                                

class LargeResultsSetPagination(PageNumberPagination):
    page_size = 1000
    page_size_query_param = 'page_size'
    max_page_size = 10000

# url = events
# pagination for the calendar
class ScheduleListAPIView(generics.ListCreateAPIView):
    queryset = Schedule.objects.all().order_by('start')
    filter_backends = (DjangoFilterBackend, SearchFilter)
    search_fields = ('school_id','teacher_id')
    filter_class = ScheduleFilter
    pagination_class = LargeResultsSetPagination
    serializer_class = ScheduleSerializer

# url = schedules
# regular pagination for list page, search
class ScheduleViewSet(viewsets.ModelViewSet):
    queryset = Schedule.objects.all()
    filter_class = ScheduleFilter
    filter_backends = (DjangoFilterBackend, SearchFilter)
    search_fields = ('school_id','teacher_id','start')
    serializer_class = ScheduleSerializer
