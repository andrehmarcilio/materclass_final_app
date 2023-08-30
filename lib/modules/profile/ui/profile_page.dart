import 'package:flutter/material.dart';

import '../../../commons/widgets/my_app_bar.dart';
import '../../../utils/extensions/context_extensions.dart';
import '../data/profile_data.dart';
import 'widgets/profile_info_card.dart';
import 'widgets/skills_card.dart';
import 'widgets/technology_card.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final fonts = context.fonts;

    return Scaffold(
      appBar: const MyAppBar(title: 'Sobre o dev'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            ProfileInfoCard(
              profileInfo: profileData.profileInfo,
              margin: const EdgeInsets.symmetric(horizontal: 16),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Tecnologias Favoritas',
                style: fonts.titleMedium,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 112,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: profileData.favoriteTecnologies.length,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (_, index) {
                  final technology = profileData.favoriteTecnologies[index];

                  return AspectRatio(
                    aspectRatio: .94,
                    child: TechnologyCard(technology: technology),
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(width: 20),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Habilidades e Competências',
                style: fonts.titleMedium,
              ),
            ),
            const SizedBox(height: 16),
            SkillsCard(
              skills: profileData.skills,
              margin: const EdgeInsets.symmetric(horizontal: 16),
            ),
            const SafeArea(child: SizedBox(height: 16)),
          ],
        ),
      ),
    );
  }
}
