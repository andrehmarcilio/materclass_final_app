import '../../../commons/atomic_bloc/bloc_reducer.dart';
import '../../../utils/services/url_launcher.dart';
import 'github_repos_atoms.dart';
import 'github_repos_events.dart';
import 'github_repos_service.dart';
import 'github_repos_states.dart';

class GithubReposReducer extends BlocReducer<GithubReposState, GithubReposEvents> {
  final UrlLauncher _urlLauncher;
  final GithubReposService _githubReposService;

  GithubReposReducer({
    required UrlLauncher urlLauncher,
    required GithubReposService repositoriesService,
  })  : _urlLauncher = urlLauncher,
        _githubReposService = repositoriesService,
        super(state: githubReposState, eventsAtom: githubReposEvents) {
    on<GetGithubRepos>(_getGithubRepos);
    on<SeeSourceCode>(_seeSourceCode);
  }

  Future<void> _getGithubRepos(GetGithubRepos getGithubRepos) async {
    emit(GithubReposState.setLoading());
    final newState = await _githubReposService.getGithubRepos();
    emit(newState);
  }

  void _seeSourceCode(SeeSourceCode seeSourceCode) {
    _urlLauncher.launchUrl(seeSourceCode.sourceCodeUrl);
  }
}
