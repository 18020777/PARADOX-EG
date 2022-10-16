from django.contrib import admin

import pegapp.models as pm


class ImageAdmin(admin.ModelAdmin):
    list_display = ('image', 'id')


class ScenarioAdmin(admin.ModelAdmin):
    list_display = ('name', 'duration', 'difficulty')


admin.site.register(pm.Image, ImageAdmin)
admin.site.register(pm.Scenario, ScenarioAdmin)
