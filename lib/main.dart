import 'package:flutter/material.dart';

import 'app/masterclass_app.dart';
import 'utils/service_locator/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MasterclassApp());
}
