import 'package:arco_iris/src/properties.dart';

final arcoIris = () {
  return ArcoIris();
}();

class ArcoIris extends ForegroundStyle {}

abstract interface class Style {
  final List<String> _codeStore;

  static const _start = '\x1B[';
  static const _end = '\x1B[0m';

  Style(this._codeStore);

  String get _codes => _codeStore.isNotEmpty ? '${_codeStore.join(';')}m' : '';

  T _setProperty<T extends Style>(AnsiProperty property) {
    _codeStore.add(property.code);
    return this as T;
  }

  void text(dynamic input) => print('$_start$_codes$input$_end');
}

class ForegroundStyle extends Style with WithBackground {
  ForegroundStyle() : super([]);

  ForegroundStyle get black => _setProperty(AnsiProperty.black);
  ForegroundStyle get red => _setProperty(AnsiProperty.red);
  ForegroundStyle get green => _setProperty(AnsiProperty.green);
  ForegroundStyle get yellow => _setProperty(AnsiProperty.yellow);
  ForegroundStyle get blue => _setProperty(AnsiProperty.blue);
  ForegroundStyle get magenta => _setProperty(AnsiProperty.magenta);
  ForegroundStyle get cyan => _setProperty(AnsiProperty.cyan);
  ForegroundStyle get white => _setProperty(AnsiProperty.white);
}

class BackgroundStyle extends Style {
  BackgroundStyle(super.inheritedCodeStore);

  BackgroundStyle get black => _setProperty(AnsiProperty.backgroundBlack);
  BackgroundStyle get backgroundRed => _setProperty(AnsiProperty.backgroundRed);
  BackgroundStyle get green => _setProperty(AnsiProperty.backgroundGreen);
  BackgroundStyle get orange => _setProperty(AnsiProperty.backgroundOrange);
  BackgroundStyle get blue => _setProperty(AnsiProperty.backgroundBlue);
  BackgroundStyle get purple => _setProperty(AnsiProperty.backgroundPurple);
  BackgroundStyle get cyan => _setProperty(AnsiProperty.backgroundCyan);
  BackgroundStyle get lightgrey =>
      _setProperty(AnsiProperty.backgroundLightgrey);
}

mixin WithBackground on Style {
  BackgroundStyle get withBackground => BackgroundStyle(_codeStore);
}
