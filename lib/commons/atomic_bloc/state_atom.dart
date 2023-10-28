part of 'bloc_reducer.dart';

class StateAtom<T> extends ValueNotifier<T> {
  StateAtom(super.value);

  @visibleForTesting
  void update(T newState) {
    value = newState;
  }

  @override
  @visibleForTesting
  set value(T newValue) {
    super.value = newValue;
  }
}
