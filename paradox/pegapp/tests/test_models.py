from django.core.exceptions import ValidationError
from django.test import TestCase
from django.utils import timezone

from pegapp.models import Scenario, Room, Booking, User, Image
from pegapp.utils import TimeChoices


class BookingModelTest(TestCase):
    def setUp(self):
        self.scenario = Scenario.objects.create(
            name='Test Scenario',
            difficulty=Scenario.Difficulty.normal
        )
        self.room = Room.objects.create(num=1, scenario=self.scenario)
        self.user = User.objects.create(username='testuser')
        self.date = timezone.now().date()
        self.time = TimeChoices().time_choices[0][0]  # Choose the first valid time choice
        self.booking = Booking(
            user=self.user,
            scenario=self.scenario,
            date=self.date,
            time=self.time,
            num_players=3
        )

    def test_booking_availability(self):
        booking = Booking(
            user=self.user,
            scenario=self.scenario,
            date=self.date,
            time=self.time,
            num_players=3
        )

        booking2 = Booking(
            user=self.user,
            scenario=self.scenario,
            date=self.date,
            time=self.time,
            num_players=3
        )

        booking.save()
        with self.assertRaises(ValidationError):
            booking2.full_clean()

    def test_save(self):
        booking = Booking(
            user=self.user,
            scenario=self.scenario,
            date=self.date,
            time=self.time,
            num_players=3
        )
        booking.save()

        saved_booking = Booking.objects.get(pk=booking.pk)
        self.assertEqual(saved_booking.user, self.user)
        self.assertEqual(saved_booking.scenario, self.scenario)
        self.assertEqual(saved_booking.date, self.date)
        self.assertEqual(saved_booking.time, self.time)
        self.assertEqual(saved_booking.num_players, 3)

    def test_string_representation(self):
        expected_string = f'{self.date} à {self.time} : {self.scenario}, 3 joueurs.'
        self.assertEqual(str(self.booking), expected_string)


class ScenarioModelTest(TestCase):
    def test_string_representation(self):
        scenario = Scenario(name='Test Scenario', difficulty=Scenario.Difficulty.normal)
        self.assertEqual(str(scenario), 'Test Scenario')


class RoomModelTest(TestCase):
    def test_string_representation(self):
        room = Room(num=1)
        self.assertEqual(str(room), 'Room: 1')


class UserModelTest(TestCase):
    def test_user_model(self):
        user = User(username='testuser')
        self.assertEqual(str(user), 'testuser')


class ImageModelTest(TestCase):
    def test_str_representation(self):
        image = Image(name='Test Image')
        self.assertEqual(str(image), 'Test Image')
