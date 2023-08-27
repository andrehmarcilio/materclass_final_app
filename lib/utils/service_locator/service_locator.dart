import 'dart:async';

import 'package:get_it/get_it.dart';

import '../../data/http_client/http_client.dart';
import '../services/url_launcher.dart';

final serviceLocator = ServiceLocator();

class ServiceLocator {
  final _provider = GetIt.instance;

  T get<T extends Object>({dynamic param}) {
    return _provider.get<T>(param1: param);
  }

  void registerSingleton<T extends Object>(
    T instance, {
    FutureOr<dynamic> Function(T)? dispose,
  }) {
    _provider.registerSingleton<T>(instance, dispose: dispose);
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

  void pushNewScope(void Function(ServiceLocator)? init) {
    _provider.pushNewScope(init: (_) => init?.call(serviceLocator));
  }

  Future<void> popScope() async {
    await _provider.popScope();
  }

  Future<void> reset() async {
    await _provider.reset();
  }
}

void initializeDependencies() {
  serviceLocator.registerSingleton<HttpClient>(HttpClientIMPL());

  serviceLocator.registerFactory<UrlLauncher>(() => UrlLauncherIMPL());
}
