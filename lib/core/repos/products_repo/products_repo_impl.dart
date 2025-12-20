import 'package:chickens/core/entities/product_entity.dart';
import 'package:chickens/core/errors/failures.dart';
import 'package:chickens/core/models/product_model.dart';
import 'package:chickens/core/repos/products_repo/products_repo.dart';
import 'package:chickens/core/services/data_service.dart';
import 'package:chickens/core/utils/backend_endpoint.dart';
import 'package:dartz/dartz.dart';


class ProductsRepoImpl extends ProductsRepo {
  final DatabaseService databaseService;

  ProductsRepoImpl(this.databaseService);
  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      var data = await databaseService.getData(
          path: BackendEndpoint.getProducts,
          query: {
            'limit': 10,
            'orderBy': 'sellingCount',
            'descending': true
          }) as List<Map<String, dynamic>>;

      List<ProductEntity> products =
          data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
      return right(products);
    } catch (e) {
      return left(ServerFailure('فشل في جلب البيانات'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data = await databaseService.getData(
          path: BackendEndpoint.getProducts) as List<Map<String, dynamic>>;

      List<ProductEntity> products =
          data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
      return right(products);
    } catch (e) {
      return left(ServerFailure('فشل في جلب البيانات'));
    }
  }
}
