draw_self();

if (showPrompt && canInteract) {
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_text(x, y - 40, promptMessage);
    draw_set_halign(fa_left);
    draw_set_color(c_white);
}