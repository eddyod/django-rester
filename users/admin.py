from django.contrib import admin
from .models import User
from sites.models import Site


class UserAdmin(admin.ModelAdmin):
    list_display = ('id', 'first_name', 'last_name', 'email', 'is_staff', 'is_superuser', 'get_site')
    fields = ['first_name', 'last_name', 'email', 'is_staff', 'is_superuser', 'site', ]
    search_fields = ('first_name', 'last_name')
    ordering = ['last_name']

    def get_site(self, obj):
        site = Site.objects.get(pk=obj.site_id)
        return site


admin.site.register(User, UserAdmin)
