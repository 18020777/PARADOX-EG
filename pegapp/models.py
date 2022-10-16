from django.db import models


class Scenario(models.Model):
    class Difficulty(models.IntegerChoices):
        very_easy = 1
        easy = 2
        normal = 3
        hard = 4
        very_hard = 5

    name = models.fields.CharField(max_length=50)
    description = models.fields.CharField(max_length=1000)
    duration = models.fields.DurationField(default="01:00:00")
    # images = models.field
    difficulty = models.fields.IntegerField(choices=Difficulty.choices)
