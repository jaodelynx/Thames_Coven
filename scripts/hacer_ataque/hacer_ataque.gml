// Script: hacer_ataque
// Función para hacer la transición de ataques
function hacer_ataque(tipo) {
    var sprite;
    var estado_final;
    
    switch (tipo) {
        case "rapido":
            sprite = spr_personaje_ataquerapido;
            estado_final = ESTADO.IDLE;
            break;
        case "fuerte":
            sprite = spr_personaje_ataquefuerte;
            estado_final = ESTADO.IDLE;
            break;
        case "rapido_agachado":
            sprite = spr_personaje_ataquerapido_agachado;
            estado_final = ESTADO.AGACHADO;
            break;
        case "fuerte_agachado":
            sprite = spr_personaje_ataquefuerte_agachado;
            estado_final = ESTADO.AGACHADO;
            break;
        case "rapido_aereo":
            sprite = spr_personaje_ataquerapido_agachado; // Animación similar a la de agachado
            estado_final = ESTADO.SALTAR;
            break;
        case "fuerte_aereo":
            sprite = spr_personaje_ataquefuerte_agachado; // Animación similar a la de agachado
            estado_final = ESTADO.SALTAR;
            break;
    }

    sprite_index = sprite;
    image_speed = 1;
    
    if (image_index == image_number - 1) {
        estado = estado_final;
        bloqueado = false;
    }
}