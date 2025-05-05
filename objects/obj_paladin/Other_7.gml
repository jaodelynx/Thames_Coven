switch (estado) {
    case ESTADO.ATAQUERAPIDO:
    case ESTADO.ATAQUEFUERTE:
    case ESTADO.ATAQUERAPIDO_AGACHADO:
    case ESTADO.ATAQUEFUERTE_AGACHADO:
    case ESTADO.DASH:
    case ESTADO.DASHAEREO:
    case ESTADO.GOLPEADO:
    case ESTADO.ATAQUERAPIDO_AEREO:
    case ESTADO.ATAQUEFUERTE_AEREO:
        estado = (es_suelo()) ? ESTADO.IDLE : ESTADO.SALTAR;
        bloqueado = false;
    break;
}