import django_filters
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import generics, viewsets
from rest_framework.filters import SearchFilter, OrderingFilter
from rest_framework.pagination import PageNumberPagination
#from django.contrib.auth.models import User
from rest_framework.views import APIView
from rest_framework.generics import CreateAPIView
from rest_framework.response import Response
from rest_framework import status, permissions
from django.contrib.auth import get_user_model # 


from .models import Attendance, Employee, Location, Schedule, Site, User, UserSite
from .serializers import AttendanceSerializer, EmployeeSerializer, LocationSerializer, ScheduleSerializer, SiteSerializer,  UserSerializer, UserSiteSerializer


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


# url = employees
# has default pagination, search and sort
class EmployeeViewSet(viewsets.ModelViewSet):
    queryset = Employee.objects.all()
    filter_backends = (DjangoFilterBackend, SearchFilter, OrderingFilter)
    filter_class = SidFilter
    search_fields = ('name','active')
    ordering_fields = '__all__'
    serializer_class = EmployeeSerializer


# url = schools
# default pagination, search and sort
class LocationViewSet(viewsets.ModelViewSet):
    queryset = Location.objects.all()
    filter_backends = (DjangoFilterBackend, SearchFilter, OrderingFilter)
    filter_class = SidFilter
    search_fields = ('name','active')
    ordering_fields = '__all__'
    serializer_class = LocationSerializer

class ScheduleFilter(django_filters.FilterSet):
    start_lte = django_filters.DateTimeFilter(field_name='start', lookup_expr='lte')
    start_gte = django_filters.DateTimeFilter(field_name='start', lookup_expr='gte')
    location = django_filters.CharFilter(field_name='location.name')
    employee = django_filters.CharFilter(field_name='user.name')
    location_id = django_filters.NumberFilter(field_name='location_id')
    employee_id = django_filters.NumberFilter(field_name='user_id')
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

# url = sites
# default pagination, search and sort
class SiteViewSet(viewsets.ModelViewSet):
    queryset = Site.objects.all()
    filter_backends = (SearchFilter,OrderingFilter)
    search_fields = ('name',)
    ordering_fields = '__all__'
    serializer_class = SiteSerializer

# for JWT
class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    filter_backends = (SearchFilter,OrderingFilter)
    search_fields = ('name','active')
    ordering_fields = '__all__'
    serializer_class = UserSerializer

# for current user: currentuser
class CurrentUserView(APIView):
    def get(self, request):
        serializer = UserSerializer(request.user)
        return Response(serializer.data)


# for register user
class UserCreateXXX(generics.ListCreateAPIView):
    """ Creates the user. """
    permission_classes = [permissions.AllowAny]
    def post(self, request, format='json'):
        serializer = UserSerializer(data=request.data)
        if serializer.is_valid():
            user = serializer.save()
            if user:
                return Response(serializer.data, status=status.HTTP_201_CREATED)
            
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class UserCreateView(APIView):
    """ 
    Creates the user. 
    """
    permission_classes = [permissions.AllowAny]

    def post(self, request, format='json'):
        serializer = UserSerializer(data=request.data)
        if serializer.is_valid():
            user = serializer.save()
            if user:
                #token = Token.objects.create(user=user)
                json = serializer.data
                #json['token'] = token.key
                return Response(json, status=status.HTTP_201_CREATED)

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class CreateUserView(CreateAPIView):

    model = get_user_model()
    permission_classes = [
        permissions.AllowAny # Or anon users can't register
    ]
    serializer_class = UserSerializer
    
class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    permission_classes = [permissions.AllowAny]
    serializer_class = UserSerializer
    
class UserSiteFilter(django_filters.FilterSet):
    user_id = django_filters.NumberFilter(field_name='user_id')
    site_id = django_filters.NumberFilter(field_name='site_id')
    class Meta:
        model = UserSite
        fields = ['user_id', 'site_id']


# url = user_sites
class UserSiteViewSet(viewsets.ModelViewSet):
    queryset = UserSite.objects.all()
    filter_backends = (DjangoFilterBackend, SearchFilter)
    filter_class = UserSiteFilter
    pagination_class = None
    serializer_class = UserSiteSerializer

            
            
