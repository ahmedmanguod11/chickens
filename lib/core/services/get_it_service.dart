import 'package:get_it/get_it.dart';
import 'package:chickens/core/services/firebase_auth_service.dart';
import 'package:chickens/core/services/data_service.dart';
import 'package:chickens/core/services/firestore_service.dart';

import 'package:chickens/core/repos/products_repo/products_repo.dart';
import 'package:chickens/core/repos/products_repo/products_repo_impl.dart';

final getIt = GetIt.instance;

void setupGetit() {
  // الخدمات أولًا
  getIt.registerSingleton<DatabaseService>(FireStoreService());
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());

  // الريبو بعد الخدمات
  getIt.registerSingleton<ProductsRepo>(
    ProductsRepoImpl(
      getIt<DatabaseService>(),
    ),
  );

  // getIt.registerSingleton<AuthRepo>(
  //   AuthRepoImpl(
  //     databaseService: getIt<DatabaseService>(),
  //     firebaseAuthService: getIt<FirebaseAuthService>(),
  //   ),
  // );
}
