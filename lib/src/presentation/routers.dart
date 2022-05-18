import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import '../resource/services/services.dart';

class Routers {
  static const String register = "/register";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    var routingData = settings.name!.getRoutingData;
    switch (routingData.route) {
      default:
        return animRoute(
          Scaffold(
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Page not found',
                    style: AppTextStyles.normalBold.copyWith(fontSize: 28),
                  ),
                ],
              ),
            ),
          ),
          name: settings.name!,
          arguments: routingData.queryParameters,
        );
    }
  }

  static Route animRoute(Widget page,
      {Offset? beginOffset, required String name, Object? arguments}) {
    return PageRouteBuilder(
      settings: RouteSettings(name: name, arguments: arguments),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = beginOffset ?? Offset(0.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;
        var tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static Offset _center = Offset(0.0, 0.0);
  static Offset _top = Offset(0.0, 1.0);
  static Offset _bottom = Offset(0.0, -1.0);
  static Offset _left = Offset(-1.0, 0.0);
  static Offset _right = Offset(1.0, 0.0);
}
