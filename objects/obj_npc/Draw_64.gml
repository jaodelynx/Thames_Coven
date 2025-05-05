// Dibujar el cuadro de diálogo si está activo
if (showDialog) {
    draw_set_color(c_white);
    draw_set_alpha(0.8);
    draw_rectangle(50, 400, 750, 500, false); // Fondo del cuadro
    draw_set_alpha(1);
    
    draw_set_color(c_black);
    draw_text(60, 420, dialog_texts[dialogIndex]);

    // Avanzar el diálogo con "E"
    if (keyboard_check_pressed(ord("E"))) {
        dialogIndex++;
        if (dialogIndex >= array_length(dialog_texts)) {
            showDialog = false;
            dialogIndex = 0; // Reiniciar diálogo
        }
    }
}

// Mostrar el mensaje de interacción si el jugador está en rango
if (canTalk) {
    draw_set_color(c_white);
    draw_text(x - 20, y - 50, promptMessage);
}