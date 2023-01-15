from django.contrib import admin
from django.contrib.auth import get_user_model
from pegapp import models as m

User = get_user_model()


class UserAdmin(admin.ModelAdmin):
    list_display = ('username', 'is_superuser', 'is_staff')


class ImageAdmin(admin.ModelAdmin):
    list_display = ('name', 'id', 'scenario')


class ScenarioAdmin(admin.ModelAdmin):
    list_display = ('name', 'duration', 'difficulty')


class RoomAdmin(admin.ModelAdmin):
    list_display = ('num', 'scenario')


admin.site.register(m.User, UserAdmin)
admin.site.register(m.Image, ImageAdmin)
admin.site.register(m.Scenario, ScenarioAdmin)
admin.site.register(m.Room, RoomAdmin)
