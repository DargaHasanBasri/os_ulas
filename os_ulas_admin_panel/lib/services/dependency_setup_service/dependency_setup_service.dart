import '../export.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  /// ApiBase => HTTP client management
  getIt.registerLazySingleton<ApiBase>(() => ApiBase());

  /// Services => Layer that makes API calls
  getIt.registerLazySingleton<IUserApiService>(
    () => UserApiService(getIt<ApiBase>()),
  );

  // Repositories => Layer that processes / transforms data from API
  getIt.registerLazySingleton<IUserRepository>(
    () => UserRepository(getIt<IUserApiService>()),
  );

  // Cubit => Bridge between UI and Repository
  getIt.registerFactory<UsersCubit>(
    () => UsersCubit(getIt<IUserRepository>()),
  );
}
