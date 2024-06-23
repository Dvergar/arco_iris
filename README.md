Printer with style!

## Features

Damn simple api.

## Usage

```dart
arcoIris.red.withBackground.black.text('red text on black background');

// Styles
arcoIris.addStyle(
  'myStyle',
  [BackgroundProperty.black, ForegroundProperty.green],
);

arcoIris.withStyle('myStyle').text('My custom style');
```

## Todo

- Custom styles
- Blocks with indentation
- More colors
- Xterm color codes
