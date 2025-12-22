// products_repo.dart
import 'package:chickens/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import '../../entities/product_entity.dart';

abstract class ProductsRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts();
}
