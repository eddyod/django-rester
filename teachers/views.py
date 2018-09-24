from django.shortcuts import render
from rest_framework import generics
from .models import Teacher
from .serializers import TeacherSerializer
from rest_framework.permissions import IsAdminUser
# Create your views here.

class TeacherListAPIView(generics.ListCreateAPIView):
    queryset = Teacher.objects.all()
    serializer_class = TeacherSerializer
    #permission_classes = (IsAdminUser,)

class TeacherMember(generics.RetrieveUpdateDestroyAPIView):
    queryset = Teacher.objects.all()
    serializer_class = TeacherSerializer
