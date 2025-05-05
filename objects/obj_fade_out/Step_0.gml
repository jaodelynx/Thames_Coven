fadeTimer--;
if (fadeTimer <= 0) {
    room_goto(targetRoom);
    obj_player1.x = saveX;
    obj_player1.y = saveY;
    instance_destroy();
}