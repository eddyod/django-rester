from rest_framework import serializers
#from django.contrib.auth.models import User
from rest_framework.validators import UniqueValidator

from .models import Attendance, Employee, Location, Schedule, Site, User, UserSite


class AttendanceSerializer(serializers.ModelSerializer):
    class Meta:
        model = Attendance
        fields = "__all__"

class EmployeeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Employee
        fields = '__all__'

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

class SiteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Site
        fields = "__all__"


class UserSerializer(serializers.ModelSerializer):
    first_name = serializers.CharField()
    last_name = serializers.CharField()
    email = serializers.EmailField(required=True,validators=[UniqueValidator(queryset=User.objects.all())])
    username = serializers.CharField(max_length=32, validators=[UniqueValidator(queryset=User.objects.all())])
    password = serializers.CharField(min_length=6, write_only=True)
    
    def create(self, validated_data):
        user = User(email=validated_data['email'],
        username=validated_data['username'],
        first_name = validated_data['first_name'],
        last_name = validated_data['last_name'] )
        user.set_password(validated_data['password'])
        user.save()
        return user

    class Meta:
        model = User
        fields = ('id', 'username', 'email', 'password', 'first_name', 'last_name', 'is_staff', 'is_superuser')

class UserSiteSerializer(serializers.ModelSerializer):
    user = UserSerializer(many=False, read_only=True)
    site = SiteSerializer(many=False, read_only=True)
    class Meta:
        model = UserSite
        fields = ('user','site')
