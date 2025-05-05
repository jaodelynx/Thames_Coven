if (appear_timer > 0) {
    appear_timer -= 1; 
} else if (image_alpha < 1) {
    image_alpha += fade_speed; 
}