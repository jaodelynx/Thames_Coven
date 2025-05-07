// Si colisiona con un jugador, aplica daño
if (other.owner != noone) {
    with (other.owner) {
        recibir_damage(10);
    }
}
