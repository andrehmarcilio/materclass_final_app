import 'package:flutter/foundation.dart';

class HomeRouterConfiguration {
  final currentBottomNavigationIndex = ValueNotifier(0);

  void updateBottomNavigationIndex(int newIndex) {
    currentBottomNavigationIndex.value = newIndex;
  }
}
