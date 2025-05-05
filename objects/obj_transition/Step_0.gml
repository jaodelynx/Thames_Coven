// Control del fade
if (isFadingIn) {
    // Fade in (aumentar opacidad)
    image_alpha = min(image_alpha + fadeSpeed, targetAlpha);
    
    // Cambiar de room cuando alcance la opacidad máxima
    if (image_alpha >= targetAlpha && transitionTargetRoom != noone) {
        room_goto(Roomigfuera);
        with (obj_player1) {
            x = other.transitionTargetX;
            y = other.transitionTargetY;
        }
        
        // Iniciar fade out si es necesario
        if (destroyWhenComplete) {
            instance_destroy();
        }
    }
} else {
    // Fade out (disminuir opacidad)
    image_alpha = max(image_alpha - fadeSpeed, 0);
    
    // Destruir al completar
    if (image_alpha <= 0 && destroyWhenComplete) {
        instance_destroy();
    }
}