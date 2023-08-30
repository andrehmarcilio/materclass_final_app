import 'package:flutter/material.dart';

import '../../../../commons/widgets/svg_widget.dart';
import '../../../../utils/extensions/context_extensions.dart';
import '../../model/profile_info.dart';

class ProfileInfoCard extends StatelessWidget {
  final ProfileInfo profileInfo;
  final EdgeInsets? margin;

  const ProfileInfoCard({
    required this.profileInfo,
    this.margin,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final fonts = context.fonts;

    return Container(
      margin: margin,
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 28),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        children: [
          CircleAvatar(
            key: ValueKey(profileInfo.avatar),
            radius: 60,
            foregroundImage: NetworkImage(profileInfo.avatar),
          ),
          const SizedBox(height: 12),
          Text(
            profileInfo.name,
            style: fonts.titleLarge,
          ),
          const SizedBox(height: 12),
          Text(
            profileInfo.bio,
            textAlign: TextAlign.center,
            style: fonts.bodyLarge,
          ),
          const SizedBox(height: 45),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: profileInfo.contactInfo.map(
              (contact) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: SvgWidget.withColor(
                    key: ValueKey(contact.url + contact.iconAsset.path),
                    width: 24,
                    height: 24,
                    svgAsset: contact.iconAsset,
                    color: context.colors.onSurface,
                  ),
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}
