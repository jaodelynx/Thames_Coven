// Crear y mezclar números del 1 al 5
global.bottle_numbers = ds_list_create();
ds_list_add(global.bottle_numbers, 1, 2, 3, 4, 5);
ds_list_shuffle(global.bottle_numbers);

// Crear botellas
for (var i = 0; i < 5; i++) {
    var b = instance_create_layer(300 + i * 120, 250, "Instances", objeto_botella);
    b.bottle_number = ds_list_find_value(global.bottle_numbers, i);
    show_debug_message("✅ Botella creada con número: " + string(b.bottle_number));
}

// Crear barra de progreso — ASEGÚRATE del nombre del objeto
instance_create_layer(100, 100, "Instances", obj_barra_prog);

// Limpiar memoria
ds_list_destroy(global.bottle_numbers);