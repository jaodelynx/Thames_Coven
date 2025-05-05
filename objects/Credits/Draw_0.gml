draw_set_halign(fa_center);
draw_set_valign(fa_top);

draw_text_ext(pos_x, pos_y, texto, 20, room_width - 100);

draw_set_font(fnt_texto);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_text_ext(pos_x, pos_y, texto, 20, room_width - 100);
draw_text_ext(room_width / 2, pos_y, texto, 20, room_width - 100);
draw_set_color(c_black);