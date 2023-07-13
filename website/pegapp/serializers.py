from rest_framework import serializers

from pegapp import models as m


class ScenarioSerializer(serializers.ModelSerializer):
    class Meta:
        model = m.Scenario
        fields = ('id', 'name', 'duration', 'difficulty', 'min_players', 'max_players',)


class BookingSerializer(serializers.ModelSerializer):
    class Meta:
        model = m.Booking
        fields = ('id', 'user', 'scenario', 'date', 'time', 'num_players',)


class PricesListSerializer(serializers.ModelSerializer):
    class Meta:
        model = m.PricesList
        fields = ('prices',)


class RoomSerializer(serializers.ModelSerializer):
    class Meta:
        model = m.Room
        fields = '__all__'
