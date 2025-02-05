extension CapitalizeFirstLetter on String {
  String capitalizeFirst() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }
}

String addZero(int idPoke) {
  if (idPoke < 10) {
    return '000$idPoke';
  } else if (idPoke < 100) {
    return '00$idPoke';
  } else if (idPoke < 1000) {
    return '0$idPoke';
  }

  return '$idPoke';
}
