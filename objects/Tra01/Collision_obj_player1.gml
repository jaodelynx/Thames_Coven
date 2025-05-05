if (instance_exists(obj_player1)) {
    var _player = instance_nearest(x, y, obj_player1);

    // Guardar las coordenadas y la room destino en el jugador
    _player.storedTargetRoom = targetRoom;
    _player.storedTargetX = targetX;
    _player.storedTargetY = targetY;

    // Cambiar de room inmediatamente
    room_goto(_player.storedTargetRoom);

    // Colocar al jugador en la nueva posición
    _player.x = _player.storedTargetX;
    _player.y = _player.storedTargetY;
}