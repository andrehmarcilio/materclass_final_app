import 'package:flutter/material.dart';

import '../../modules/home/ui/home_page.dart';
import '../../utils/navigation/navigator_keys.dart' as navigator_keys;
import 'root_router_configuration.dart';

class RootRouterDelegate extends RouterDelegate<RootRouterConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RootRouterConfiguration> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: const [MaterialPage(child: HomePage())],
      onPopPage: _handlePopPage,
    );
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => navigator_keys.rootNavigatorKey;

  @override
  Future<void> setNewRoutePath(configuration) async {/* Do nothing */}

  bool _handlePopPage(Route<dynamic> route, dynamic result) {
    final success = route.didPop(result);

    return success;
  }
}
