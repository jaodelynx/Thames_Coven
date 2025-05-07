// Si colisiona con un jugador, aplica daño
if (other.owner != noone) {
    with (other.owner) {
        recibir_damage(10);
    }
}
//detecta error
//lo revisare cuando se unifique los enemigos con poo
////jaodelynx 07/05/2025 10:51 