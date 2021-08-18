import 'package:rick_and_morty_app/navigation/core/navigation_controller.dart';
import 'base_navigation_arguments.dart';

class NavigationArguments extends BaseNavigationArguments {
  final dynamic argument;
  final page;
  final String routeName;

  NavigationArguments({
    this.page,
    this.argument,
    this.routeName,
    TypeFlowEvent typeFlowEvent,
  }) : super(typeFlowEvent);
}
