import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../app/interactor/app_atoms.dart';
import '../../app/interactor/app_reducer.dart';
import '../../utils/assets.dart' as assets;
import '../../utils/extensions/context_extensions.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool? showBackButton;
  final VoidCallback? onBackPressed;

  const MyAppBar({
    required this.title,
    this.showBackButton,
    this.onBackPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 4),
        child: Row(
          children: [
            SizedBox.square(
              dimension: 48,
              child: Visibility(
                visible: !(showBackButton ?? Navigator.of(context).canPop()),
                replacement: BackButton(onPressed: onBackPressed),
                child: Image.asset(assets.appLogo),
              ),
            ),
            const SizedBox(width: 4),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.fonts.titleLarge?.copyWith(height: 1),
                ),
                Text(
                  'Flutterando Masterclass',
                  style: context.fonts.titleSmall?.copyWith(height: 1),
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                appEventsAtom.add(SwitchBrightnessMode());
              },
              icon: SvgPicture.asset(
                assets.icMoon,
                colorFilter: ColorFilter.mode(context.colors.onSurface, BlendMode.srcIn),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
