// Estado
estado = "idle";
saltando = false;
direccion = 1;
hsp = 0;
// Movimiento
gravedad = 0.5;
vsp = 0;
velocidad_x = 4;
fuerza_salto = -20;

// Temporizador
tiempo_entre_saltos = 30;
contador_salto = irandom_range(30, tiempo_entre_saltos); // pequeño delay inicial

// Referencia al jugador
jugador = noone;

image_speed = 1;
image_xscale = 0.4;
image_yscale = 0.4;
sprite_index = Spr_kasa_idle;

// Inicializar vida
vida_maxima = 20;
vida = vida_maxima;  // Vida actual

// Inicializar hurtbox
hurtbox = instance_create_layer(x, y, "Instances", obj_hurtbox);
hurtbox.owner = id;  // El dueño será este objeto
hurtbox.offset_x = -10;  // Ajusta según tu personaje
hurtbox.offset_y = -20;  // Ajusta según tu personaje