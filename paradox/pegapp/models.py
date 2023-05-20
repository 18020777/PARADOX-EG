from django.contrib.auth.models import AbstractUser
from django.core.exceptions import ValidationError
from django.core.validators import MinValueValidator, MaxValueValidator
from django.db import models

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
    duration = models.fields.DurationField(default="01:00:00")
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

    def clean(self):
        super().clean()
        self.validate_booking_availability()

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

    def save(self, *args, **kwargs):
        self.full_clean()
        super().save(*args, **kwargs)

    def __str__(self):
        return f'{self.date} à {self.time} : {self.scenario}, {self.num_players} joueurs.'


class User(AbstractUser):
    pass
