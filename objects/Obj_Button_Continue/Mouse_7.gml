// En Obj_Button_Continue (Evento Left Released)
if (position_meeting(mouse_x, mouse_y, self))
{
    if (file_exists("save.sav")) {
        global.juego_nuevo = false;
        room_goto(room_iglesia); // Siempre volver a la iglesia
    } else {
        // Si no hay guardado, iniciar nueva partida EN LA IGLESIA
        global.juego_nuevo = true;
        with (obj_player1) {
            x = 128;
            y = 300;
        }
        room_goto(room_iglesia);
        show_message("No hay partida guardada\nIniciando nueva partida");
    }
}