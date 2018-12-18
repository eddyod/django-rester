from rest_framework import serializers
from rest_framework.validators import UniqueValidator

from .models import Site

class SiteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Site
        fields = "__all__"
