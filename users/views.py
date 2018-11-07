from .models import User
from .serializers import UserSerializer
from rest_framework import viewsets
from rest_framework.filters import SearchFilter, OrderingFilter

    
# url = teachers
# has default pagination, search and sort
class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    filter_backends = (SearchFilter,OrderingFilter)
    search_fields = ('last_name',)
    ordering_fields = '__all__'
    serializer_class = UserSerializer
