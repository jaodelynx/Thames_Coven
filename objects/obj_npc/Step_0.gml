// Buscar al jugador más cercano
var _player = instance_nearest(x, y, obj_player1);

if (instance_exists(_player)) {
    // Girar hacia el jugador
    if (_player.x < x) {
        image_xscale = -1; // Mirar a la izquierda
    } else {
        image_xscale = 1; // Mirar a la derecha
    }
    
    // Verificar si el jugador está en rango de interacción
    canTalk = (point_distance(x, y, _player.x, _player.y) < talk_range);
}

// Mostrar el mensaje de interacción cuando el jugador esté cerca
if (canTalk) {
    promptMessage = "Presiona E para hablar";
} else {
    promptMessage = "";
}

// Interacción al presionar "E"
if (keyboard_check_pressed(ord("E")) && canTalk) {
    showDialog = true;
}