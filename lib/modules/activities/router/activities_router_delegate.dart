import 'package:flutter/material.dart';

import '../../../utils/navigation/navigator_keys.dart' as navigator_keys;
import '../../exercices/ui/exercices_page.dart';
import '../model/activity.dart';
import '../ui/activities_page.dart';
import 'activities_router_configuration.dart';

class ActivitiesRouterDelegate extends RouterDelegate<ActivitiesRouterConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<ActivitiesRouterConfiguration> {
  static ActivitiesRouterDelegate get fromNavigatorKey {
    final currentNavigatorContext = navigator_keys.activitiesNavigatorKey.currentContext!;
    return Router.of(currentNavigatorContext).routerDelegate as ActivitiesRouterDelegate;
  }

  final routerConfiguration = ActivitiesRouterConfiguration();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        const MaterialPage(child: ActivitiesPage()),
        if (routerConfiguration.selectedActivity != null)
          MaterialPage(child: ExercicesPage(activity: routerConfiguration.selectedActivity!))
      ],
      onPopPage: _handlePopPage,
    );
  }

  void selectActivity(Activity activity) {
    routerConfiguration.selectActivity(activity);
    notifyListeners();
  }

  void unselectActivity() {
    routerConfiguration.unselectActivity();
    notifyListeners();
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => navigator_keys.activitiesNavigatorKey;

  @override
  Future<void> setNewRoutePath(configuration) async {/* Do nothing */}

  bool _handlePopPage(Route<dynamic> route, dynamic result) {
    final success = route.didPop(result);
    final otherRouterCanHandle = !success;

    if (otherRouterCanHandle) return false;

    if (routerConfiguration.selectedActivity != null) unselectActivity();

    return success;
  }
}
