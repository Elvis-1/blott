import 'package:blott/src/features/auth/presentation/viewmodels/login_user_viewmodel.dart';
import 'package:blott/src/features/news/data/news_api.dart';
import 'package:blott/src/features/news/domain/services/news_services.dart';
import 'package:blott/src/features/news/presentation/viewmodel/news_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:blott/src/config/network/api_client.dart';
import 'package:blott/src/config/utils/local/auth_local_source.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../core/utils/functions/internet_checker.dart';

final sl = GetIt.instance;

Future<void> setupLocator() async {
  // initialize internet checker
  ConnectionStatusSingleton.getInstance().initialize();
  final prefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => prefs);

  sl.registerLazySingleton<ApiClient>(() => ApiClient(authLocalSource: sl()));

  _registerDataSources();

  // register services
  _registerServices();

  // register viewmodels
  _registerViewModels();
}

void _registerViewModels() {
  sl.registerFactory(() => NewsViewModel(sl()));
  sl.registerFactory(() => LoginUserViewModel());
}

void _registerDataSources() {
  sl
    ..registerLazySingleton<AuthLocalSource>(() => AuthLocalSourceImpl(sl()))
    // same data source for all auth pr
    ..registerLazySingleton<NewsApi>(() => NewsApiImpl(sl()));
}

void _registerServices() {
  sl..registerLazySingleton<NewsService>(() => NewsServiceImpl(newsApi: sl()));
}
