from django.contrib import admin
from .models import Employee

class EmployeeAdmin(admin.ModelAdmin):
    list_display = ('name', 'email', 'address1', 'created', 'site')
    fields = ['name', 'email', 'address1']
    search_fields = ('name', )
    ordering = ['name']

admin.site.register(Employee, EmployeeAdmin)
