// Comprobar si el jugador está en contacto con la puerta
if (place_meeting(x, y, obj_player1)) {
    if (keyboard_check_pressed(ord("E"))) {
        instance_create_depth(0, 0, 10000, obj_transition); // Efecto de transición
        obj_player1.x = targetX;
        obj_player1.y = targetY;
        room_goto(targetRoom);
    }
}
