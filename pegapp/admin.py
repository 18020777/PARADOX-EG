from django.contrib import admin

from pegapp import models as m


class UserAdmin(admin.ModelAdmin):
    list_display = ('username', 'is_superuser', 'is_staff')


class ImageAdmin(admin.ModelAdmin):
    list_display = ('name', 'id', 'scenario')


class ScenarioAdmin(admin.ModelAdmin):
    list_display = ('name', 'duration', 'difficulty')


class RoomAdmin(admin.ModelAdmin):
    list_display = ('num', 'scenario')


class BookingAdmin(admin.ModelAdmin):
    list_display = ('id', 'user', 'scenario', 'date', 'time', 'num_players', 'price', 'room', 'chrono')


class PricesListAdmin(admin.ModelAdmin):
    def has_add_permission(self, request):
        return False


class FAQElementAdmin(admin.ModelAdmin):
    list_display = ('question', 'answer')


admin.site.register(m.User, UserAdmin)
admin.site.register(m.Image, ImageAdmin)
admin.site.register(m.Scenario, ScenarioAdmin)
admin.site.register(m.Room, RoomAdmin)
admin.site.register(m.Booking, BookingAdmin)
admin.site.register(m.PricesList, PricesListAdmin)
admin.site.register(m.FAQElement, FAQElementAdmin)
