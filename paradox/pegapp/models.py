from django.contrib.auth.models import AbstractUser
from django.core.validators import MinValueValidator, MaxValueValidator
from django.db import models


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
    name = models.fields.CharField(max_length=20, default='No Name Image')
    scenario = models.ForeignKey(Scenario, blank=True, null=True, default=None, on_delete=models.SET_NULL)

    def __str__(self):
        return str(self.name)


class User(AbstractUser):
    pass
