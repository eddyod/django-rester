from django.shortcuts import render
from rest_framework import generics
from .models import Schedule
from .serializers import ScheduleSerializer
from rest_framework.permissions import IsAdminUser
# Create your views here.

class ScheduleListAPIView(generics.ListCreateAPIView):
    queryset = Schedule.objects.all()
    serializer_class = ScheduleSerializer
    #permission_classes = (IsAdminUser,)
