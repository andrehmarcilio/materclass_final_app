# Architecture

In this section, we will provide insights into the key patterns and processes that have been employed in the development of this project.

## Rules

1. Ensure a minimum of 70% test coverage.
2. Utilize the 'commons' folder to house global layers.
3. Include all the patterns used in this project under the "Design Patterns" section.
4. Use of dependency injection to achieve loose coupling between components (the only exception is the Reducer layer).

## Design Patterns

### Service

It involves abstracting and encapsulating specific functionalities or services into separate classes or modules, enhancing code maintainability, reusability, and testability.

In our application, services are organized within the [util](lib/utils) folder. Each service encapsulates a specific functionality and is designed to interact with other components through well-defined interfaces. 

### BlocReducer

#### Overview

The BlocReducer pattern is an architecture pattern used to manage application state and handle events in a structured and organized manner. It follows the reducer pattern and event-driven design, providing a clean separation of concerns between state management and event handling. This pattern promotes modularity, reusability, and testability by encapsulating state-related logic into manageable units.

#### Implementation
The key components of the BlocReducer pattern are as follows:

- State: Represents the current application state. It holds the data that the UI components need to render. The state is immutable, and any change to it results in the creation of a new state object.

- Event: Represents a specific action or event that triggers a state change. Events can carry additional data required for processing by the reducer.

- BlocReducer: An abstract class that provides a framework for managing application state using the reducer pattern based on events. It encapsulates the core logic of handling events and updating the state.

#### Key Methods
1. on<T extends Event>(void Function(T) onEventCalled): Registers a callback function to be invoked when an event of type T is dispatched. The registered callback will receive the specific event instance of type T as a parameter.
2. emit(State newState): Emits a new application state, triggering updates in listeners. This method is used by the reducer to indicate a state change.
3. dispose(): Cleans up resources, removes listeners, and disposes of the state and event channel. This method is essential to prevent memory leaks when the BlocReducer is no longer needed.

### Adapters

Adapters are utility classes used to convert data between different formats or structures. They serve as intermediaries, enabling seamless communication between incompatible components.