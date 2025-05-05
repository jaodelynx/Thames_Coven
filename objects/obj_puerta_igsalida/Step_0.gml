
canInteract = place_meeting(x, y, obj_player1);

if (keyboard_check_pressed(ord("E")) && canInteract) {

    var fx = instance_create_depth(0, 0, 10000, obj_transition);
    
    fx.isFadingIn = true;
    fx.fadeSpeed = 0.08;
    fx.destroyWhenComplete = false; 
    
    // Pasar datos de transición
    fx.transitionTargetRoom = Roomigfuera;
    fx.transitionTargetX = 320;  
    fx.transitionTargetY = 400;  
    

    alarm[0] = 30;
}