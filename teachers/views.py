from .models import Teacher
from .serializers import TeacherSerializer
from rest_framework import generics, viewsets
from rest_framework.filters import SearchFilter

# url = list-teachers
# has default pagination and search
class TeacherListAPIView(generics.ListCreateAPIView):
    queryset = Teacher.objects.all()
    filter_backends = (SearchFilter,)
    search_fields = ('name','isActive')
    serializer_class = TeacherSerializer

    
# url = teachers
# no paging
class TeacherViewSet(viewsets.ModelViewSet):
    queryset = Teacher.objects.all()
    pagination_class = None
    serializer_class = TeacherSerializer
