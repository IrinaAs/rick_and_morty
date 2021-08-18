import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'models/navigation_arguments.dart';
import 'navigation_controller.dart';

class SmartNavigation {
  final GlobalKey<NavigatorState> _globalNavigatorKey;
  final NavigationController _navigationController;

  SmartNavigation(
    this._globalNavigatorKey,
    this._navigationController,
  ) {
    _navigationController.globalFlowEvents.listen(_eventGlobalFlow);
  }

  void _eventGlobalFlow(NavigationArguments navigationArguments) {
    switch (navigationArguments.typeFlowEvent) {
      case TypeFlowEvent.PUSH:
        _eventPushGlobalFlow(navigationArguments.routeName);
        break;
      case TypeFlowEvent.PUSH_REPLACEMENT:
        _eventPushReplacementGlobalFlow(navigationArguments.routeName);
        break;
      case TypeFlowEvent.POP:
        _eventPopGlobalFlow();
        break;
    }
  }

  void _eventPushReplacementGlobalFlow(String routeName) {
    _globalNavigatorKey.currentState
        ?.pushNamedAndRemoveUntil(routeName, ModalRoute.withName('/'));
  }

  void _eventPushGlobalFlow(String routeName) {
    _globalNavigatorKey.currentState?.pushNamed(routeName);
  }

  void _eventPopGlobalFlow() {
    _globalNavigatorKey.currentState?.pop();
  }
}
