from django.contrib import admin
from .models import Site
from users.models import User

class SiteAdmin(admin.ModelAdmin):
    list_display = ('id', 'name', 'created', 'active', 'created', 'get_owner')
    fields = ['name', 'active', 'owner']
    search_fields = ('name', )
    ordering = ['name']

    def get_owner(self, obj):
        user = User.objects.get(pk=obj.owner)
        return user
admin.site.register(Site, SiteAdmin)
