draw_set_alpha(0.5); // Transparencia
draw_set_color(c_blue); // Color rojo
draw_circle(x, y, colision_radio, false); // Dibujar la esfera
draw_set_alpha(1); // Restaurar transparencia normal
draw_set_alpha(0.3 + random(0.2)); // Le da un leve parpadeo  
draw_set_color(c_red);
draw_circle(x, y, colision_radio, false); // Círculo de luz alrededor
draw_set_alpha(1);