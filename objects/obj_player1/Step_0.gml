// 🌀 Reiniciar velocidad horizontal
hspeed = 0;

// 📍 Guardar la posición anterior
var previous_x = x;
var previous_y = y;

// ⬅ Movimiento a la izquierda
if (keyboard_check(vk_left) || keyboard_check(ord("A"))) {
    hspeed = -moveSpeed;
    isFacingRight = false;
}

// ➡ Movimiento a la derecha
if (keyboard_check(vk_right) || keyboard_check(ord("D"))) {
    hspeed = moveSpeed;
    isFacingRight = true;
}

// 🚶 Aplicar movimiento horizontal
x += hspeed;

// 🎞 Cambiar sprite de animación
sprite_index = (hspeed != 0) ? anim_walk : anim_idle;

// ↔ Ajustar dirección del sprite
image_xscale = isFacingRight ? 0.6 : -0.6;

// 🔒 Limitar movimiento horizontal en la room
x = clamp(x, 50, 1350);

// 💨 DETECCIÓN DE EMPUJE POR ZONA
var zona_emp = instance_nearest(x, y, obj_zona_empuje);
if (instance_exists(zona_emp)) {
    var distancia = point_distance(x, y, zona_emp.x, zona_emp.y);
    if (distancia < zona_emp.colision_radio) {
        var direccion = point_direction(zona_emp.x, zona_emp.y, x, y);
        x += lengthdir_x(zona_emp.empuje_fuerza, direccion);
        y += lengthdir_y(zona_emp.empuje_fuerza, direccion);
    }
}

// 🧍 Interacción con NPC
var _npc = instance_nearest(x, y, obj_npc);

if (instance_exists(_npc)) {
    // 🚫 Restringir paso si no ha hablado con el NPC
    if (variable_instance_exists(_npc, "hasTalked")) {
        if (!_npc.hasTalked && x > _npc.x - 30 && x < _npc.x + 30) {
            x = previous_x;
        }
    }

    // 🗣 Mostrar diálogo o ejecutar acción con "E"
    if (keyboard_check_pressed(ord("E"))) {
        _npc.doSomething = true;
        if (_npc.canTalk) {
            _npc.showDialog = true;
        }
    }
}

// 🐞 Depuración (puedes quitar esto luego)
show_debug_message("Posición X: " + string(x) + " | Posición Y: " + string(y));