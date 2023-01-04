from django.contrib import admin

from pegapp import models as m


class ImageAdmin(admin.ModelAdmin):
    list_display = ('name', 'id', 'scenario')


class ScenarioAdmin(admin.ModelAdmin):
    list_display = ('name', 'duration', 'difficulty')


class RoomAdmin(admin.ModelAdmin):
    list_display = ('num', 'scenario')


admin.site.register(m.Image, ImageAdmin)
admin.site.register(m.Scenario, ScenarioAdmin)
admin.site.register(m.Room, RoomAdmin)
