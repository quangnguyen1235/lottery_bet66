import 'package:flutter/material.dart';
import '../../configs/constanst/constants.dart';

class WidgetTextButton extends StatelessWidget {
  final Widget child;
  final Color? hoveredBgColor;
  final Color? bgColor;
  final Color? hoveredTextColor;
  final Color? textColor;
  final TextStyle? textStyle;
  final double? radius;
  final VoidCallback? onPressed;
  const WidgetTextButton({Key? key, required this.child, this.hoveredBgColor, this.bgColor, this.hoveredTextColor, this.textColor, this.textStyle, this.radius, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 16),
      child: TextButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>((states) => EdgeInsets.zero),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(((states){
            if(states.contains(MaterialState.hovered)) return hoveredBgColor ?? AppColors.primaryBlue;
            return bgColor ?? Colors.white;
          })),
          textStyle: MaterialStateProperty.resolveWith<TextStyle>((states){
            final _ = textStyle ?? AppTextStyles.normalRegular.copyWith(fontSize: 18);
            return _;
          }),
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.hovered)) return  hoveredTextColor ?? Colors.white;
                return textColor ?? AppColors.primaryBlue;
              }),
        ),
        onPressed: onPressed ?? () => null,
        child: child,
      ),
    );
  }
}
