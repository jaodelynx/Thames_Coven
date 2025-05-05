// Inicializar variables del NPC
talk_range = 80;        // Distancia para interactuar
hasTalked = false;      // Si ya habló con el NPC
showDialog = false;     // Controla si el cuadro de diálogo está activo
dialogIndex = 0;        // Índice del diálogo
canTalk = false;        // Si el jugador está en rango para hablar
promptMessage = "";     // Mensaje de interacción


// Mensajes de diálogo
dialog_texts = [
    "Padre, le estábamos esperando...",
    "Eso ya ha echado a todos de mi posada.",
    "Por favor, ayúdeme, no nos deja acercarnos y no sé cómo.",
    "Pase por esta puerta cuando esté listo."
];

// Configuración del sprite
sprite_index = spr_npc1;
mask_index = spr_npc1_mask;