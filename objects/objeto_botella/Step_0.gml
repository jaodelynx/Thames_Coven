// Escalar sprite (por si aún no se ha aplicado)
image_xscale = 0.2;
image_yscale = 0.2;

// Asignar el sprite correspondiente al número de botella
switch (bottle_number) {
    case 1: sprite_index = spr_botella1; break;
    case 2: sprite_index = spr_botella2; break;
    case 3: sprite_index = spr_botella3; break;
    case 4: sprite_index = spr_botella4; break;
    case 5: sprite_index = spr_botella5; break;
    default: sprite_index = spr_botella1; break;
}

// Intercambio de posiciones
if (mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id)) {
    show_debug_message("🧪 Botella seleccionada: ID " + string(id));

    var closest = noone;
    var closest_dist = 99999;

    with (objeto_botella) {
        if (id != other.id) {
            var dist = abs(x - other.x);
            show_debug_message("🔎 Distancia con botella ID " + string(id) + ": " + string(dist));

            if (dist < 300 && dist < closest_dist) {
                closest = id;
                closest_dist = dist;
            }
        }
    }

    if (closest != noone) {
        var temp = x;
        x = closest.x;
        closest.x = temp;

        show_debug_message("✔️ Intercambio realizado con ID: " + string(closest));
    } else {
        show_debug_message("❌ No hay botellas cercanas para intercambiar.");
    }
}