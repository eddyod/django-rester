from .models import Teacher
from .serializers import TeacherSerializer
from rest_framework import viewsets
from rest_framework.filters import SearchFilter, OrderingFilter

    
# url = teachers
# has default pagination, search and sort
class TeacherViewSet(viewsets.ModelViewSet):
    queryset = Teacher.objects.all()
    filter_backends = (SearchFilter,OrderingFilter)
    search_fields = ('name','isActive')
    ordering_fields = '__all__'
    serializer_class = TeacherSerializer
