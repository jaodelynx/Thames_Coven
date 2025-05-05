function es_suelo() {
    return place_meeting(x, y + 1, obj_suelo) || place_meeting(x, y + 1, obj_plataforma_1);
}