import '../../utils/atomic_bloc/bloc_reducer.dart';
import '../../utils/atomic_bloc/event_atom.dart';
import 'app_reducer.dart';

final appStateAtom = StateAtom<AppState>(const AppState());

final appEventsAtom = EventAtom<AppEvents>();
