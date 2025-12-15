import 'package:flutter/material.dart';
import 'package:chickens/core/utils/app_images.dart';

class BottomNavigationBarEntity {
  final String activeImage, inActiveImage;
  final String name;

  BottomNavigationBarEntity({
    required this.activeImage,
    required this.inActiveImage,
    required this.name,
  });
}

// قائمة عناصر الـ Bottom Navigation Bar
final List<BottomNavigationBarEntity> bottomNavigationBarItems = [
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

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;

  // الصفحات اللي هتظهر عند الضغط على كل زر
  final List<Widget> pages = [
    Center(child: Text('Home Page', style: TextStyle(fontSize: 24))),
    Center(child: Text('Products Page', style: TextStyle(fontSize: 24))),
    Center(child: Text('Cart Page', style: TextStyle(fontSize: 24))),
    Center(child: Text('Profile Page', style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: bottomNavigationBarItems.map((e) {
          // ignore: unused_local_variable
          int index = bottomNavigationBarItems.indexOf(e);
          return BottomNavigationBarItem(
            icon: Image.asset(e.inActiveImage, width: 24, height: 24),
            activeIcon: Image.asset(e.activeImage, width: 24, height: 24),
            label: e.name,
          );
        }).toList(),
      ),
    );
  }
}
