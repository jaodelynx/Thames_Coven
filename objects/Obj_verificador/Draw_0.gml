draw_set_color(c_white);
draw_rectangle(50, 50, 50 + barra_progreso * 2, 70, false);
draw_text(60, 45, string(barra_progreso) + "%");