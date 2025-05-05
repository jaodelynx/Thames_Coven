// Buscar al jugador
if (instance_exists(obj_paladin)) {
    var jugador = instance_nearest(x, y, obj_paladin); // Referencia al jugador más cercano

    // Movimiento hacia el jugador
    var dx = jugador.x - x;
    var dy = jugador.y - y;
    var distancia = point_distance(x, y, jugador.x, jugador.y);

    if (distancia > 12 && estado != "morir") {
        hsp = sign(dx) * 1.5; // Movimiento horizontal hacia el jugador

        // Saltar si estamos en el suelo
        if (place_meeting(x, y + 1, obj_suelo) && !saltando) {
            vsp = -15;  // Fuerza de salto
            estado = "saltar";  // Cambiar a estado de salto
            saltando = true;    // Marcar que está saltando
        }
    }
}

// GRAVEDAD (aplicar solo una vez por paso)
vsp += gravedad;

// Mover en vertical
if (place_meeting(x, y + vsp, obj_suelo)) {
    while (!place_meeting(x, y + sign(vsp), obj_suelo)) {
        y += sign(vsp); // Ajustar la posición si hay colisión
    }
    vsp = 0; // Detener la velocidad vertical al tocar el suelo
}

y += vsp; // Aplicar el movimiento vertical

// Mover en horizontal
x += hsp;

// Si aterrizamos, detener el salto
if (place_meeting(x, y + 1, obj_suelo)) {
    if (saltando) {
        estado = "idle";  // Cambiar a estado de reposo
        saltando = false; // Detener el salto
    }
}

// DAÑO AL JUGADOR (revisar colisiones con hurtboxes)
with (obj_hurtbox) {
    if (place_meeting(x, y, other)) {  // Si la hurtbox colisiona con el jugador
        if (other.owner != noone) {  // Asegurarse de que el jugador existe
            other.owner.recibir_damage(10);  // Aplicar el daño al jugador
        }
    }
}

// Verificar si ha recibido daño
if (vida <= 0) {
    estado = "morir";  // Cambiar el estado a "morir"
    // Aquí podrías agregar efectos visuales o sonidos de muerte
    instance_destroy();  // Destruir el Obake al morir
}

// Cambiar sprite según estado
switch (estado) {
    case "idle":
        sprite_index = Spr_kasa_idle;
        image_speed = 0.2;  // Velocidad de la animación
        break;
    case "saltar":
        sprite_index = spr_kasa_saltar;
        image_speed = 0.3;  // Velocidad de la animación
        break;
    case "morir":
        sprite_index = spr_kasa_morir;  // Cambiarlo por la animación de muerte
        image_speed = 0.2;
        break;
}