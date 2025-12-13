
import 'package:chickens/core/repos/products_repo/products_repo.dart';
import 'package:chickens/core/repos/products_repo/products_repo_impl.dart';
import 'package:chickens/core/services/data_service.dart';
import 'package:chickens/core/services/firestore_service.dart';

import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetit() {
  getIt.registerSingleton<DatabaseService>(FireStoreService());
 
  getIt.registerSingleton<ProductsRepo>(
    ProductsRepoImpl(
      getIt<DatabaseService>(),
    ),
  );

  
}
