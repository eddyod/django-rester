from django.contrib import admin
from .models import Location


class LocationAdmin(admin.ModelAdmin):
    list_display = ('name', 'email', 'address1', 'phone', 'created', 'site')
    fields = ['name', 'email', 'address1', 'phone']
    search_fields = ('name', )
    ordering = ['name']


admin.site.register(Location, LocationAdmin)
