from django.db import models
from django.core.validators import MinValueValidator, MaxValueValidator


class Image(models.Model):
    image = models.ImageField(upload_to='pegapp/uploads/images/gallery/')

    def __str__(self):
        return str(self.image)


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
    images = models.ManyToManyField(Image)

    def __str__(self):
        return str(self.name)


class Room(models.Model):
    num = models.fields.IntegerField(primary_key=True)
    scenario = models.ForeignKey(Scenario, null=True, on_delete=models.SET_NULL)
