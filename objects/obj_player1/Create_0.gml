moveSpeed = 8;
hspeed = 0;
vspeed = 0;
isFacingRight = true;

anim_idle = spr_stop;
anim_walk = spr_walk;
image_speed = 1;
image_xscale = 0.6;
image_yscale = 0.6;

var _spawn_x = 0;
var _spawn_y = 0;

// Verificar si hay un archivo de guardado
if (!global.juego_nuevo && file_exists("save.sav")) {
    var _file = file_text_open_read("save.sav");
    var _data = file_text_read_string(_file);
    file_text_close(_file);

    var _pos = string_split(_data, ",");
    if (array_length(_pos) >= 2) {
        _spawn_x = real(_pos[0]);
        _spawn_y = real(_pos[1]);
        show_debug_message("CARGANDO UBICACIÓN: " + string(_spawn_x) + " | " + string(_spawn_y));
    }
} else {
    if (room == room_iglesia) {
        _spawn_x = 128;
        _spawn_y = 580;
    } else if (room == Roomigfuera) {
        _spawn_x = 150;
        _spawn_y = 650;
    } else if (room == Pasillo_LV1) {
        _spawn_x = 150;
        _spawn_y = 650;
    } else if (room == room_casapos) {
        _spawn_x = 150;
        _spawn_y = 650;
    }
}

x = _spawn_x;
y = _spawn_y;

// --- DEPURACIÓN ---
show_debug_message("Posición FINAL aplicada: X = " + string(x) + " | Y = " + string(y));