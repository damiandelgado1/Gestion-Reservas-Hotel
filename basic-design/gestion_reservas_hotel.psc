Algoritmo Gestion_Reservas_Hotel
	Definir i, hotel, room_number, bedrooms_number, option_menu, room_request, room_reservation, people_number, confirm_reservation, cancel_reservation, reservation Como Entero
	Definir entrance_date, exit_date, availability_room Como Texto
	
	i = 1
	hotel = 1
	reservation = 1
	
	Dimension room_number[10], bedrooms_number[10], availability_room[10]
	Dimension entrance_date[10], exit_date[10], people_number[10], confirm_reservation[10]
	
	Repetir
		Escribir "1. Añadir Habitacion en el Hotel"
		Escribir "2. Consulta disponibilidad de Habitaciones"
		Escribir "3. Realizar una Reserva en el Hotel"
		Escribir "4. Cancela Reserva"
		
		Leer option_menu
		
		Segun option_menu Hacer
			
			Caso 1:
				// Añade Habitaciones disponibles para ser Reservadas por los Clientes
				Escribir "Indique el Numero de la Habitacion"; Leer room_number[hotel]
				Escribir "¿Cuantos dormitorios tiene la Habitacion del Numero ", room_number[hotel],"?"; Leer bedrooms_number[hotel]
				Escribir "Disponibilidad de la Habitacion"; Leer availability_room[hotel]
				
				hotel = hotel + 1
				Escribir "Reserva agregada al Hotel"
				
			Caso 2:
				// Consulta Nro. y Disponibilidad de la Habitacion segun el Nro.
				Escribir "¿Cual es el Nro. de Habitacion que quieres consultar?"; Leer room_request
				
				Para i = 1 Hasta hotel Con Paso 1 Hacer
					Si room_request = room_number[i] Entonces
						Escribir "Disponibilidad de la Habitacion ", availability_room[i]
						Escribir "Nro. de Habitacion ", room_number[i]
						Escribir "Nro. de Dormitorios ", bedrooms_number[i]
					SiNo
						Escribir "La Habitacion no esta Disponible"	
					FinSi
				FinPara
				
			Caso 3:
				// Realiza reserva indicando:
				// - Nro. de Habitacion segun Disponibilidad
				// - Nro. de Personas segun Habitacion elegida
				// - Fecha de Entrada
				// - Fecha de Salida
				Escribir "Indique el Nro. de Habitacion que quiere Reservar "; Leer room_reservation
				
				Para i = 1 Hasta hotel Con Paso 1 Hacer
					Si room_reservation = room_number[i] Entonces
						Si availability_room[i] = "Disponible" Entonces
							Esperar 1 Segundos
							
							Escribir "La Habitacion tiene ", bedrooms_number[i], " Dormitorios"
							Escribir "¿Cuantas personas asisten a la Reserva? "; Leer people_number[reservation]
							
							Si people_number[reservation] <= bedrooms_number[i] Entonces
								Escribir "Indique la Fecha de Entrada de la Reserva "; Leer entrance_date[reservation]
								Escribir "Indique la Fecha de Salida de la Reserva "; Leer exit_date[reservation]
								
								availability_room[i] = "Reservado"
								reservation = reservation + 1
								Escribir "Reserva confirmada"
							SiNo
								Escribir "No se admiten mas de ", bedrooms_number[i], " Personas"
							FinSi
						SiNo
							Escribir "El Nro. de Habitacion ya esta Reservada"
						FinSi
					FinSi
				FinPara
				
			Caso 4:
				// Cancela Reserva Indicando:
				// - Nro de Habitacion reservado
				Escribir "¿Cual es el Nro. de Habitacion que quiere Cancelar? "; Leer cancel_reservation
				
				Para i = 1 Hasta reservation-1 Hacer
					Si availability_room[i] = "Reservado" Entonces
						availability_room[i] = "Disponible"
						
						reservation = reservation - 1
						Escribir "Reserva Cancelada"
					FinSi
				FinPara
				
			De Otro Modo:
				Escribir ""
		FinSegun
		
	Hasta Que (option_menu == 5)
FinAlgoritmo