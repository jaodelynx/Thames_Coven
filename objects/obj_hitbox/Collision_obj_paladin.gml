// En el evento de colisión de obj_hitbox con obj_paladin
if (place_meeting(x, y, obj_paladin)) {
    var player = instance_nearest(x, y, obj_paladin);
    if (player != noone) {
        show_message("¡Daño aplicado!");
        player.recibir_damage(20);  // Aplica 20 de daño
        instance_destroy();  // Destruye la hitbox
    }
}