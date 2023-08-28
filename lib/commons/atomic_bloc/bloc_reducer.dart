import 'event_atom.dart';
import 'state_atom.dart';

/// An abstract class that provides a framework for managing application state
/// using a reducer pattern based on events.
abstract class BlocReducer<State, Event> {
  /// A map to store registered event callbacks. The key is the type of the event,
  /// and the value is the corresponding callback function.
  final _registeredEventsCallBacks = <Type, Function>{};

  /// The notifier for the application state.
  StateAtom<State> state;

  /// The event channel for receiving events.
  EventAtom<Event?> eventsAtom;

  /// Initializes the reducer and adds a listener to the event channel.
  BlocReducer({required this.state, required this.eventsAtom}) {
    eventsAtom.addListener(_listenToEvents);
  }

  /// Register a callback function to be invoked when an event of type [T] is dispatched.
  ///
  /// The [onEventCalled] callback function will be called with the specific event
  /// instance of type [T] as its parameter.
  void on<T extends Event>(void Function(T) onEventCalled) {
    _registeredEventsCallBacks[T] = onEventCalled;
  }

  /// Emit a new application state, triggering updates in listeners.
  void emit(State newState) {
    state.update(newState);
  }

  /// Clean up resources, remove listeners, and dispose of the state and event channel.
  void dispose() {
    eventsAtom.removeListener(_listenToEvents);
  }

  /// Listen to events from the event channel and dispatch them to the appropriate
  /// registered callback function based on the event's type.
  void _listenToEvents() {
    final currentCallBack = _registeredEventsCallBacks[eventsAtom.value.runtimeType];
    currentCallBack?.call(eventsAtom.value);
  }
}
