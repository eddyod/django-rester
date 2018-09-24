from django.shortcuts import render
from rest_framework import generics
from .models import School
from .serializers import SchoolSerializer
from rest_framework.permissions import IsAdminUser
# Create your views here.

class SchoolListAPIView(generics.ListCreateAPIView):
    queryset = School.objects.all()
    serializer_class = SchoolSerializer
    #permission_classes = (IsAdminUser,)
