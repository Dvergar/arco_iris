import 'package:meta/meta.dart';

import 'package:arco_iris/src/properties.dart';

final arcoIris = () {
  return ArcoIris();
}();

@immutable
class ArcoIris extends ForegroundStyle {
  final _customStyles = <String, List<Property>>{};

  ArcoIris withStyle(String styleName) {
    _codeStore.addAll(
      _customStyles[styleName]?.map((color) => color.code) ?? [],
    );
    return this;
  }

  void addStyle(String styleName, List<Property> properties) =>
      _customStyles[styleName] = properties;
}

abstract interface class Style {
  final List<String> _codeStore;

  static const _start = '\x1B[';
  static const _end = '\x1B[0m';

  Style(this._codeStore);

  String get _codes => _codeStore.isNotEmpty ? '${_codeStore.join(';')}m' : '';

  T _setProperty<T extends Style>(Property property) {
    _codeStore.add(property.code);
    return this as T;
  }

  void text(dynamic input) => print('$_start$_codes$input$_end');
}

class ForegroundStyle extends Style with WithBackground {
  ForegroundStyle() : super([]);

  ForegroundStyle get black => _setProperty(ForegroundProperty.black);
  ForegroundStyle get red => _setProperty(ForegroundProperty.red);
  ForegroundStyle get green => _setProperty(ForegroundProperty.green);
  ForegroundStyle get yellow => _setProperty(ForegroundProperty.yellow);
  ForegroundStyle get blue => _setProperty(ForegroundProperty.blue);
  ForegroundStyle get magenta => _setProperty(ForegroundProperty.magenta);
  ForegroundStyle get cyan => _setProperty(ForegroundProperty.cyan);
  ForegroundStyle get white => _setProperty(ForegroundProperty.white);
}

class BackgroundStyle extends Style {
  BackgroundStyle(super.inheritedCodeStore);

  BackgroundStyle get black => _setProperty(BackgroundProperty.black);
  BackgroundStyle get backgroundRed => _setProperty(BackgroundProperty.red);
  BackgroundStyle get green => _setProperty(BackgroundProperty.green);
  BackgroundStyle get orange => _setProperty(BackgroundProperty.orange);
  BackgroundStyle get blue => _setProperty(BackgroundProperty.blue);
  BackgroundStyle get purple => _setProperty(BackgroundProperty.purple);
  BackgroundStyle get cyan => _setProperty(BackgroundProperty.cyan);
  BackgroundStyle get lightgrey => _setProperty(BackgroundProperty.lightgrey);
}

mixin WithBackground on Style {
  BackgroundStyle get withBackground => BackgroundStyle(_codeStore);
}
