library z_ui_plus;

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:z_ui_plus/style/style_keys.dart';

part 'components/z_checkbox.dart';

class ZUI {
  /// @initialSelected : The initialValue of the checkbox, either true or false, (checked or not)
  /// @asset : The asset which is going to be used as the check icon
  /// @onChanged : The Function returns the selected value (true or false)
  /// @disabled : The disabled attribute is true or false regarding the needs. Maybe you want the checkbox to be disabled.
  /// @width & @height : The sizes (double) you want to use. Feel free to play with the numbers to see what suits you. Otherwise the package uses defaults.
  /// @backgroundColor : The background color of the checkbox
  /// @borderColor : The borde color of the checkbox
  /// @boxRadius : The border radius of the checkbox
  static zCheckbox(
      {required bool initialSelected,
      required Image asset,
      required Function onChanged,
      bool? disabled,
      double? width,
      double? height,
      Color? backgroundColor,
      Color? borderColor,
      double? boxRadius}) {
    return ZCheckBox(
      initialSelected: initialSelected,
      asset: asset,
      onChanged: onChanged,
      disabled: disabled,
      width: width,
      height: height,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      boxRadius: boxRadius,
    );
  }
}
