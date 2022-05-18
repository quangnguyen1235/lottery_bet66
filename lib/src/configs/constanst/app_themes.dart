import 'package:flutter/material.dart';
import '../../utils/utils.dart';

import 'constants.dart';

normalTheme(BuildContext context) {
  return ThemeData(
    fontFamily: AppTextStyles.fontFamilyInter,
    scaffoldBackgroundColor: AppColors.primary,
    brightness: AppUtils.valueByMode(values: [Brightness.light, Brightness.dark]),
  );
}
