# Z UI PLUS

This is a package for styling your UI.

## Features

The first (and only feature at the moment) is to create a custom checkbox with your image, colors
and radius.

## Getting started

Depend on it

Run this command:

With Flutter:
```flutter
$ flutter pub add flutter_html
```

This will add a line like this to your package's pubspec.yaml (and run an implicit flutter pub get):

```yaml
dependencies:
  z_ui_plus: ^0.0.1
```

Alternatively, your editor might support flutter pub get. Check the docs for your editor to learn more.

## Import it

Now in your Dart code, you can use:

```dart
import 'package:z_ui_plus/z_ui.dart';
```

## Usage

You can use the package with the following code.

```dart
@override
Widget build(BuildContext context) {
  return ZUI.zCheckbox(
      initialSelected: false, 
      asset: Image.asset("assets/example.png"), 
      onChanged: (value) {
        //Something to do with the value
      });
}
```

## Additional information

There are more attributes to explore and make it more customised.

```dart
bool? disabled;
double? width;
double? height;
Color? backgroundColor;
Color? borderColor;
double? boxRadius;
```
