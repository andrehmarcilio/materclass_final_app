import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app/data/app_service_impl.dart';
import '../../app/interactor/app_reducer.dart';
import '../../app/interactor/app_service.dart';
import '../../data/http_client/http_client.dart';
import '../services/url_launcher.dart';
import '../services/user_config_store.dart';

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

  void registerSingletonAsync<T extends Object>(
    Future<T> Function() asyncConstructor, {
    FutureOr<dynamic> Function(T)? dispose,
  }) {
    _provider.registerSingletonAsync<T>(asyncConstructor, dispose: dispose);
  }

  void registerFactory<T extends Object>(T Function() constructor) {
    _provider.registerFactory<T>(constructor);
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

  Future<void> allReady() async {
    await _provider.allReady();
  }
}

Future<void> initializeDependencies() async {
  serviceLocator.registerSingleton<HttpClient>(HttpClientIMPL());

  serviceLocator.registerFactory<UrlLauncher>(UrlLauncherIMPL.new);

  serviceLocator.registerSingletonAsync<UserConfigStore>(() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    return UserConfigStoreIMPL(sharedPreferences: sharedPreferences);
  });

  serviceLocator.registerFactory<AppService>(() {
    return AppServiceIMPL(userConfigStore: serviceLocator.get());
  });

  await serviceLocator.allReady();

  serviceLocator.registerSingleton(AppReducer(appService: serviceLocator.get()));
}
