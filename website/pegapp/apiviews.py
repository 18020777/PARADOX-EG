from datetime import datetime

from django.utils import timezone
from rest_framework.authentication import TokenAuthentication
from rest_framework.authtoken.views import ObtainAuthToken
from rest_framework.authtoken.models import Token
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.viewsets import ReadOnlyModelViewSet, ModelViewSet

from pegapp import models as m
from pegapp import serializers as s
from pegapp.permissions import IsStaffAuthenticated, IsAdminAuthenticated
from pegapp.utils import TimeChoices


class ScenarioViewset(ReadOnlyModelViewSet):
    serializer_class = s.ScenarioSerializer

    def get_queryset(self):
        queryset = m.Scenario.objects.all()
        return queryset


class BookingViewset(ModelViewSet):
    serializer_class = s.BookingSerializer
    permission_classes = [IsStaffAuthenticated]

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


class BookingActionAPIView(APIView):
    @staticmethod
    def post(request):
        serializer = s.BookingIdSerializer(data=request.data)
        if serializer.is_valid():
            booking_id = serializer.validated_data['booking_id']
            action = serializer.validated_data['action']
            try:
                booking = m.Booking.objects.get(id=booking_id)
                if action == 'start_game':
                    booking.start_game()
                elif action == 'end_game':
                    booking.end_game()
                else:
                    return Response({'message': f'Action {action} could not be performed'})
                return Response({'message': 'Action performed successfully.'})
            except m.Booking.DoesNotExist:
                return Response({'message': 'Booking not found.'}, status=404)
        return Response(serializer.errors, status=400)


class AvailabilityView(APIView):

    @staticmethod
    def get(request):
        scenario = request.GET.get('scenario')
        date = request.GET.get('date')

        if scenario is not None and date is not None and datetime.strptime(date,
                                                                           '%Y-%m-%d').date() >= timezone.now().date():
            all_times = TimeChoices().time_choices
            av_times = []

            for time in all_times:
                total_rooms = m.Room.objects.filter(scenario=scenario).count()
                booked_rooms = m.Booking.objects.filter(scenario=scenario, date=date, time=time[0])
                total_booked_rooms = booked_rooms.count()
                if total_rooms - total_booked_rooms > 0:
                    av_times.append(time)

            return Response(av_times)

        else:
            raise ValueError('Missing or wrong parameter')


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


class CustomAuthToken(ObtainAuthToken):
    def post(self, request, *args, **kwargs):
        serializer = self.serializer_class(data=request.data,
                                           context={'request': request})
        serializer.is_valid(raise_exception=True)
        user = serializer.validated_data['user']
        token, created = Token.objects.get_or_create(user=user)
        return Response({
            'token': token.key,
            'user_id': user.pk,
        })


class IsStaffView(APIView):
    permission_classes = [IsStaffAuthenticated]

    @staticmethod
    def get(request):
        return Response({
            'is_staff': True,
        })


class IsAdminView(APIView):
    permission_classes = [IsAdminAuthenticated]

    @staticmethod
    def get(request):
        return Response({
            'is_admin': True,
        })
