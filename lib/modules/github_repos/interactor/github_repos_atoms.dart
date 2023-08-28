import '../../../commons/atomic_bloc/event_atom.dart';
import '../../../commons/atomic_bloc/state_atom.dart';
import 'github_repos_events.dart';
import 'github_repos_states.dart';

final githubReposState = StateAtom<GithubReposState>(GithubReposState.initial());

final githubReposEvents = EventAtom<GithubReposEvents>();
