from django.contrib import admin
from .models import Site

class SiteAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'created', 'active', 'created')
    fields = ['id', 'name', 'active', 'created',]
    search_fields = ('name', 'created')
    ordering = ['name']
    
admin.site.register(Site, SiteAdmin)
                    
