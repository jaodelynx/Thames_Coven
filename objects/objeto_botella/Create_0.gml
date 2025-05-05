// Escalado del sprite
image_xscale = 0.2;
image_yscale = 0.2;

// Si no tiene bottle_number asignado, usar 1 por defecto
if (!variable_instance_exists(id, "bottle_number")) {
    bottle_number = 1;
}