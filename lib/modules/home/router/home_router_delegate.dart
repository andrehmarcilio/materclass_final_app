import 'package:flutter/material.dart';

import '../../../utils/navigation/navigator_keys.dart' as navigator_keys;
import '../../activities/router/activities_router.dart';
import '../../github_repos/github_repos_module.dart';
import '../../profile/ui/profile_page.dart';
import 'home_router_configuration.dart';

class HomeRouterDelegate extends RouterDelegate<HomeRouterConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<HomeRouterConfiguration> {
  static HomeRouterDelegate get fromNavigatorKey {
    final navigatorContext = navigator_keys.homeNavigatorKey.currentContext!;
    return Router.of(navigatorContext).routerDelegate as HomeRouterDelegate;
  }

  final homeRouterConfiguration = HomeRouterConfiguration();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          child: ValueListenableBuilder(
            valueListenable: homeRouterConfiguration.currentBottomNavigationIndex,
            builder: (_, index, __) {
              return IndexedStack(
                index: index,
                children: const [
                  ActivitiesRouter(),
                  GithubReposModule(),
                  ProfilePage(),
                ],
              );
            },
          ),
        )
      ],
      onPopPage: _handlePopPage,
    );
  }

  void updateBottomNavigationIndex(int newIndex) {
    homeRouterConfiguration.updateBottomNavigationIndex(newIndex);
  }

  ValueNotifier<int> get currentBottomNavigationIndex => homeRouterConfiguration.currentBottomNavigationIndex;

  @override
  GlobalKey<NavigatorState>? get navigatorKey => navigator_keys.homeNavigatorKey;

  @override
  Future<void> setNewRoutePath(configuration) async {/* Do nothing */}

  bool _handlePopPage(Route<dynamic> route, dynamic result) {
    final success = route.didPop(result);

    return success;
  }
}
