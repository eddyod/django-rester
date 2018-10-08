from rest_framework import serializers
from .models import Schedule
from schools.serializers import SchoolSerializer
from teachers.serializers import TeacherSerializer
from schools.models import School
from teachers.models import Teacher

class ScheduleSerializer(serializers.ModelSerializer):
    school = SchoolSerializer(many=False, read_only=True)
    teacher = TeacherSerializer(many=False, read_only=True)
    school_id = serializers.PrimaryKeyRelatedField(queryset=School.objects.all(), write_only=True, source='school')
    teacher_id = serializers.PrimaryKeyRelatedField(queryset=Teacher.objects.all(), write_only=True, source='teacher')
     
    
    class Meta:
        model = Schedule
        fields = "__all__"
