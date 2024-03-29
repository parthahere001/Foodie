from django.db import models
from django.contrib.auth.models import User

class hotelModel(models.Model):
    name = models.CharField(max_length=255)
    location = models.CharField(max_length=3000)
    rating = models.IntegerField(default=5)
    def __str__(self):
        return self.name

class dishModel(models.Model):
    name = models.CharField(max_length=200)
    pic = models.ImageField(upload_to='foodImages/')
    type = models.CharField(max_length=50)
    quantity = models.IntegerField()
    description = models.CharField(max_length=500)
    def __str__(self):
        return self.name

class menuModel(models.Model):
    hotel = models.OneToOneField(hotelModel, on_delete=models.CASCADE)
    dish = models.OneToOneField(dishModel, on_delete=models.CASCADE)
    price = models.IntegerField()
    category = models.CharField(max_length=50)
    def __str__(self):
     return self.hotel.name

class userPropertiesModel (models.Model):
    userprop = models.ForeignKey(User, on_delete=models.CASCADE)
    isOwner = models.OneToOneField(hotelModel, on_delete=models.CASCADE, blank=True)
    isDelivery = models.IntegerField()
    isAdmin = models.IntegerField()
    def __str__(self):
     return self.userprop.username
    

class cartModel(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    dishes = models.ManyToManyField(dishModel, blank=True)

    
class promocodesModel(models.Model):
    code = models.CharField(max_length=255)
    type = models.CharField(max_length=50)
    value = models.IntegerField()
    maxUse = models.IntegerField()
    usedtillnow = models.IntegerField()
    def __str__(self):
     return self.code


    