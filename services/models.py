from django.db import models

class ServicesHotel(models.Model):
    service_name = models.CharField(unique=True, max_length=50)
    service_type = models.CharField(max_length=25)
    service_description = models.TextField()
    date_open = models.DateField()
    date_close = models.DateField()
    hour_open = models.TimeField()
    hour_close = models.TimeField()

    def __str__(self):
        return f"Nombre del Servicio: {self.service_name} | Tipo de Servicio: {self.service_type} | Descripcion del Servicio: {self.service_description}"