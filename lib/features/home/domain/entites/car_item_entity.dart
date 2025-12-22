import 'package:chickens/core/entities/product_entity.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  int quanitty;

  /// خاص بالمنتجات القابلة للوزن (فراخ، بط، أرنب، ديك رومي، وز هيطون)
  String? chickenType; // للفراخ فقط
  double? weightInKg;

  /// سعر التنضيف لكل وحدة
  double extraPerChicken;

  CartItemEntity({
    required this.productEntity,
    this.quanitty = 0,
    this.chickenType,
    this.weightInKg,
    this.extraPerChicken = 0.0,
  });

  int get quantity => quanitty;

  /// هل المنتج من المنتجات القابلة للوزن
  bool get isWeighableAnimal =>
      productEntity.name.contains("فراخ") ||
      productEntity.name.contains("بط") ||
      productEntity.name.contains("duck_goose") ||
      productEntity.name.contains("أرنب") ||
      productEntity.name.contains("rabbit") ||
      productEntity.name.contains("ديك رومي") ||
      productEntity.name.contains("turkey") ||
      productEntity.name.contains("أوز"); // أضفنا "وز هيطون"

  /// حساب السعر النهائي
  double calculateTotalPrice() {
    if (quanitty == 0) return 0.0;

    if (isWeighableAnimal && weightInKg != null) {
      // السعر = (السعر × الوزن × العدد) + (سعر التنظيف × العدد)
      return (productEntity.price.toDouble() * weightInKg! * quanitty.toDouble()) +
          (extraPerChicken * quanitty.toDouble());
    }

    // باقي المنتجات بدون وزن
    return productEntity.price.toDouble() * quanitty.toDouble();
  }

  /// الوزن الكلي (للفراخ والحيوانات القابلة للوزن)
  double calculateTotalWeight() {
    if (!isWeighableAnimal || weightInKg == null) return 0.0;
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
