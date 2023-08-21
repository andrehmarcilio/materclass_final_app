import 'package:get_it/get_it.dart';

import '../services/url_launcher.dart';

final serviceLocator = ServiceLocator();

class ServiceLocator {
  final _provider = GetIt.instance;

  T get<T extends Object>({dynamic param}) {
    return _provider.get<T>(param1: param);
  }

  void registerSingleton<T extends Object>(T instance) {
    _provider.registerSingleton<T>(instance);
  }

  void registerLazySingleton<T extends Object>(T Function() constructor) {
    _provider.registerLazySingleton<T>(constructor);
  }

  void registerFactory<T extends Object>(T Function() constructor) {
    _provider.registerFactory<T>(constructor);
  }

  void registerFactoryParam<T extends Object, P1>(T Function(P1) constructor) {
    _provider.registerFactoryParam<T, P1, void>((param, _) => constructor(param));
  }

  Future<void> reset() async {
    await _provider.reset();
  }
}

void initializeDependencies() {
  serviceLocator.registerFactory<UrlLauncher>(() => UrlLauncherIMPL());
}
