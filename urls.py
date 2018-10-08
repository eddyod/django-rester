"""simplecrm URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""

from django.contrib import admin
from django.urls import path, include

from schools import views as school_views
from schedules import views as schedule_views
from teachers import views as teacher_views

from rest_framework.routers import DefaultRouter
from rest_framework_jwt.views import obtain_jwt_token, refresh_jwt_token
router = DefaultRouter(trailing_slash=False)
router.register(r'schools', school_views.SchoolViewSet)
router.register(r'schedules', schedule_views.ScheduleViewSet)
router.register(r'teachers', teacher_views.TeacherViewSet)

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include(router.urls)),
    path(r'api-token-auth/', obtain_jwt_token),
    path(r'api-token-refresh/', refresh_jwt_token),
    path(r'events', schedule_views.ScheduleListAPIView.as_view(), name='event-list'),
    path(r'list-teachers', teacher_views.TeacherListAPIView.as_view(), name='teacher-list'),
    path(r'list-schools', school_views.SchoolListAPIView.as_view(), name='school-list'),
]

#urlpatterns += router.urls
#    path(r'school/<int:pk>', school_views.SchoolMember.as_view(), name='school-get'),
#    path(r'schedules/', schedule_views.ScheduleListAPIView.as_view(), name='schedule-list'),
#    path(r'teachers/', teacher_views.TeacherListAPIView.as_view(), name='teacher-list'),
#    path(r'teacher/<int:pk>/', teacher_views.TeacherMember.as_view()),
#    path(r'schools/', school_views.SchoolListAPIView.as_view(), name='school-list'),
#    path(r'schools/<int:pk>/', school_views.SchoolMember.as_view(), name='school-get'),
#    path(r'schools/<int:pk>', school_views.SchoolMember.as_view(), name='school-put'),
