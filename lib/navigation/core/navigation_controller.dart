import 'package:rxdart/rxdart.dart';
import 'models/navigation_arguments.dart';

enum TypeFlowEvent { PUSH, PUSH_REPLACEMENT, POP }

mixin GlobalNavigator {
  void pushReplacementGlobalPage(String routeName);
  void pushGlobalPage(String routeName);
  void popGlobalPage();
}

class NavigationController with GlobalNavigator {
  final globalFlowEvents = BehaviorSubject<NavigationArguments>();

  @override
  void popGlobalPage() {
    globalFlowEvents.add(NavigationArguments(typeFlowEvent: TypeFlowEvent.POP));
  }

  @override
  void pushGlobalPage(String routeName) {
    globalFlowEvents.add(NavigationArguments(
        routeName: routeName, typeFlowEvent: TypeFlowEvent.PUSH));
  }

  @override
  void pushReplacementGlobalPage(String routeName) {
    globalFlowEvents.add(NavigationArguments(
        routeName: routeName, typeFlowEvent: TypeFlowEvent.PUSH_REPLACEMENT));
  }
}
