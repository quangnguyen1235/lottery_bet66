import 'package:flutter/material.dart';
import 'package:flutter_app/src/presentation/routers.dart';
import 'package:flutter_app/src/presentation/widgets/dialog/custom_toast.dart';
import 'package:flutter_app/src/utils/utils.dart';

class NavigationService {
  NavigationService._();

  static NavigationService? _instance;

  factory NavigationService() {
    if (_instance == null) _instance = NavigationService._();
    return _instance!;
  }

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  final List<String> _routerDone = [];

  Future<T?> toNamed<T extends Object?>(String routeName,
      {Map<String, String>? queryParams}) async {
    if (_routerDone.contains(routeName)) {
      if (queryParams != null) routeName = Uri(path: routeName, queryParameters: queryParams).toString();
      return navigatorKey.currentState?.pushNamed(routeName);
    } else AppUtils.toast('function_is_developing', type: CustomToastType.warning);
  }

  dynamic pop<T extends Object?>([T? result]) {
    return navigatorKey.currentState?.pop(result);
  }
}

class RoutingData {
  final String route;
  final Map<String, String>? queryParameters;

  RoutingData({
    required this.route,
    this.queryParameters,
  });
}
