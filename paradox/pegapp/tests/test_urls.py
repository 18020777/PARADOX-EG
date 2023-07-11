from django.test import TestCase, Client
from django.urls import reverse, resolve

from pegapp.models import Scenario
from pegapp.views import (
    scenario_detail, LoginPage, SignUpPage, account, logout_user,
    BookingPage, home
)


class TestUrls(TestCase):
    def setUp(self):
        self.client = Client()

    def test_scenario_detail_url(self):
        # Create a new scenario for testing
        scenario = Scenario.objects.create(
            name='Test Scenario',
            description='This is a test scenario',
            difficulty=Scenario.Difficulty.normal
        )

        # Get the URL for the scenario detail page with the scenario's ID
        url = reverse('scenario-detail', args=[scenario.id])

        # Make a GET request to the URL
        response = self.client.get(url)

        # Assert that the response has a status code of 200 (OK)
        self.assertEqual(response.status_code, 200)
        self.assertEqual(resolve(url).func, scenario_detail)

    def test_login_url(self):
        url = reverse('login')
        response = self.client.get(url)
        self.assertEqual(response.status_code, 200)
        self.assertEqual(resolve(url).func.view_class, LoginPage)

    def test_signup_url(self):
        url = reverse('signup')
        response = self.client.get(url)
        self.assertEqual(response.status_code, 200)
        self.assertEqual(resolve(url).func.view_class, SignUpPage)

    def test_account_url(self):
        url = reverse('account')
        # response = self.client.get(url)
        self.assertEqual(resolve(url).func, account)

    def test_logout_url(self):
        url = reverse('logout')
        # response = self.client.get(url)
        self.assertEqual(resolve(url).func, logout_user)

    def test_book_url(self):
        url = reverse('book')
        response = self.client.get(url)
        self.assertEqual(response.status_code, 200)
        self.assertEqual(resolve(url).func.view_class, BookingPage)

    def test_home_url(self):
        url = reverse('home')
        response = self.client.get(url)
        self.assertEqual(response.status_code, 200)
        self.assertEqual(resolve(url).func, home)
