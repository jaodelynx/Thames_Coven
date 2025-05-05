// Control de transición
isFadingIn = true;       // true = fade in (oscurecer), false = fade out (aclarar)
fadeSpeed = 0.05;        // Velocidad del efecto (ajustable)
targetAlpha = 1;         // Opacidad máxima (1 = totalmente opaco)
destroyWhenComplete = true; // Auto-destruirse al completar

// Variables para la transición
transitionTargetRoom = noone; // Se establecerán desde la puerta
transitionTargetX = 0;
transitionTargetY = 0;

// Configuración visual
image_alpha = isFadingIn ? 0 : targetAlpha; // Inicializa según el tipo de fade