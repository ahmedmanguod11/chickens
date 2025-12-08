import 'package:chickens/core/utils/app_images.dart';

class BottomNavigationBarEntity {
  final String activeImage, inActiveImage;
  final String name;

  BottomNavigationBarEntity({required this.activeImage, required this.inActiveImage, required this.name});
  
}

List<BottomNavigationBarEntity>get bottomNavigationBarItems =>[
  BottomNavigationBarEntity(
      activeImage: Assets.homeactive,
      inActiveImage: Assets.home,
      name: "الرئيسية"),
  BottomNavigationBarEntity(
      activeImage: Assets.productsactive,
      inActiveImage: Assets.products,
      name: "المنتجات"),
  BottomNavigationBarEntity(
      activeImage: Assets.cartactive,
      inActiveImage: Assets.cart,
      name: "سلة تسوق"),
  BottomNavigationBarEntity(
      activeImage: Assets.useractive,
      inActiveImage: Assets.user,
      name: "حسابي"),
];