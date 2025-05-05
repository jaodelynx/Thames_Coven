// Actualizar el porcentaje de progreso

var correct_sequence = [5, 3, 1, 4, 2];
var current_order = [];
var correct_count = 0;

// Obtener todas las botellas ordenadas de izquierda a derecha
var sorted_list = ds_list_create();
with (all) {
    if (string_copy(object_get_name(object_index), 1, 7) == "obj_bot") {
        ds_list_add(sorted_list, id);
    }
}

// Ordenar por posición X
ds_list_sort(sorted_list, function(a, b) {
    return a.x - b.x;
});

// Llenar la lista con los números actuales
for (var i = 0; i < ds_list_size(sorted_list); i++) {
    var bot = sorted_list[| i];
    array_push(current_order, bot.bottle_number);
    if (bot.bottle_number == correct_sequence[i]) {
        correct_count++;
    }
}

// Actualizar la barra
barra_progreso = (correct_count / 5) * 100;

// Puzzle completo
if (correct_count == 5) {
    show_message("¡Puzzle Completado!");
    instance_destroy(barra_prog);
    instance_destroy(self);
}

ds_list_destroy(sorted_list);