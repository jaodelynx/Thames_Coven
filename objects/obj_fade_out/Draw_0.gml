// Dibuja un rectángulo negro que se desvanece
var _alpha = lerp(0, 1, fadeTimer / 30);  // Ajusta 30 al mismo valor que fadeTimer
draw_set_alpha(_alpha);
draw_set_color(c_black);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_alpha(1);