import 'package:chickens/core/entities/product_entity.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  int quanitty;

  /// خاص بالفراخ
  String? chickenType;
  double? weightInKg;

  /// سعر التنضيف لكل فرخة (يتم تحميله من Firebase)
  double extraPerChicken;

  CartItemEntity({
    required this.productEntity,
    this.quanitty = 0,
    this.chickenType,
    this.weightInKg,
    this.extraPerChicken = 0.0, // مبدئياً صفر، هيتحدث من Firebase
  });

  int get quantity => quanitty;

  bool get isChicken => productEntity.name.contains("فراخ");

  double calculateTotalPrice() {
    if (quanitty == 0) return 0.0;

    if (isChicken && weightInKg != null) {
      return (productEntity.price.toDouble() * weightInKg! * quanitty.toDouble()) +
          (extraPerChicken * quanitty.toDouble());
    }

    return productEntity.price.toDouble() * quanitty.toDouble();
  }

  double calculateTotalWeight() {
    if (!isChicken || weightInKg == null) return 0.0;
    return weightInKg! * quanitty.toDouble();
  }

  void increasQuantity() {
    quanitty++;
  }

  void decreasQuantity() {
    if (quanitty > 0) quanitty--;
  }

  @override
  List<Object?> get props => [
        productEntity,
        quanitty,
        chickenType,
        weightInKg,
        extraPerChicken,
      ];
}
