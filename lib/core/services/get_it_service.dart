import 'package:fruithub_dashboard/core/services/fire_storage.dart';
import 'package:fruithub_dashboard/core/services/storage_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  // Register services
  getIt.registerSingleton<StorageService>(FireStorage());
  // getIt.registerSingleton<DatabaseService>(FireStoreService());

  // Register repositories
  // getIt.registerSingleton<AuthRepo>(
  //   AuthRepoImpl(
  //     firebaseAuthService: getIt<FirebaseAuthService>(),
  //     databaseService: getIt<DatabaseService>(),
  //   ),
  // );

  // // Register cubits
  // getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt<AuthRepo>()));
}
