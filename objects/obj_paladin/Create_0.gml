// Definir los estados del personaje
enum ESTADO {
    IDLE,
    CAMINAR,
    SALTAR,
    DOBLESALTO,
    PATADADESLIZANTE,
    ATAQUERAPIDO,
    ATAQUEFUERTE,
    CORRER,
    GOLPEADO,
    DASH,
    DASHAEREO,
    AGACHADO,
    ATAQUERAPIDO_AGACHADO,
    ATAQUEFUERTE_AGACHADO,
    ATAQUERAPIDO_AEREO,
    ATAQUEFUERTE_AEREO,
    PATADA_AEREA,
    MORIR,  // Estado de muerte añadido
}

// Inicialización de variables
estado = ESTADO.IDLE;
velocidad_caminar = 10;
velocidad_correr = 16;
velocidad_dash = 28;
gravedad = 1;
salto_fuerza = -10;

hsp = 0;
vsp = 0;
vsp_max = 1;

puede_doblesaltar = true;
bloqueado = false;
facing = 1;

mask_index = spr_personaje_idle;

hitbox_creada = false;
fue_golpeado = false;

image_speed = 1;
image_xscale = 0.4;
image_yscale = 0.4;
sprite_index = spr_personaje_idle;

// Crear la hurtbox (colisión con el enemigo)
hurtbox = instance_create_layer(x, y, "Instances", obj_hurtbox);
hurtbox.owner = id; // El dueño será este personaje
hurtbox.offset_x = -10; // Ajusta según tu personaje
hurtbox.offset_y = -20; // Ajusta según tu personaje

// Inicialización de las variables de vida y mana
vida_maxima = 100;    // Vida máxima del personaje
mana_maxima = 50;     // Mana máximo del personaje

vida = vida_maxima;   // Vida actual del personaje
mana = mana_maxima;   // Mana actual del personaje

// Dimensiones de las barras
barra_vida_ancho = 100;
barra_mana_ancho = 100;
barra_altura = 10;

recuperacion_vida = 0.1; // Recuperación gradual de vida
recuperacion_mana = 0.09; // Recuperación gradual de mana

vida_minima = 0;
mana_minimo = 0;

// Función de daño en el jugador
function recibir_damage(p_damage) {
    vida -= p_damage;  // Restar vida
    if (vida <= 0) {
        estado = ESTADO.MORIR;  // Cambiar estado de muerte
        // Aquí podrías agregar una animación de muerte o un cambio de sprite.
    }
}

// En el Step Event, se podría agregar la lógica para el estado de muerte
switch (estado) {
    case ESTADO.MORIR:
        // Aquí iría la animación de muerte, o cualquier lógica necesaria para finalizar el juego
        sprite_index = spr_personaje_muerte; // Si tienes un sprite de muerte
        image_speed = 1;
        // Detener movimiento, etc.
        hsp = 0;
        vsp = 0;
        // Aquí podrías poner código adicional como reiniciar el nivel o mostrar un menú de game over.
    break;
    
    // Resto de los casos (IDLE, CAMINAR, etc.)...
}