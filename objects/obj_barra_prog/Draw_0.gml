// Dibujar fondo
draw_set_color(c_gray);
draw_rectangle(x, y, x + 200, y + 20, false);

// Dibujar progreso (verde)
draw_set_color(c_lime);
draw_rectangle(x, y, x + (barra_progreso * 2), y + 20, false);

// Contorno
draw_set_color(c_black);
draw_rectangle(x, y, x + 200, y + 20, true);

// Porcentaje
draw_set_color(c_white);
draw_text(x + 80, y - 20, string(barra_progreso) + "%");