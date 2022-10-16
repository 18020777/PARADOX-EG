from django.contrib import admin

import pegapp.models as pm


class ScenarioAdmin(admin.ModelAdmin):
    list_display = ('name', 'duration', 'difficulty')


admin.site.register(pm.Scenario, ScenarioAdmin)
# Register your models here.
