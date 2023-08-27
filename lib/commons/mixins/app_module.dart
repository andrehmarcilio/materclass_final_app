import 'package:flutter/material.dart';

import '../../utils/service_locator/service_locator.dart';

mixin AppModule<T extends StatefulWidget> on State<T> {
  void initializeDependencies(ServiceLocator serviceLocator);

  @override
  void initState() {
    super.initState();
    serviceLocator.pushNewScope(initializeDependencies);
  }

  @override
  void dispose() {
    serviceLocator.popScope();
    super.dispose();
  }
}
