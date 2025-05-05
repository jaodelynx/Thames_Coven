// --- ENTRADAS ---
var izq = keyboard_check(ord("A")) || keyboard_check(vk_left);
var der = keyboard_check(ord("D")) || keyboard_check(vk_right);
var abj = keyboard_check(ord("S")) || keyboard_check(vk_down);
var correr = keyboard_check(vk_shift);
var salto_presionado = keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(ord("U"));
var atk_rap_pres = keyboard_check_pressed(ord("X")) || keyboard_check_pressed(ord("T"));
var atk_fue_pres = keyboard_check_pressed(ord("C")) || keyboard_check_pressed(ord("Y"));
var dash_pres = keyboard_check_pressed(ord("Q")) || keyboard_check_pressed(ord("V"));

// --- MOVIMIENTO ---
var move = 0;
if (izq) move -= 0.4;
if (der) move += 0.4;

// Detectar si está en el suelo
if (es_suelo()) {
    puede_doblesaltar = true;

    if (estado == ESTADO.SALTAR || estado == ESTADO.DOBLESALTO) {
        estado = ESTADO.IDLE;
    }

    if (estado == ESTADO.DASHAEREO) {
        estado = ESTADO.IDLE;
    }
} else {
    if (estado != ESTADO.SALTAR && estado != ESTADO.DOBLESALTO && estado != ESTADO.DASHAEREO && estado != ESTADO.PATADADESLIZANTE) {
        estado = ESTADO.SALTAR;
    }
}

// --- LÓGICA DE GRAVEDAD Y MOVIMIENTO VERTICAL ---
if (vsp > vsp_max) vsp = vsp_max;

if (vsp != 0) {
    var sign_vsp = sign(vsp);
    for (var i = 0; i < abs(vsp); i++) {
        if (!place_meeting(x, y + sign_vsp, obj_suelo)) {
            y += sign_vsp;
        } else {
            vsp = 0;
            break;
        }
    }
}

// --- CONTROL DE DIRECCIÓN ---
if (move != 0) {
    facing = move;
    image_xscale = facing;
}

// --- LÓGICA DE MOVIMIENTO HORIZONTAL ---
hsp = correr ? move * velocidad_correr : move * velocidad_caminar;

if (es_suelo()) {
    if (vsp > 0) vsp = 0;
} else {
    vsp += gravedad;
    if (vsp > vsp_max) vsp = vsp_max;
}

x += hsp;
y += vsp;

if (vida <= 0) {
    if (hurtbox != noone) {
        instance_destroy(hurtbox);
    }
    instance_destroy();
}


// --- ESTADOS ---
switch (estado) {
    case ESTADO.IDLE:
        sprite_index = spr_personaje_idle;
        image_speed = 1;

        if (!es_suelo()) estado = ESTADO.SALTAR;
        else if (izq || der) estado = correr ? ESTADO.CORRER : ESTADO.CAMINAR;
        else if (abj) estado = ESTADO.AGACHADO;
        else if (salto_presionado) { vsp = salto_fuerza; estado = ESTADO.SALTAR; }
        else if (dash_pres) { estado = ESTADO.DASH; bloqueado = true; }
        else if (atk_rap_pres) { hacer_ataque("rapido"); bloqueado = true; }
        else if (atk_fue_pres) { hacer_ataque("fuerte"); bloqueado = true; }
    break;

    case ESTADO.CAMINAR:
        sprite_index = spr_personaje_caminar;
        image_speed = 1;

        if (!es_suelo()) estado = ESTADO.SALTAR;
        else if (!(izq || der)) estado = ESTADO.IDLE;
        else if (correr) estado = ESTADO.CORRER;
        else if (abj) estado = ESTADO.AGACHADO;
        else if (salto_presionado) { vsp = salto_fuerza; estado = ESTADO.SALTAR; }
        else if (atk_rap_pres) { hacer_ataque("rapido"); bloqueado = true; }
        else if (atk_fue_pres) { hacer_ataque("fuerte"); bloqueado = true; }
    break;

    case ESTADO.CORRER:
        sprite_index = spr_personaje_correr;
        image_speed = 1;

        if (!es_suelo()) estado = ESTADO.SALTAR;
        else if (!correr) estado = ESTADO.CAMINAR;
        else if (!(izq || der)) estado = ESTADO.IDLE;
        else if (abj) estado = ESTADO.AGACHADO;
        else if (salto_presionado) { vsp = salto_fuerza; estado = ESTADO.SALTAR; }
        else if (atk_rap_pres) { hacer_ataque("rapido"); bloqueado = true; }
        else if (atk_fue_pres) { hacer_ataque("fuerte"); bloqueado = true; }
    break;

    case ESTADO.AGACHADO:
        sprite_index = spr_personaje_agacharse;
        image_speed = 1;
        image_index = image_number - 1;
	
        if (image_index == image_number - 1) image_speed = 0;

        if (!abj) estado = ESTADO.IDLE;
        else if (atk_rap_pres) { hacer_ataque("rapido_agachado"); bloqueado = true; }
        else if (atk_fue_pres) { hacer_ataque("fuerte_agachado"); bloqueado = true; }
        else if (salto_presionado) { estado = ESTADO.PATADADESLIZANTE; bloqueado = true; }
    break;

    case ESTADO.SALTAR:
        sprite_index = spr_personaje_saltar;
        image_speed = 1;
        image_index = image_number - 1;

        if (es_suelo()) {
            estado = ESTADO.IDLE;
            puede_doblesaltar = true;
        } else {
            if (puede_doblesaltar && salto_presionado) {
                vsp = salto_fuerza;
                puede_doblesaltar = false;
            }
            if (atk_rap_pres) { hacer_ataque("rapido_aereo"); bloqueado = true; }
            else if (atk_fue_pres) { hacer_ataque("fuerte_aereo"); bloqueado = true; }
            else if (abj && salto_presionado) { estado = ESTADO.PATADA_AEREA; bloqueado = true; }
        }
    break;

    case ESTADO.DASH:
        sprite_index = spr_personaje_dash;
        image_speed = 1;
        image_index = image_number - 1;
        hsp = facing * velocidad_dash;
        if (image_index >= image_number - 1) { estado = ESTADO.IDLE; bloqueado = false; }
    break;

    case ESTADO.GOLPEADO:
        sprite_index = spr_personaje_golpeado;
        image_speed = 1;
        if (image_index == image_number - 1) estado = ESTADO.IDLE;
    break;

    case ESTADO.PATADADESLIZANTE:
        sprite_index = spr_personaje_patadadeslizante;
        image_speed = 1;
        var direccion = image_xscale;
        if (!place_meeting(x + direccion * 30, y, obj_solid)) {
            x += direccion * 10;
        }
        if (image_index >= image_number - 1) estado = ESTADO.AGACHADO;
    break;

    case ESTADO.PATADA_AEREA:
        sprite_index = spr_personaje_Kickjump;
        image_speed = 1;
        if (image_index == image_number - 1) estado = ESTADO.IDLE;
    break;
}

// Esta función recibe el daño y lo resta de la vida del jugador
function recibir_damage(p_damage) {
    vida -= p_damage;  // Restar vida
    if (vida <= 0) {
        estado = "morir";  // Si la vida llega a 0, cambia al estado de morir
        // Aquí podrías agregar una animación de muerte o un cambio de sprite.
    }
}