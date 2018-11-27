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


class UserSerializerXXX(serializers.ModelSerializer):
    first_name = serializers.CharField(required=False)
    last_name = serializers.CharField(required=False)
    email = serializers.EmailField(required=True,validators=[UniqueValidator(queryset=User.objects.all())])
    username = serializers.CharField(max_length=32, validators=[UniqueValidator(queryset=User.objects.all())])
    password = serializers.CharField(min_length=6, write_only=True)
    def create(self, validated_data):
        user = User.objects.create_user(
         first_name = validated_data['first_name'], 
         last_name = validated_data['last_name'], 
         username = validated_data['username'], 
         email = validated_data['email'])
        user.set_password(validated_data['password'])
        
        return user

    class Meta:
        model = User
        fields = ('id', 'first_name','last_name','username', 'email', 'is_superuser', 'password', 'is_staff')

class UserSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = User
        fields = ('id','username','email')

class UserSiteSerializer(serializers.ModelSerializer):
    user = UserSerializer(many=False, read_only=True)
    site = SiteSerializer(many=False, read_only=True)
    class Meta:
        model = UserSite
        fields = ('user','site')
