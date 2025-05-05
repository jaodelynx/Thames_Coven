// En Obj_Button_NewGame (Evento Left Released)
if (position_meeting(mouse_x, mouse_y, self))
{
    // 1. Borrar archivo existente
    if (file_exists("save.sav")) {
        file_delete("save.sav");
    }
    
    // 2. Reiniciar variables
    global.juego_nuevo = true;
    global.vida = 100;
    
    // 3. Posición inicial EN LA IGLESIA
    with (obj_player1) {
        x = 128; // Posición X dentro de la iglesia
        y = 300; // Posición Y dentro de la iglesia
    }
    
    // 4. Ir directamente a room_iglesia
    room_goto(room_iglesia);
    
    show_debug_message("Nueva partida iniciada en la iglesia");
}