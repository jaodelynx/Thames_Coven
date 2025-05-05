// Reduce el tiempo de vida y destruye al finalizar
if (--lifeTime <= 0) {
    instance_destroy();
}

// Efecto de desvanecimiento
image_alpha = lifeTime / 30; // Alpha de 1 a 0