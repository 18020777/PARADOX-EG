from datetime import datetime, time, timedelta

from django.contrib.auth import get_user_model
from django.test import TestCase

from pegapp.forms import SignUpForm, BookingForm
from pegapp.models import Scenario, Room


class SignUpFormTests(TestCase):
    def test_signup_form_valid_data(self):
        form = SignUpForm(data={'username': 'testuser', 'email': 'test@example.com',
                                'first_name': 'John', 'last_name': 'Doe',
                                'password1': 'testpassword', 'password2': 'testpassword'})
        self.assertTrue(form.is_valid())

    def test_signup_form_invalid_data(self):
        form = SignUpForm(data={'username': '', 'email': 'test@example.com',
                                'first_name': 'John', 'last_name': 'Doe',
                                'password1': 'testpassword', 'password2': 'testpassword'})
        self.assertFalse(form.is_valid())


class BookingFormTests(TestCase):
    def setUp(self):
        self.user = get_user_model().objects.create_user(username='testuser', password='testpassword')
        self.scenario = Scenario.objects.create(name='Test Scenario', difficulty=Scenario.Difficulty.normal)
        self.room = Room.objects.create(num=1, scenario=self.scenario)

    def test_booking_form_valid_data(self):
        form = BookingForm(user=self.user, data={'scenario': self.scenario.pk,
                                                 'date': datetime.now().date() + timedelta(days=1),
                                                 'time': time(hour=11), 'num_players': 4})
        self.assertTrue(form.is_valid(), form.errors.as_data())

    def test_booking_form_invalid_date(self):
        form = BookingForm(user=self.user, data={'scenario': self.scenario.pk,
                                                 'date': datetime.now().date() - timedelta(days=1),
                                                 'time': time(hour=11), 'num_players': 4})
        self.assertFalse(form.is_valid())

    def test_booking_form_invalid_time(self):
        form = BookingForm(user=self.user, data={'scenario': self.scenario.pk,
                                                 'date': datetime.now().date(),
                                                 'time': time(hour=datetime.now().hour), 'num_players': 4})
        self.assertFalse(form.is_valid())

    def test_booking_form_invalid_players(self):
        form = BookingForm(user=self.user, data={'scenario': self.scenario.pk,
                                                 'date': datetime.now().date() + timedelta(days=1),
                                                 'time': time(hour=11), 'num_players': 10})
        self.assertFalse(form.is_valid())

    def test_booking_form_save_method(self):
        form = BookingForm(user=self.user, data={'scenario': self.scenario.pk,
                                                 'date': datetime.now().date() + timedelta(days=1),
                                                 'time': time(hour=11), 'num_players': 4})
        booking = form.save()
        self.assertEqual(booking.user, self.user)
