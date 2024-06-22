enum AnsiProperty {
  black('30'),
  red('31'),
  green('32'),
  yellow('33'),
  blue('34'),
  magenta('35'),
  cyan('36'),
  white('37'),

  backgroundBlack('40'),
  backgroundRed('41'),
  backgroundGreen('42'),
  backgroundOrange('43'),
  backgroundBlue('44'),
  backgroundPurple('45'),
  backgroundCyan('46'),
  backgroundLightgrey('47');

  final String code;

  const AnsiProperty(this.code);
}
