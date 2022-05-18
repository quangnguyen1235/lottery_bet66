import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LayoutTemplate extends StatelessWidget {
  final Widget child;
  const LayoutTemplate({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        // drawer: sizingInformation.deviceScreenType == DeviceScreenType.Mobile
        //     ? NavigationDrawer()
        //     : null,
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            // NavigationBar(),
            Container(
              width: Get.width,
              height: 50,
              color: Colors.red,
            ),
            Expanded(
              child: child,
            )
          ],
        ),
      ),
    );
  }
}