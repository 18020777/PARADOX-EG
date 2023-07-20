from rest_framework import serializers

from pegapp import models as m


class ScenarioSerializer(serializers.ModelSerializer):
    class Meta:
        model = m.Scenario
        fields = ('id', 'name', 'duration', 'difficulty', 'min_players', 'max_players',)


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = m.User
        fields = ('id', 'username', 'email', 'first_name', 'last_name')


class BookingSerializer(serializers.ModelSerializer):
    class Meta:
        model = m.Booking
        fields = (
            'id', 'user', 'scenario', 'date', 'time', 'num_players', 'room', 'start_time', 'gameover_time', 'chrono')


class BookingIdSerializer(serializers.Serializer):
    booking_id = serializers.IntegerField()
    action = serializers.CharField(max_length=20)


class PricesListSerializer(serializers.ModelSerializer):
    class Meta:
        model = m.PricesList
        fields = ('prices',)


class RoomSerializer(serializers.ModelSerializer):
    class Meta:
        model = m.Room
        fields = '__all__'
