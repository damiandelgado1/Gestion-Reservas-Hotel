from django.db import models

class Bedroom(models.Model):
    room_number = models.PositiveIntegerField(
        primary_key=True,
        verbose_name="Nro. de la Habitacion"
    )
    room_type = models.TextField(null=True)
    bedrooms_number = models.PositiveIntegerField()
    bathroom_number = models.PositiveIntegerField()
    room_price = models.DecimalField(decimal_places=2, max_digits=8)
    room_availability = models.CharField(max_length=50)

    def __str__(self):
        return f"Habitacion {self.room_number}"