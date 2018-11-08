from rest_framework import serializers
from .models import Schedule
from locations.serializers import LocationSerializer
from employees.serializers import EmployeeSerializer
from locations.models import Location
from employees.models import Employee

class ScheduleSerializer(serializers.ModelSerializer):
    location = LocationSerializer(many=False, read_only=True)
    employee = EmployeeSerializer(many=False, read_only=True)
    location_id = serializers.PrimaryKeyRelatedField(queryset=Location.objects.all(), write_only=True, source='location')
    employee_id = serializers.PrimaryKeyRelatedField(queryset=Employee.objects.all(), write_only=True, source='employee')
     
    
    class Meta:
        model = Schedule
        fields = "__all__"
