from datetime import timedelta

from django.contrib.auth.models import AbstractUser
from django.core.exceptions import ValidationError
from django.core.validators import MinValueValidator, MaxValueValidator
from django.db import models
from django.utils.timezone import localtime
from rest_framework.authtoken.models import Token

from pegapp.utils import TimeChoices


class Scenario(models.Model):
    class Difficulty(models.IntegerChoices):
        very_easy = 1
        easy = 2
        normal = 3
        hard = 4
        very_hard = 5

    name = models.fields.CharField(max_length=50)
    description = models.fields.TextField(default="No description available.", max_length=1000)
    duration = models.fields.DurationField(default=timedelta(hours=1))
    difficulty = models.fields.IntegerField(choices=Difficulty.choices)
    min_players = models.fields.IntegerField(default=2, validators=[MinValueValidator(1), MaxValueValidator(10)])
    max_players = models.fields.IntegerField(default=5, validators=[MinValueValidator(1), MaxValueValidator(10)])
    scenery = models.ImageField(upload_to='pegapp/uploads/images/scenery/', default=None)

    def __str__(self):
        return str(self.name)


class Room(models.Model):
    num = models.fields.IntegerField(primary_key=True)
    scenario = models.ForeignKey(Scenario, blank=True, null=True, on_delete=models.SET_NULL)

    def __str__(self):
        return str('Room: ' + str(self.num))


class Image(models.Model):
    image = models.ImageField(upload_to='pegapp/uploads/images/gallery/')
    name = models.fields.CharField(max_length=20, default="No Name Image")
    scenario = models.ForeignKey(Scenario, blank=True, null=True, default=None, on_delete=models.SET_NULL)

    def __str__(self):
        return str(self.name)


class Booking(models.Model):
    user = models.ForeignKey('User', on_delete=models.CASCADE)
    scenario = models.ForeignKey('Scenario', on_delete=models.CASCADE)
    date = models.DateField()
    time = models.TimeField(choices=TimeChoices().time_choices)
    num_players = models.PositiveIntegerField()
    price = models.fields.DecimalField(default=0.00, decimal_places=2, max_digits=5, editable=False)
    start_time = models.DateTimeField(default=None, blank=True, null=True, editable=False)
    gameover_time = models.DateTimeField(default=None, blank=True, null=True, editable=False)
    chrono = models.fields.DurationField(default=timedelta(seconds=0), blank=True, null=True, editable=False)

    def clean(self):
        super().clean()
        self.validate_booking_availability()
        self.validate_num_players()

    def validate_booking_availability(self):
        total_rooms = Room.objects.filter(scenario=self.scenario).count()

        booked_rooms = Booking.objects.filter(
            scenario=self.scenario,
            date=self.date,
            time=self.time
        ).exclude(pk=self.pk)

        total_booked_rooms = booked_rooms.count()
        available_rooms = total_rooms - total_booked_rooms

        if available_rooms <= 0:
            raise ValidationError(f'Available rooms: {available_rooms}', code="fullbooked")

    def validate_num_players(self):
        min_players = Scenario.objects.get(id=self.scenario.id).min_players
        max_players = Scenario.objects.get(id=self.scenario.id).max_players

        if not min_players <= self.num_players <= max_players:
            raise ValidationError(
                f'Le nombre de joueurs doit être entre {min_players} et {max_players}.', code="invalid_num_players")

    def calculate_price(self):
        prices_list = PricesList.objects.get(id=1).prices
        player_price = prices_list.pop(str(self.num_players))
        self.price = player_price * self.num_players

    def save(self, *args, **kwargs):
        self.full_clean()
        self.calculate_price()
        super().save(*args, **kwargs)

    def is_finished(self):
        return self.chrono is not None and self.chrono != timedelta(seconds=0)

    def start_game(self):
        try:
            self.start_time = localtime()
            self.save()
        except Exception as e:
            print(f"An error occurred: {e}")

    def end_game(self):
        if self.start_time is not None:
            try:
                self.gameover_time = localtime()
                time_delta = self.gameover_time - self.start_time
                self.chrono = str(time_delta).split(".")[0]
                self.save()
            except Exception as e:
                print(f"An error occurred: {e}")
        else:
            raise(ValueError('The game has not started yet.'))

    def __str__(self):
        return f'{self.date} à {self.time} : {self.scenario}, {self.num_players} joueurs.'


class PricesList(models.Model):
    prices = models.JSONField(default=dict)

    def save(self, *args, **kwargs):
        self.pk = 1  # Set the primary key to a fixed value (1 in this case)
        super().save(*args, **kwargs)

    def delete(self, *args, **kwargs):
        pass  # Prevent deletion of the instance

    @classmethod
    def load(cls):
        instance, _ = cls.objects.get_or_create(pk=1)
        return instance

    def __str__(self):
        return str(self.prices)


class FAQElement(models.Model):
    question = models.fields.CharField(max_length=200)
    answer = models.fields.CharField(max_length=1000)

    def __str__(self):
        return str(self.question)


class User(AbstractUser):
    def __str__(self):
        return str(self.username)
