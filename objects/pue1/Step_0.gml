canInteract = place_meeting(x, y, obj_player1);

if (keyboard_check_pressed(ord("E")) && canInteract) {
    if (isLocked) {
        promptMessage = lockedMessage; 
        alarm[0] = 60; 
    } else {
       
        instance_create_depth(0, 0, 10000, obj_transition);
        obj_player1.x = targetX;
        obj_player1.y = targetY;
        room_goto(targetRoom);
    }
}