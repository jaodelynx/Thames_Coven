// Coordenadas de la cabeza del enemigo convertidas a GUI
var x_gui = camera_get_view_x(view_camera[0]);
var y_gui = camera_get_view_y(view_camera[0]);

var pos_x = x - x_gui;
var pos_y = y - y_gui - 50; // 32 píxeles sobre la cabeza (ajustalo si querés)

// Tamaño de la barra
var ancho = 100;
var alto = 6;

// Vida proporcional
var vida_max = 100; // Asegurate de definir esto en el objeto
var porcentaje = clamp(vida / vida_max, 0, 1);

// Colores y bordes
draw_set_color(c_black);
draw_rectangle(pos_x - 1, pos_y - 1, pos_x + ancho + 1, pos_y + alto + 1, false);

draw_set_color(c_red);
draw_rectangle(pos_x, pos_y, pos_x + (ancho * porcentaje), pos_y + alto, false);