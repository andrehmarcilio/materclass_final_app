import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/assets.dart';
import '../../../../utils/extensions/context_extensions.dart';
import '../../interactor/github_repos_atoms.dart';
import '../../interactor/github_repos_events.dart';
import '../../model/github_repo.dart';

class GithubRepoCard extends StatelessWidget {
  final EdgeInsets? margin;
  final GithubRepo githubRepo;

  const GithubRepoCard({
    required this.githubRepo,
    this.margin,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final fonts = context.fonts;

    return GestureDetector(
      onTap: () {
        githubReposEvents.add(SeeSourceCode(sourceCodeUrl: githubRepo.url));
      },
      child: Container(
        margin: margin,
        padding: const EdgeInsets.fromLTRB(10, 12, 10, 20),
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: colors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    icGithub,
                    colorFilter: ColorFilter.mode(colors.surface, BlendMode.srcIn),
                  ),
                ),
                const SizedBox(width: 12),
                Text(githubRepo.title, style: fonts.titleMedium),
                const Spacer(),
                Text('Size: ${githubRepo.size}', style: fonts.bodySmall),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              githubRepo.description,
              style: fonts.bodySmall,
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}
