from rest_framework.viewsets import ReadOnlyModelViewSet, ModelViewSet

from pegapp import models as m
from pegapp import serializers as s


class ScenarioViewset(ReadOnlyModelViewSet):
    serializer_class = s.ScenarioSerializer

    def get_queryset(self):
        queryset = m.Scenario.objects.all()
        return queryset


class BookingViewset(ModelViewSet):
    serializer_class = s.BookingSerializer

    def get_queryset(self):
        queryset = m.Booking.objects.all()
        user = self.request.GET.get('user')
        username = self.request.GET.get('username')
        scenario = self.request.GET.get('scenario')
        date = self.request.GET.get('date')
        time = self.request.GET.get('time')
        num_players = self.request.GET.get('num_players')

        if username is not None:
            user = m.User.objects.get(username=username)
        if user is not None:
            queryset = queryset.filter(user=user)
        if scenario is not None:
            queryset = queryset.filter(scenario=scenario)
        if date is not None:
            queryset = queryset.filter(date=date)
        if time is not None:
            queryset = queryset.filter(time=time)
        if num_players is not None:
            queryset = queryset.filter(num_players=num_players)
        return queryset


class RoomViewset(ReadOnlyModelViewSet):
    serializer_class = s.RoomSerializer

    def get_queryset(self):
        queryset = m.Room.objects.all()
        scenario = self.request.GET.get('scenario')

        if scenario is not None:
            queryset = queryset.filter(scenario=scenario)
        return queryset


class PricesViewset(ReadOnlyModelViewSet):
    serializer_class = s.PricesListSerializer

    def get_queryset(self):
        return m.PricesList.objects.filter(id=1)
