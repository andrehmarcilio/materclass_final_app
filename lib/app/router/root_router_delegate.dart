import 'package:flutter/material.dart';

import '../../modules/exercices/model/exercice.dart';
import '../../modules/home/ui/home_page.dart';
import '../../modules/mockups/controlled_animation/presenter/animated_ball/controlled_animation_view.dart';
import '../../modules/mockups/facebook_clone/ui/facebook_login_page.dart';
import '../../modules/mockups/implicit_animation_exercise/ui/implicit_animation_exercise_page.dart';
import '../../modules/mockups/money_controll/main.dart';
import '../../modules/mockups/simple_login_page/ui/simple_login_page.dart';
import '../../utils/navigation/navigator_keys.dart' as navigator_keys;
import 'root_router_configuration.dart';

class RootRouterDelegate extends RouterDelegate<RootRouterConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RootRouterConfiguration> {
  static RootRouterDelegate get fromNavigatorKey {
    final navigatorContext = navigator_keys.rootNavigatorKey.currentContext!;
    return Router.of(navigatorContext).routerDelegate as RootRouterDelegate;
  }

  final rootRouterConfiguration = RootRouterConfiguration();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        const MaterialPage(child: HomePage()),
        if (rootRouterConfiguration.selectedExercice != null) _getExercicePage(),
      ],
      onPopPage: _handlePopPage,
    );
  }

  Page _getExercicePage() {
    final selectedExercice = rootRouterConfiguration.selectedExercice;
    return MaterialPage(
      child: switch (selectedExercice?.routePath) {
        '/implicity-animation' => const ImplicitAnimationExercisePage(),
        '/explicit-animation' => const ControlledAnimationView(),
        '/simple-login' => const SimpleLoginPage(),
        '/money-control' => const MoneyControllApp(),
        '/facebook' => const FacebookLoginPage(),
        _ => const SizedBox.shrink(),
      },
    );
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => navigator_keys.rootNavigatorKey;

  @override
  Future<void> setNewRoutePath(configuration) async {/* Do nothing */}

  bool _handlePopPage(Route<dynamic> route, dynamic result) {
    final success = route.didPop(result);
    if (!success) return false;

    if (rootRouterConfiguration.selectedExercice != null) unselectExercice();

    return success;
  }

  void selectExercice(FlutterExercice exercice) {
    rootRouterConfiguration.selectExercice(exercice);
    notifyListeners();
  }

  void unselectExercice() {
    rootRouterConfiguration.unselectExercice();
    notifyListeners();
  }
}
