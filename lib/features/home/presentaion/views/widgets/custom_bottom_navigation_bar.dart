import 'package:chickens/features/home/domain/entites/bottom_navigation_bar_entity.dart';
import 'package:chickens/features/home/presentaion/views/widgets/navigation_bar_item.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

int selectedIndex = 0;
class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
  width: 375,
  height: 70,
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: const BorderRadius.only(
      topLeft: Radius.circular(30),
      topRight: Radius.circular(30),
    ),
    boxShadow: const [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 10,
        spreadRadius: 2,
        offset: Offset(0, -3),
      ),
    ],
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children:  bottomNavigationBarItems.asMap().entries.map((e) {
      int index = e.key;
      BottomNavigationBarEntity item = e.value;
      return Expanded(
        flex: index == selectedIndex ? 3 : 2,
        child: GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: NavigationBarItem(
            isSelected: selectedIndex == index,
            bottomNavigationBarEntity: item,
          ),
        ),
      );
    }).toList(),
  ),
);

  }
}


//video 18