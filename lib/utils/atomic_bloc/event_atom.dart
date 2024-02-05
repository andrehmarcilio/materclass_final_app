import 'package:flutter/material.dart';

class EventAtom<T> extends ValueNotifier<T?> {
  EventAtom([super.value]);

  void add(T event) {
    value = event;
  }
}
