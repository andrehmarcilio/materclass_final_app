import 'package:flutter/material.dart';

import '../../../commons/widgets/circular_loading.dart';
import '../../../commons/widgets/my_app_bar.dart';
import '../../../commons/widgets/sliver_gap.dart';
import '../interactor/github_repos_atoms.dart';
import '../interactor/github_repos_events.dart';
import '../interactor/github_repos_states.dart';
import 'widgets/github_repo_card.dart';

class GithubReposPage extends StatefulWidget {
  const GithubReposPage({super.key});

  @override
  State<GithubReposPage> createState() => _GithubReposPageState();
}

class _GithubReposPageState extends State<GithubReposPage> {
  @override
  void initState() {
    super.initState();
    githubReposEvents.add(GetGithubRepos());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: 'Repositórios',
      ),
      body: ValueListenableBuilder(
        valueListenable: githubReposState,
        builder: _getBodyWidget,
      ),
    );
  }

  Widget _getBodyWidget(BuildContext context, GithubReposState state, Widget? child) {
    return switch (state) {
      GithubReposInitialState _ || GithubReposLoading _ => const Center(child: CircularLoading()),
      GithubReposSuccesssLoaded(:final repositories) => CustomScrollView(
          slivers: [
            const SliverGap(size: 16),
            SliverSafeArea(
              sliver: SliverList.separated(
                itemCount: repositories.length,
                itemBuilder: (_, index) {
                  final repository = repositories[index];

                  return GithubRepoCard(
                    githubRepo: repository,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(height: 16),
              ),
            ),
          ],
        ),
      GithubReposError(:final errorMessage) => Center(child: Text(errorMessage)),
    };
  }
}
