// Verificar el orden actual de las botellas
var orden_actual = [];
var botellas = [];

// Guardar posición X y número de cada botella
with (objeto_botella) {
    array_push(botellas, {x: x, num: bottle_number});
}

// Ordenar por posición X
array_sort(botellas, function(a, b) { return a.x - b.x; });

// Extraer el orden de números
for (var i = 0; i < array_length(botellas); i++) {
    orden_actual[i] = botellas[i].num;
}

// Patrón objetivo
var objetivo = [3, 5, 2, 1, 4];

// Calcular cuántos están en la posición correcta
var correctos = 0;
for (var i = 0; i < 5; i++) {
    if (orden_actual[i] == objetivo[i]) {
        correctos++;
    }
}

// ✅ Actualizar barra de progreso si existe
if (instance_exists(obj_barra_prog)) {
    with (obj_barra_prog) {
        barra_progreso = (correctos / 5) * 100;
        if (barra_progreso == 100) {
            show_debug_message("🎉 ¡Es la  mezcla correcta!");
        }
    }
} else {
    show_debug_message("❌ No se encontró la barra de progreso.");
}