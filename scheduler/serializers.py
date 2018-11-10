from rest_framework import serializers
from django.contrib.auth.models import User
from rest_framework.validators import UniqueValidator

from .models import Attendance, Location, Schedule, Site, Employee


class SiteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Site
        fields = "__all__"

class UserSerializer(serializers.ModelSerializer):
    email = serializers.EmailField(required=True,validators=[UniqueValidator(queryset=User.objects.all())])
    username = serializers.CharField(max_length=32, validators=[UniqueValidator(queryset=User.objects.all())])
    password = serializers.CharField(min_length=6, write_only=True)

    def create(self, validated_data):
        user = User.objects.create_user(validated_data['username'], validated_data['email'],validated_data['password'])
        return user

    class Meta:
        model = User
        fields = ('id', 'username', 'email', 'password')

class EmployeeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Employee
        fields = ('password', 'first_name', 'last_name', 'email',)
        write_only_fields = ('password',)
        read_only_fields = ('is_staff', 'is_superuser', 'is_active', 'date_joined',)

class LocationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Location
        fields = "__all__"

class ScheduleSerializer(serializers.ModelSerializer):
    location = LocationSerializer(many=False, read_only=True)
    employee = EmployeeSerializer(many=False, read_only=True)
    location_id = serializers.PrimaryKeyRelatedField(queryset=Location.objects.all(), write_only=True, source='location')
    employee_id = serializers.PrimaryKeyRelatedField(queryset=Employee.objects.all(), write_only=True, source='employee')


    class Meta:
        model = Schedule
        fields = "__all__"

class AttendanceSerializer(serializers.ModelSerializer):

    class Meta:
        model = Attendance
        fields = "__all__"
