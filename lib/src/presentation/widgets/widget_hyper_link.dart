import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/constanst/app_colors.dart';
import 'package:flutter_app/src/configs/constanst/app_text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class WidgetHyperLink extends StatelessWidget {
  final String link;
  const WidgetHyperLink(this.link, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(text: TextSpan(
        text: link,
        style: AppTextStyles.normalRegular.copyWith(fontSize: 14, color: AppColors.primaryLightBlue),
        recognizer: TapGestureRecognizer()..onTap = () async {
          final url = link;
          if (await canLaunch(url)) {
            await launch(
              url,
              forceSafariVC: false,
            );
          }
        }
    ));
  }
}
