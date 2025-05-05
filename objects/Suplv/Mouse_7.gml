// En Obj_Button_NewGame (Evento Left Released)
if (position_meeting(mouse_x, mouse_y, self))
{
    room_goto(room_Prueba);
    
    show_debug_message("Nueva partida iniciada en la iglesia");
}