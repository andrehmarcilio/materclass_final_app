import '../../../commons/atomic_bloc/bloc_reducer.dart';
import 'github_repos_atoms.dart';
import 'github_repos_events.dart';
import 'github_repos_service.dart';
import 'github_repos_states.dart';

class GithubReposReducer extends BlocReducer<GithubReposState, GithubReposEvents> {
  final GithubReposService _githubReposService;

  GithubReposReducer({required GithubReposService repositoriesService})
      : _githubReposService = repositoriesService,
        super(state: githubReposState, eventsAtom: githubReposEvents) {
    on<GetGithubRepos>(_getGithubRepos);
  }

  Future<void> _getGithubRepos(GetGithubRepos getGithubRepos) async {
    emit(GithubReposState.setLoading());
    final newState = await _githubReposService.getGithubRepos();
    emit(newState);
  }
}
