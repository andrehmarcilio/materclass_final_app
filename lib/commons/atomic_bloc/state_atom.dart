import 'package:flutter/material.dart';

class StateAtom<T> extends ValueNotifier<T> {
  StateAtom(super.value);

  void update(T newState) {
    value = newState;
  }
}
