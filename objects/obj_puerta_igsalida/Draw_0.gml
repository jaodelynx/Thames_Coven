draw_self(); 

if (showPrompt && canInteract && isActive) {
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_text(x, y - 40, "Presiona E para salir");
    draw_set_halign(fa_left);
    draw_set_color(c_white);
}