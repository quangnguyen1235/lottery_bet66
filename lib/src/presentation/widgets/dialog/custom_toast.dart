import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:get/get.dart';

enum CustomToastType{
  neutral,
  infomation,
  success,
  warning,
  error,
}

class CustomToast extends StatelessWidget {
  final CustomToastType type;
  final String message;
  const CustomToast({Key? key, this.type = CustomToastType.neutral, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: Colors.transparent,
        child: Align(
          alignment: Alignment.topRight,
          child: Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: getColor(),
            ),
            child: Text(
              message.tr,
              textAlign: TextAlign.left,
              style: AppTextStyles.normalRegular
                  .copyWith(color: Colors.white, fontSize: 13),
            ),
          ),
        ),
      ),
    );
  }

  Color getColor(){
    switch(type){
      case CustomToastType.neutral:
        return AppColors.grey3F;
      case CustomToastType.infomation:
        return AppColors.fromHex('#1697F4');
      case CustomToastType.success:
        return AppColors.fromHex('#5AC926');
      case CustomToastType.warning:
        return AppColors.fromHex('#F6B100');
      case CustomToastType.error:
        return AppColors.fromHex('#FF5238');
    }
  }

}
