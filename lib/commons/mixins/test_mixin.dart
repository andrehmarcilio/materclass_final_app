import 'dart:io';

import 'package:flutter/foundation.dart';

mixin TestMixin {
  bool get isTesting {
    if (kIsWeb) return false;
    return Platform.environment.containsKey('FLUTTER_TEST');
  }
}
