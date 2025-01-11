import '../../bloc/dashboard/dashboard_bloc.dart';
import '../../bloc/driver/driver_checklist_bloc.dart';
import '../../bloc/fuel/fuel_transaction_bloc.dart';
import '../../bloc/login/login_bloc.dart';
import '../../data/repository/dashboard_repo.dart';
import '../../data/repository/firebase_repo.dart';
import '../../data/repository/secure_storage_repo.dart';
import '../../data/usecase/dashboard_usecase.dart';
import '../../data/usecase/login_usecase.dart';
import 'locator.dart';

class DependencyInjections {
  void initFirebaseApis() {
    locator.registerLazySingleton(() => FirebaseRepo());
  }

  void initSecureStorage() {
    locator.registerSingleton(() => SecureStorageRepo());
  }

  void initBlocs() {
    //TODO: use getIt for secure storage
    locator.registerFactory(
        () => LoginBloc(locator<LoginUseCase>(), SecureStorageRepo()));
    locator.registerLazySingleton(
        () => DashboardBloc(locator<DashboardUseCase>()));
    locator.registerLazySingleton(
        () => DriverCheckListBloc(locator<DashboardUseCase>()));
    locator.registerLazySingleton(
        () => FuelTransactionBloc(locator<DashboardUseCase>()));
  }

  void initUseCases() {
    locator.registerLazySingleton(
        () => DashboardUseCase(locator<DashboardRepo>()));
    locator.registerLazySingleton(
        () => LoginUseCase(locator<FirebaseRepo>(), SecureStorageRepo()));
  }

  void initRepositories() {
    locator.registerLazySingleton(() => DashboardRepo(SecureStorageRepo()));
  }
}
