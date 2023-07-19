from datetime import timedelta

from django.core.exceptions import ValidationError
from django.test import TestCase

from pegapp.models import Scenario, Room, Image, Booking, PricesList, FAQElement, User




class ScenarioModelTest(TestCase):
    def setUp(self):
        self.scenario = Scenario.objects.create(
            name='Test Scenario',
            description='Test description',
            duration=timedelta(hours=1),
            difficulty=Scenario.Difficulty.normal,
            min_players=2,
            max_players=5
        )
        self.price_list = PricesList.objects.create(
            prices={"2": 38, "3": 32, "4": 27, "5": 23, "6": 21, "7": 20, "8": 19, "9": 18, "10": 17})

    def test_scenario_creation(self):
        self.assertEqual(self.scenario.name, 'Test Scenario')
        self.assertEqual(self.scenario.description, 'Test description')
        self.assertEqual(self.scenario.duration, timedelta(hours=1))
        self.assertEqual(self.scenario.difficulty, Scenario.Difficulty.normal)
        self.assertEqual(self.scenario.min_players, 2)
        self.assertEqual(self.scenario.max_players, 5)


class RoomModelTest(TestCase):
    def setUp(self):
        self.scenario = Scenario.objects.create(
            name='Test Scenario',
            description='Test description',
            duration=timedelta(hours=1),
            difficulty=Scenario.Difficulty.normal,
            min_players=2,
            max_players=5
        )
        self.room = Room.objects.create(num=1, scenario=self.scenario)

    def test_room_creation(self):
        self.assertEqual(self.room.num, 1)
        self.assertEqual(self.room.scenario, self.scenario)


class ImageModelTest(TestCase):
    def setUp(self):
        self.scenario = Scenario.objects.create(
            name='Test Scenario',
            description='Test description',
            duration=timedelta(hours=1),
            difficulty=Scenario.Difficulty.normal,
            min_players=2,
            max_players=5
        )
        self.image = Image.objects.create(
            image='test_image.jpg',
            name='Test Image',
            scenario=self.scenario
        )

    def test_image_creation(self):
        self.assertEqual(self.image.image, 'test_image.jpg')
        self.assertEqual(self.image.name, 'Test Image')
        self.assertEqual(self.image.scenario, self.scenario)


class BookingModelTest(TestCase):
    def setUp(self):
        self.price_list = PricesList.objects.create(
            prices={"2": 38, "3": 32, "4": 27, "5": 23, "6": 21, "7": 20, "8": 19, "9": 18, "10": 17})
        self.scenario = Scenario.objects.create(
            name='Test Scenario',
            description='Test description',
            duration=timedelta(hours=1),
            difficulty=Scenario.Difficulty.normal,
            min_players=2,
            max_players=5
        )
        self.room = Room.objects.create(
            num=1,
            scenario=self.scenario
        )
        self.user = User.objects.create(username='testuser')
        self.booking = Booking.objects.create(
            user=self.user,
            scenario=self.scenario,
            date='2023-07-18',
            time='10:00:00',
            num_players=3
        )

    def test_booking_creation(self):
        self.assertEqual(self.booking.user, self.user)
        self.assertEqual(self.booking.scenario, self.scenario)
        self.assertEqual(str(self.booking.date), '2023-07-18')
        self.assertEqual(str(self.booking.time), '10:00:00')
        self.assertEqual(self.booking.num_players, 3)

    def test_validate_booking_availability(self):
        booking = Booking(
            user=self.user,
            scenario=self.scenario,
            date='2023-07-18',
            time='10:00:00',
            num_players=3
        )
        self.assertRaises(
            ValidationError,
            booking.validate_booking_availability
        )

    def test_validate_num_players(self):
        booking = Booking(
            user=self.user,
            scenario=self.scenario,
            date='2023-07-18',
            time='11:00:00',
            num_players=6
        )
        self.assertRaises(
            ValidationError,
            booking.validate_num_players
        )

    def test_calculate_price(self):
        self.booking.calculate_price()
        self.assertEqual(float(self.booking.price), 32*3)

    def test_save(self):
        self.booking.save()
        self.assertEqual(float(self.booking.price), 32*3)

    def test_start_game(self):
        self.booking.start_game()
        self.assertIsNotNone(self.booking.start_time)

    def test_end_game(self):
        self.booking.start_game()
        self.booking.end_game()
        self.assertIsNotNone(self.booking.gameover_time)
        self.assertIsNotNone(self.booking.chrono)

    def test_str_representation(self):
        self.assertEqual(
            str(self.booking),
            '2023-07-18 à 10:00:00 : Test Scenario, 3 joueurs.'
        )


class PricesListModelTest(TestCase):
    def setUp(self):
        self.prices_list = PricesList.objects.create(prices={'2': 10.0, '3': 15.0})

    def test_prices_list_creation(self):
        self.assertEqual(self.prices_list.prices, {'2': 10.0, '3': 15.0})

    def test_save(self):
        self.prices_list.save()
        instance = PricesList.objects.get(pk=1)
        self.assertEqual(instance, self.prices_list)

    def test_delete(self):
        self.prices_list.delete()
        instance = PricesList.objects.get(pk=1)
        self.assertIsNotNone(instance)

    def test_load(self):
        instance = PricesList.load()
        self.assertEqual(instance, self.prices_list)

    def test_str_representation(self):
        self.assertEqual(str(self.prices_list), "{'2': 10.0, '3': 15.0}")


class FAQElementModelTest(TestCase):
    def setUp(self):
        self.faq_element = FAQElement.objects.create(
            question='Test Question',
            answer='Test Answer'
        )

    def test_faq_element_creation(self):
        self.assertEqual(self.faq_element.question, 'Test Question')
        self.assertEqual(self.faq_element.answer, 'Test Answer')

    def test_str_representation(self):
        self.assertEqual(str(self.faq_element), 'Test Question')


class UserModelTest(TestCase):
    def setUp(self):
        self.user = User.objects.create(username='testuser')

    def test_user_creation(self):
        self.assertEqual(str(self.user), 'testuser')
