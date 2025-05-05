// Movimiento horizontal por defecto
hsp = 0;

if (instance_exists(obj_paladin)) {
    var jugador = instance_nearest(x, y, obj_paladin);

    // Girar sprite manteniendo el tamaño
    if (jugador.x < x) {
        image_xscale = -0.3; // Mira a la izquierda con escala fija
    } else {
        image_xscale = 0.3;  // Mira a la derecha con escala fija
    }

    image_yscale = 0.3; // Escala vertical fija

    // Calcular distancia y dirección
    var dx = jugador.x - x;
    var dy = jugador.y - y;
    var distancia = point_distance(x, y, jugador.x, jugador.y);

    // Estados
    if (distancia > 12 && estado != "atacar" && estado != "morir") {
        hsp = sign(dx) * velocidad_x;
        estado = "caminar";
    }
    else if (distancia <= 10 && estado != "morir") {
        estado = "atacar";
    }
    else if (estado != "atacar" && estado != "morir") {
        estado = "idle";
    }
}

// Aplicar gravedad
vsp += gravedad;

// Colisión vertical
if (place_meeting(x, y + vsp, obj_suelo)) {
    while (!place_meeting(x, y + sign(vsp), obj_suelo)) {
        y += sign(vsp);
    }
    vsp = 0;
}
y += vsp;

// Movimiento horizontal
x += hsp;

// Crear hitbox de ataque (una vez)
if (estado == "atacar" && !hitbox_ya_creada) {
    var h = instance_create_layer(x + sign(image_xscale) * 16, y, "Instances", obj_hitbox);
    h.owner = id;
    h.damage = 30;
    hitbox_ya_creada = true; // ← CORREGIDO: marcar que ya se creó
    alarm[0] = 20; // Vuelve a idle después de 20 frames
}

// Cambiar sprite según estado
switch (estado) {
    case "idle":
        sprite_index = spr_kappa_idle;
        image_speed = 0.2;
        break;

    case "caminar":
        sprite_index = spr_kappa_walk;
        image_speed = 1;
        break;

    case "atacar":
        sprite_index = spr_kappa_atk;
        image_speed = 1;
        break;

    case "morir":
        sprite_index = spr_kappa_idle; // Cambiar a spr_kappa_morir si lo tenés
        image_speed = 1;
        break;
}

// Muerte
if (vida <= 0 && estado != "morir") {
    estado = "morir";
    instance_destroy();
}

// Crear la hitbox solo cuando el Kappa está en estado de ataque
if (estado == "atacar" && !hitbox_ya_creada) {
    var h = instance_create_layer(x + sign(image_xscale) * 16, y, "Instances", obj_hitbox);
    h.owner = id;  // Asignar al dueño para referencia
    h.damage = 30;  // Establecer el daño de la hitbox
    hitbox_ya_creada = true;  // Asegurarse de que no se cree otra hitbox hasta que se destruya la anterior
    alarm[0] = 20;  // Volver al estado "idle" después de 20 frames
}