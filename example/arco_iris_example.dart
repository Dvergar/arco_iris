import 'package:arco_iris/arco_iris.dart';
import 'package:arco_iris/src/properties.dart';

void main() {
  arcoIris.red.withBackground.black.text('red text on black background');
  arcoIris.black.withBackground.purple.text('black text on purple background');

  // Styles
  arcoIris.addStyle(
    'myStyle',
    [AnsiProperty.backgroundBlack, AnsiProperty.green],
  );

  arcoIris.withStyle('myStyle').text('input');
}
