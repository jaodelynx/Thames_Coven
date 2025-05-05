// Objetivo que seguirá la cámara
var objetivo_x = obj_paladin.x;
var objetivo_y = obj_paladin.y;

// Margen para que la cámara no esté 100% centrada sino que deje espacio visual
var margen_x = view_wport[0] / 2;
var margen_y = view_hport[0] / 2;

// Posición destino (centrada en el personaje)
var destino_x = objetivo_x - margen_x;
var destino_y = objetivo_y - margen_y;

// Suavizado (cuanto más alto, más lento sigue)
var suavizado = 0.1;

// Interpolar (para hacer seguimiento suave)
var cam_x = camera_get_view_x(view_camera[0]);
var cam_y = camera_get_view_y(view_camera[0]);

cam_x = lerp(cam_x, destino_x, suavizado);
cam_y = lerp(cam_y, destino_y, suavizado);

// Aplicar nueva posición
camera_set_view_pos(view_camera[0], cam_x, cam_y);