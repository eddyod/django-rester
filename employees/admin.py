from django.contrib import admin
from django.contrib.auth.models import User
from .models import Employee


class EmployeeAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'phone', 'address1', 'city','created','active')
    fields = ['name', 'email', 'phone', 'address1','active']
    search_fields = ('name',)
    ordering = ['name']
    
admin.site.register(Employee, EmployeeAdmin)
                


