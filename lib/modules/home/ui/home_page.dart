import 'package:flutter/material.dart';

import '../../../commons/models/svg_asset.dart';
import '../router/home_router_delegate.dart';
import 'widgets/home_bottom_navigation.dart';
import 'widgets/home_bottom_navigation_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeRouter = HomeRouterDelegate();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: homeRouter.currentBottomNavigationIndex,
      builder: (_, currentIndex, __) {
        return Scaffold(
          body: Router(routerDelegate: homeRouter),
          bottomNavigationBar: HomeBottomNavigation(
            currentIndex: currentIndex,
            onTap: homeRouter.updateBottomNavigationIndex,
            items: const [
              HomeBottomNavigationItem(svgAsset: SvgAsset.icTarget, label: 'Atividades'),
              HomeBottomNavigationItem(svgAsset: SvgAsset.icGithub, label: 'Repositórios'),
              HomeBottomNavigationItem(svgAsset: SvgAsset.icPerson, label: 'Sobre o dev'),
            ],
          ),
        );
      },
    );
  }
}
