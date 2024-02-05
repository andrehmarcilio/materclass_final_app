import '../../../utils/atomic_bloc/bloc_reducer.dart';
import '../../../utils/atomic_bloc/event_atom.dart';
import 'github_repos_events.dart';
import 'github_repos_states.dart';

final githubReposState = StateAtom<GithubReposState>(GithubReposState.initial());

final githubReposEvents = EventAtom<GithubReposEvents>();
