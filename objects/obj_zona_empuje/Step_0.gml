// Verificar colisión con obj_zona_empuje
var _zona = instance_place(x, y, obj_zona_empuje);
if (_zona != noone) {
    var dx = x - _zona.x; // Distancia en X
    var distancia = abs(dx);
    var radio_empuje = _zona.colision_radio; // Radio de la zona de empuje
    
    if (distancia < radio_empuje) {
        var fuerza = (radio_empuje - distancia) / radio_empuje; // Fuerza inversamente proporcional a la distancia
        var direccion = sign(dx); // -1 si está a la izquierda, 1 si está a la derecha
        
        x += direccion * fuerza * 10; // Mueve solo en el eje Y
    }
}