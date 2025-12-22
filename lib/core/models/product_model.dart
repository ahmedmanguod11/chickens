import 'package:chickens/core/entities/product_entity.dart';
import '../helper_functions/get_avg_rating.dart';
import 'review_model.dart';

class ProductModel {
  final String name;
  final String code;
  final String description;
  final num price;

  final bool isFeatured;
  final num sellingCount;
  String? imageUrl;
  final int expirationsMonths;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating;
  final num ratingCount = 0;
  final int unitAmount;
  final List<ReviewModel> reviews;

  ProductModel({
    required this.name,
    required this.code,
    required this.description,
    required this.expirationsMonths,
    required this.numberOfCalories,
    required this.avgRating,
    required this.unitAmount,
    required this.sellingCount,
    required this.reviews,
    required this.price,
    required this.isOrganic,
    required this.isFeatured,
    this.imageUrl,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    List<ReviewModel> reviewsList = [];
    if (json['reviews'] != null) {
      reviewsList = List<ReviewModel>.from(
        json['reviews'].map((e) => ReviewModel.fromJson(e)),
      );
    }

    return ProductModel(
      avgRating: getAvgRating(reviewsList),
      name: json['name'] ?? '',
      code: json['code'] ?? '',
      description: json['description'] ?? '',
      expirationsMonths: (json['expirationsMonths'] ?? 0).toInt(),
      numberOfCalories: (json['numberOfCalories'] ?? 0).toInt(),
      unitAmount: (json['unitAmount'] ?? 0).toInt(),
      sellingCount: (json['sellingCount'] ?? 0).toInt(),
      reviews: reviewsList,
      price: (json['price'] ?? 0).toDouble(),
      isOrganic: json['isOrganic'] ?? false,
      isFeatured: json['isFeatured'] ?? false,
      imageUrl: json['imageUrl'] ?? '',
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      name: name,
      code: code,
      description: description,
      price: price,
      reviews: reviews.map((e) => e.toEntity()).toList(),
      expirationsMonths: expirationsMonths,
      numberOfCalories: numberOfCalories,
      unitAmount: unitAmount,
      isOrganic: isOrganic,
      isFeatured: isFeatured,
      imageUrl: imageUrl,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
      'description': description,
      'price': price,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'expirationsMonths': expirationsMonths,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'isOrganic': isOrganic,
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }
}
