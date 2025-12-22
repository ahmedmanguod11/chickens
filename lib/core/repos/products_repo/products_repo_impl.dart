import 'package:chickens/core/entities/product_entity.dart';
import 'package:chickens/core/errors/failures.dart';
import 'package:chickens/core/models/product_model.dart';
import 'package:chickens/core/services/data_service.dart';
import 'package:chickens/core/utils/backend_endpoint.dart';
import 'package:dartz/dartz.dart';
import 'products_repo.dart';

class ProductsRepoImpl extends ProductsRepo {
  final DatabaseService databaseService;

  ProductsRepoImpl(this.databaseService);

  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      var rawData = await databaseService.getData(
        path: BackendEndpoint.getProducts,
        query: {
          'limit': 10,
          'orderBy': 'sellingCount',
          'descending': true
        },
      );

      List<Map<String, dynamic>> data = [];
      if (rawData is List) {
        data = rawData.map<Map<String, dynamic>>((e) => Map<String, dynamic>.from(e)).toList();
      }

      List<ProductEntity> products =
          data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
      return right(products);
    } catch (e) {
      return left(ServerFailure('Failed to get best selling products: $e'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var rawData = await databaseService.getData(path: BackendEndpoint.getProducts);

      List<Map<String, dynamic>> data = [];
      if (rawData is List) {
        data = rawData.map<Map<String, dynamic>>((e) => Map<String, dynamic>.from(e)).toList();
      }

      List<ProductEntity> products =
          data.map((e) => ProductModel.fromJson(e).toEntity()).toList();

      return right(products);
    } catch (e) {
      return left(ServerFailure('Failed to get products2: $e'));
    }
  }
}
