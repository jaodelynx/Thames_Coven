var transition_speed = 5;
sprite_index = Inicio;

transition_speed = 0.05;
image_alpha = 1;

while (image_alpha > 0) { 
    image_alpha -= transition_speed;
    if (image_alpha < 0) image_alpha = 0;
    
    draw_set_color(c_black);
    draw_set_alpha(image_alpha);
    draw_rectangle(0, 0, display_get_width(), display_get_height(), false);
    draw_set_alpha(1);
    
     global.fading = true;
}


room_goto(Carta1);