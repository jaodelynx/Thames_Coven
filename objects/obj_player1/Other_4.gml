/// 📌 Evento Inicio de la habitación
if (file_exists("save.sav")) {
    var _file = file_text_open_read("save.sav");
    var posData = file_text_read_string(_file); // Leer la línea completa
    file_text_close(_file);

    // Eliminar caracteres problemáticos
    posData = string_replace_all(posData, "\n", ""); 
    posData = string_replace_all(posData, "\r", ""); 

    // Separar valores
    var _pos = string_split(posData, ",");
    if (array_length(_pos) >= 2) {
        var posX = real(_pos[0]);
        var posY = real(_pos[1]);

        // Mensaje de depuración
        show_debug_message("Cargando posición: " + string(posX) + ", " + string(posY));

        // Asignar posición
        x = posX;
        y = posY;

        move_snap(1, 1); // Asegurar la posición
    } else {
        show_message("Error: Formato incorrecto en save.sav");
    }
}