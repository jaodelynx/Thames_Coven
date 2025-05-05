// Estado
estado = "idle";
hitbox_ya_creada = false;
vida = 50;
velocidad_x = 0.5;
gravedad = 0.3;
hsp = 0;
vsp = 0;

// Movimiento
gravedad = 1;
vsp = 0;
velocidad_x = 2;  // Velocidad baja de movimiento
fuerza_salto = -15;

// Vida
vida_maxima = 300;
vida = vida_maxima;  // Vida inicial

// Temporizador
tiempo_entre_saltos = 30;
contador_salto = irandom_range(30, tiempo_entre_saltos); // pequeño delay inicial

// Referencia al jugador
jugador = noone;

image_speed = 1;
image_xscale = 0.4;
image_yscale = 0.4;
sprite_index = Spr_oni_idle; // Comienza con la animación idle

// Crear el hitbox en el evento "Crear" (Create Event)
hitbox = instance_create_layer(x, y, "Instances", obj_hitbox);  // Creación del hitbox
hitbox.owner = id;  // El dueño del hitbox es el propio objeto Kappa
hitbox.offset_x = -10;  // Ajustar según el sprite del Kappa
hitbox.offset_y = -20;  // Ajustar según el sprite del Kappanaje

// Salto fuera de la pantalla
if (estado == "saltar") {
    vsp = -15; // Comienza moviéndose hacia arriba

    if (y < -50) {  // Cuando alcanza una altura específica
        vsp = 20;   // Comienza a caer
    }

    if (y > jugador.y) {  // Cuando esté cerca del jugador
        y = jugador.y;   // Aterriza en la posición del jugador
        estado = "idle";  // Vuelve al estado idle después de aterrizar
    }
}

// Control para el salto (activar el salto cuando el enemigo está "idle")
if (estado == "idle" && irandom(100) < 5) {  // Activar salto aleatorio
    estado = "saltar";  // Cambiar al estado de salto
}