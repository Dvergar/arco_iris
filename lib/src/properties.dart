enum ForegroundProperty implements Property {
  black('30'),
  red('31'),
  green('32'),
  yellow('33'),
  blue('34'),
  magenta('35'),
  cyan('36'),
  white('37');

  @override
  final String code;

  const ForegroundProperty(this.code);
}

enum BackgroundProperty implements Property {
  black('40'),
  red('41'),
  green('42'),
  orange('43'),
  blue('44'),
  purple('45'),
  cyan('46'),
  lightgrey('47');

  @override
  final String code;

  const BackgroundProperty(this.code);
}

abstract final class Property {
  String get code;
}
