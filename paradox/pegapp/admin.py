from django.contrib import admin

import pegapp.models as pm


class ImageAdmin(admin.ModelAdmin):
    list_display = ('image', 'id')


class ScenarioAdmin(admin.ModelAdmin):
    list_display = ('name', 'duration', 'difficulty')


class RoomAdmin(admin.ModelAdmin):
    list_display = ('num', 'scenario')


admin.site.register(pm.Image, ImageAdmin)
admin.site.register(pm.Scenario, ScenarioAdmin)
admin.site.register(pm.Room, RoomAdmin)
