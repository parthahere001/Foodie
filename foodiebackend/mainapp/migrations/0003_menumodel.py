# Generated by Django 4.1 on 2023-05-20 09:59

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ("mainapp", "0002_dishmodel"),
    ]

    operations = [
        migrations.CreateModel(
            name="menuModel",
            fields=[
                (
                    "id",
                    models.BigAutoField(
                        auto_created=True,
                        primary_key=True,
                        serialize=False,
                        verbose_name="ID",
                    ),
                ),
                ("price", models.IntegerField()),
                ("category", models.CharField(max_length=50)),
                (
                    "dish",
                    models.OneToOneField(
                        on_delete=django.db.models.deletion.CASCADE,
                        to="mainapp.dishmodel",
                    ),
                ),
                (
                    "hotel",
                    models.OneToOneField(
                        on_delete=django.db.models.deletion.CASCADE,
                        to="mainapp.hotelmodel",
                    ),
                ),
            ],
        ),
    ]