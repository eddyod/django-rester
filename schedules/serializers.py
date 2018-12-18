from rest_framework import serializers

from .models import Attendance, Schedule
from employees.models import Employee
from locations.models import Location

from employees.serializers import EmployeeSerializer
from locations.serializers import LocationSerializer

class AttendanceSerializer(serializers.ModelSerializer):
    class Meta:
        model = Attendance
        fields = "__all__"

class ScheduleSerializer(serializers.ModelSerializer):
    location = LocationSerializer(many=False, read_only=True)
    employee = EmployeeSerializer(many=False, read_only=True)
    location_id = serializers.PrimaryKeyRelatedField(queryset=Location.objects.all(), write_only=True, source='location')
    employee_id = serializers.PrimaryKeyRelatedField(queryset=Employee.objects.all(), write_only=True, source='employee')

    class Meta:
        model = Schedule
        fields = "__all__"
