from rest_framework import viewsets
from rest_framework.filters import SearchFilter, OrderingFilter
#from django.contrib.auth.models import User
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status, permissions

from .models import User
from .serializers import UserSerializer
from sites.serializers import SiteSerializer

# for JWT
class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    filter_backends = (SearchFilter,OrderingFilter)
    search_fields = ('name','active')
    ordering_fields = '__all__'
    serializer_class = UserSerializer

# for current user: currentuser
class CurrentUserView(APIView):
    def get(self, request):
        serializer = UserSerializer(request.user)
        return Response(serializer.data)


# for anonymous user creation
# url=api/users
class UserCreateView(APIView):
    permission_classes = [permissions.AllowAny]

    def post(self, request, format='json'):
        serializer = UserSerializer(data=request.data)
        if serializer.is_valid():
            user = serializer.save()
            if user:
                #token = Token.objects.create(user=user)
                json = serializer.data
                #json['token'] = token.key
                return Response(json, status=status.HTTP_201_CREATED)

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    
# for anonymous site creation
# url=api/sites
class SiteCreateView(APIView):
    permission_classes = [permissions.AllowAny]

    def post(self, request, id, format='json'):
        serializer = SiteSerializer(data=request.data)
        if serializer.is_valid():
            site = serializer.save()
            if site:
                json = serializer.data
                return Response(json, status=status.HTTP_201_CREATED)

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
