// Dibujar el sprite del personaje
draw_self();

// Definir el desplazamiento de las barras (por encima de la cabeza del personaje)
var barra_y_offset = -sprite_height - 5; // Coloca las barras encima del sprite, ajusta la distancia con -10

// Coordenadas para la barra de vida
var vida_x = x - (barra_vida_ancho / 2); // Centrar la barra sobre el personaje (ajusta según el tamaño de la barra)
var vida_y = y + barra_y_offset;

// Dibujar la barra de vida
var vida_porcentaje = vida / vida_maxima; // Calcula el porcentaje de vida
var barra_vida_ancho_actual = barra_vida_ancho * vida_porcentaje; // Ancho de la barra basado en la vida actual

// Fondo de la barra de vida (gris)
draw_set_color(c_black);
draw_rectangle(vida_x, vida_y, vida_x + barra_vida_ancho, vida_y + barra_altura, false);

// Barra de vida (verde)
draw_set_color(c_red);
draw_rectangle(vida_x, vida_y, vida_x + barra_vida_ancho_actual, vida_y + barra_altura, false);

// Coordenadas para la barra de mana
var mana_x = x - (barra_mana_ancho / 2); // Centrar la barra de mana sobre el personaje (ajusta según el tamaño de la barra)
var mana_y = vida_y + barra_altura + 5; // Colocar la barra de mana debajo de la de vida

// Dibujar la barra de mana
var mana_porcentaje = mana / mana_maxima; // Calcula el porcentaje de mana
var barra_mana_ancho_actual = barra_mana_ancho * mana_porcentaje; // Ancho de la barra basado en el mana actual

// Fondo de la barra de mana (gris)
draw_set_color(c_black);
draw_rectangle(mana_x, mana_y, mana_x + barra_mana_ancho, mana_y + barra_altura, false);

// Barra de mana (azul)
draw_set_color(c_blue);
draw_rectangle(mana_x, mana_y, mana_x + barra_mana_ancho_actual, mana_y + barra_altura, false);

