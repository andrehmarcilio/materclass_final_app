# Architecture

In this section, we will provide insights into the key patterns and processes that have been employed in the development of this project.

## Rules

1. Ensure a minimum of 70% test coverage.
2. Utilize the 'commons' folder to house global layers.
3. Include all the patterns used in this project under the "Design Patterns" section.
4. Use of dependency injection to achieve loose coupling between components (the only exception is the ViewModel layer).

## Design Patterns

### Service

It involves abstracting and encapsulating specific functionalities or services into separate classes or modules, enhancing code maintainability, reusability, and testability.

In our application, services are organized within the [util](lib/utils) folder. Each service encapsulates a specific functionality and is designed to interact with other components through well-defined interfaces. 
