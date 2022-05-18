import 'package:flutter/material.dart';
import '../../utils/utils.dart'; 

class AppColors {
  AppColors._();

  static Color get primary => AppUtils.valueByMode(values: [primaryDark, primaryLight]);

  static Color get primaryDark => fromHex('#F5F6FA');

  static Color get primaryLight => fromHex('#F5F6FA');

  static Color get text => fromHex('#707070');

  static Color get textDark => Colors.white;

  static Color get textLight => Colors.black;

  static Color get primaryBlue => fromHex('#1E3C72');

  static Color get primaryLightBlue => fromHex('#4E89FF');

  static Color get grey3F => fromHex('#F3F4F7');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
