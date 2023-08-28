import 'package:flutter/material.dart';

import '../../commons/mixins/app_module.dart';
import '../../utils/service_locator/service_locator.dart';
import 'data/github_repos_data_source.dart';
import 'data/github_repos_service_impl.dart';
import 'interactor/github_repos_reducer.dart';
import 'interactor/github_repos_service.dart';
import 'ui/github_repos_page.dart';

class GithubReposModule extends StatefulWidget {
  const GithubReposModule({super.key});

  @override
  State<GithubReposModule> createState() => _GithubReposModuleState();
}

class _GithubReposModuleState extends State<GithubReposModule> with AppModule {
  @override
  void initializeDependencies(ServiceLocator serviceLocator) {
    serviceLocator.registerFactory<GithubReposDataSource>(() {
      return GithubReposRemoteDataSource(httpClient: serviceLocator.get());
    });

    serviceLocator.registerFactory<GithubReposService>(() {
      return GithubReposServiceIMPL(githubReposDatasource: serviceLocator.get());
    });

    serviceLocator.registerSingleton<GithubReposReducer>(
      GithubReposReducer(
        urlLauncher: serviceLocator.get(),
        repositoriesService: serviceLocator.get(),
      ),
      dispose: (githubReposReducer) {
        githubReposReducer.dispose();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const GithubReposPage();
  }
}
