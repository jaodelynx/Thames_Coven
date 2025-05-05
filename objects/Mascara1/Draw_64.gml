if (place_meeting(x, y, obj_player1)) {
    var view_x = camera_get_view_x(view_camera[0]);
    var view_y = camera_get_view_y(view_camera[0]);

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);
    
    // Dibujar el mensaje centrado en pantalla
    draw_text(x - view_x, y - view_y - 40, "Presiona E para interactuar");
}