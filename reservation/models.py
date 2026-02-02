from django.db import models

class MakeReservation(models.Model):
    room_type = models.ForeignKey(null=True, to="bedrooms.Bedroom", on_delete=models.CASCADE)
    person_number = models.IntegerField()
    date_entrance = models.DateField()
    date_exit = models.DateField()
    hour_entrance = models.TimeField()
    hour_exit = models.TimeField()
    total_price = models.DecimalField(decimal_places=2, max_digits=8)

    def __str__(self):
        return f"Tipo de Habitacion: {self.room_type} | Fecha y Hora de Entrada: {self.date_entrance} a las {self.hour_entrance} | Fecha y Hora de Salida: {self.date_exit} a las {self.hour_exit} | Total a Pagar: {self.total_price}"