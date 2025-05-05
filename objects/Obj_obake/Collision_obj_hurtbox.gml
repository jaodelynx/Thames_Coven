// Si colisiona con un jugador, aplica daño
if (other.owner != noone) {  // Verifica si la instancia tiene un dueño
    other.owner.recibir_damage(10);  // Aplicar el daño al jugador
}