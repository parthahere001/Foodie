from django.contrib import admin
from .models import hotelModel, dishModel, menuModel, cartModel, promocodesModel, userPropertiesModel

admin.site.register(hotelModel)
admin.site.register(dishModel)
admin.site.register(menuModel)
admin.site.register(cartModel)
admin.site.register(promocodesModel)
admin.site.register(userPropertiesModel)