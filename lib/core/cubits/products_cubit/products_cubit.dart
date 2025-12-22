import 'package:bloc/bloc.dart';
import 'package:chickens/core/entities/product_entity.dart';
import 'package:chickens/core/repos/products_repo/products_repo.dart';
import 'package:meta/meta.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsRepo) : super(ProductsInitial());

  final ProductsRepo productsRepo;

  /// جلب كل المنتجات
  Future<void> getProducts() async {
    emit(ProductsLoading());
    final result = await productsRepo.getProducts();
    result.fold(
      (failure) {
        print('Products Failure: ${failure.message}');
        emit(ProductsFailure(failure.message));
      },
      (products) {
        print('Products Loaded: ${products.length}');
        emit(ProductsSuccess(products));
      },
    );
  }

  /// جلب أفضل المنتجات مبيعًا
  Future<void> getBestSellingProducts() async {
    emit(ProductsLoading());
    final result = await productsRepo.getBestSellingProducts();
    result.fold(
      (failure) {
        print('BestSelling Failure: ${failure.message}');
        emit(ProductsFailure(failure.message));
      },
      (products) {
        print('BestSelling Loaded: ${products.length}');
        emit(ProductsSuccess(products));
      },
    );
  }
}
