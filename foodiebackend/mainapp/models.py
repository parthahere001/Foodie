from django.db import models

class hotelModel(models.Model):
    name = models.CharField(max_length=255)
    location = models.CharField(max_length=3000)
    rating = models.IntegerField()
