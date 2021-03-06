from rest_framework import serializers
from .models import User
from rest_framework.validators import UniqueValidator

from sites.serializers import SiteSerializer


class UserSerializer(serializers.ModelSerializer):
    first_name = serializers.CharField()
    last_name = serializers.CharField()
    is_staff = serializers.BooleanField()
    email = serializers.EmailField(required=True,validators=[UniqueValidator(queryset=User.objects.all())])
    password = serializers.CharField(min_length=6, write_only=True)
    site = SiteSerializer(many=False, read_only=True)

    def create(self, validated_data):
        user = User(email=validated_data['email'],
        first_name = validated_data['first_name'],
        last_name = validated_data['last_name'],
        is_staff = validated_data['is_staff'])
        is_superuser = False
        user.set_password(validated_data['password'])
        user.save()
        return user

    class Meta:
        model = User
        fields = ('id', 'email', 'password', 'first_name', 'last_name', 'is_staff', 'is_superuser', 'site')
