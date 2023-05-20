from django.db import models

class hotelModel(models.Model):
    name = models.CharField(max_length=255)
    location = models.CharField(max_length=3000)
    rating = models.IntegerField()

class dishModel(models.Model):
    name = models.CharField(max_length=200)
    pic = models.ImageField(upload_to='foodImages/')
    type = models.CharField(max_length=50)
    quantity = models.IntegerField()
    description = models.CharField(max_length=500)

class menuModel(models.Model):
    hotel = models.OneToOneField("hotelModel", on_delete=models.CASCADE)
    dish = models.OneToOneField("dishModel", on_delete=models.CASCADE)
    price = models.IntegerField()
    category = models.CharField(max_length=50)
    
    
