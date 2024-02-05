// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../commons/models/svg_asset.dart';
import '../../../../commons/widgets/svg_widget.dart';
import '../../../../utils/extensions/context_extensions.dart';
import 'home_bottom_navigation_item.dart';

class HomeBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<HomeBottomNavigationItem> items;

  const HomeBottomNavigation({
    required this.items,
    required this.onTap,
    required this.currentIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      constrainedAxis: Axis.horizontal,
      child: SafeArea(child: IntrinsicHeight(child: Row(children: _bottomNavigationTiles))),
    );
  }

  List<Widget> get _bottomNavigationTiles {
    final tiles = <Widget>[];

    for (var i = 0; i < items.length; i++) {
      final item = items[i];

      tiles.add(
        _BottomNavigationTile(
          label: item.label,
          svgAsset: item.svgAsset,
          isSelected: currentIndex == i,
          onTap: () {
            onTap(i);
          },
        ),
      );
      if (i < items.length - 1) {
        tiles.add(const VerticalDivider(
          indent: 16,
          endIndent: 16,
          thickness: .2,
        ));
      }
    }
    return tiles;
  }
}

class _BottomNavigationTile extends StatelessWidget {
  final String label;
  final bool isSelected;
  final SvgAsset svgAsset;
  final VoidCallback onTap;

  const _BottomNavigationTile({
    required this.label,
    required this.svgAsset,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              height: 32,
              width: 60,
              decoration: BoxDecoration(
                color: isSelected ? context.colors.surface : null,
                borderRadius: BorderRadius.circular(20),
              ),
              child: SvgWidget.withColor(
                svgAsset: svgAsset,
                height: 24,
                width: 24,
                color: context.colors.onSurface,
              ),
            ),
            const SizedBox(height: 4),
            Text(label, style: context.fonts.titleSmall),
          ],
        ),
      ),
    );
  }
}
