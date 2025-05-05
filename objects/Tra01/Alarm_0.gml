// Cambiar de room
room_goto(Pasillo_LV1);

// Colocar al jugador en la posición correcta
x = storedTargetX;
y = storedTargetY;

// Asegurar que no esté atascado después de la transición
hspeed = 0;
vspeed = 0;