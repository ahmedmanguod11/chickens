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

  /// كل المنتجات القابلة للوزن
  List<CartItemEntity> get weighableItems =>
      cartItems.where((e) => e.isWeighableAnimal).toList();

  /// باقي المنتجات
  List<CartItemEntity> get nonWeighableItems =>
      cartItems.where((e) => !e.isWeighableAnimal).toList();

  /// عدد المنتجات القابلة للوزن
  int get weighableItemsCount =>
      weighableItems.fold(0, (sum, item) => sum + item.quantity);

  /// الوزن الكلي للمنتجات القابلة للوزن
  double get weighableItemsWeight =>
      weighableItems.fold(0, (sum, item) => sum + item.calculateTotalWeight());

  /// السعر الأساسي بدون التنضيف للمنتجات القابلة للوزن
  double get weighableBaseTotal =>
      weighableItems.fold(
          0,
          (sum, item) =>
              sum + (item.productEntity.price * (item.weightInKg ?? 0) * item.quantity));

  /// إجمالي التنضيف
  double get weighableCleaningTotal =>
      weighableItems.fold(0, (sum, item) => sum + (item.extraPerChicken * item.quantity));

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
