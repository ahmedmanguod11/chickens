import 'package:chickens/core/entities/product_entity.dart';
import 'package:chickens/features/home/domain/entites/car_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;

  CartEntity(this.cartItems);

  void addCartItem(CartItemEntity item) {
    cartItems.add(item);
  }

  void removeCarItem(CartItemEntity item) {
    cartItems.remove(item);
  }

  /// إجمالي الكارت كله
  double calculateTotalPrice() {
    double total = 0;
    for (var item in cartItems) {
      total += item.calculateTotalPrice();
    }
    return total;
  }

  /// عناصر الفراخ فقط
  List<CartItemEntity> get chickenItems =>
      cartItems.where((e) => e.weightInKg != null).toList();

  /// باقي المنتجات
  List<CartItemEntity> get nonChickenItems =>
      cartItems.where((e) => e.weightInKg == null).toList();

  /// عدد الفراخ
  int get chickensCount =>
      chickenItems.fold(0, (sum, item) => sum + item.quantity);

  /// الوزن الكلي للفراخ
  double get chickensWeight =>
      chickenItems.fold(0, (sum, item) => sum + item.calculateTotalWeight());

  /// سعر الفراخ بدون تنضيف
  double get chickensBaseTotal =>
      chickenItems.fold(
          0,
          (sum, item) =>
              sum +
              (item.productEntity.price *
                  (item.weightInKg ?? 0) *
                  item.quantity));

  /// إجمالي التنضيف
  double get chickensCleaningTotal =>
      chickenItems.fold(
          0, (sum, item) => sum + (item.extraPerChicken * item.quantity));

  bool isExis(ProductEntity product) {
    return cartItems.any((item) => item.productEntity == product);
  }

  CartItemEntity getCarItem(ProductEntity product) {
    return cartItems.firstWhere(
      (item) => item.productEntity == product,
      orElse: () =>
          CartItemEntity(productEntity: product, quanitty: 1),
    );
  }
}
