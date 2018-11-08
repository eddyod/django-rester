from .models import Location
from .serializers import LocationSerializer
from rest_framework import viewsets
from rest_framework.filters import SearchFilter, OrderingFilter


# url = schools
# default pagination, search and sort
class LocationViewSet(viewsets.ModelViewSet):
    queryset = Location.objects.all()
    filter_backends = (SearchFilter,OrderingFilter)
    search_fields = ('name','active')
    ordering_fields = '__all__'
    serializer_class = LocationSerializer
