/// Maps a WMO weather code (Open-Meteo) to a French label.
String describeWeather(int code) {
  return switch (code) {
    0 => 'Ciel dégagé',
    1 || 2 => 'Peu nuageux',
    3 => 'Couvert',
    45 || 48 => 'Brouillard',
    >= 51 && <= 57 => 'Bruine',
    >= 61 && <= 67 => 'Pluie',
    >= 71 && <= 77 => 'Neige',
    >= 80 && <= 82 => 'Averses',
    85 || 86 => 'Averses de neige',
    >= 95 && <= 99 => 'Orage',
    _ => 'Inconnu',
  };
}
