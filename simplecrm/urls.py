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
from django.conf.urls import url, include
from django.contrib import admin
from django.urls import path

from schools import views as school_views
from schedules import views as schedule_views
from teachers import views as teacher_views

from rest_framework.routers import DefaultRouter
router = DefaultRouter()
router.register(r'schools', school_views.SchoolViewSet)

urlpatterns = [
    path('admin/', admin.site.urls),
    path(r'schedules/', schedule_views.ScheduleListAPIView.as_view(), name='schedule-list'),
    path(r'teachers/', teacher_views.TeacherListAPIView.as_view(), name='teacher-list'),
    path(r'teacher/<int:pk>/', teacher_views.TeacherMember.as_view()),
]

urlpatterns += router.urls
#    path(r'schools/', school_views.SchoolListAPIView.as_view(), name='school-list'),
#    path(r'schools/<int:pk>/', school_views.SchoolMember.as_view(), name='school-get'),
#    path(r'schools/<int:pk>', school_views.SchoolMember.as_view(), name='school-put'),
