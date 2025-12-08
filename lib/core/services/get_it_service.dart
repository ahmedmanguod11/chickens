
import 'package:chickens/core/repos/products_repo/products_repo.dart';
import 'package:chickens/core/repos/products_repo/products_repo_impl.dart';
import 'package:chickens/core/services/data_service.dart';
import 'package:chickens/core/services/firestore_service.dart';

import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {
  // getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseService>(FireStoreService());
  // getIt.registerSingleton<AuthRepo>(
  //   AuthRepoImpl(
  //     firebaseAuthService: getIt<FirebaseAuthService>(),
  //     databaseService: getIt<DatabaseService>(),
  //   ),
  // );

  getIt.registerSingleton<ProductsRepo>(
    ProductsRepoImpl(
      getIt<DatabaseService>(),
    ),
  );

  // getIt.registerSingleton<OrdersRepo>(
  //   OrdersRepoImpl(
  //     getIt<DatabaseService>(),
  //   ),
  // );
}
