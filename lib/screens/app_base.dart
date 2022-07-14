import 'package:e_commerce/screens/home2.dart';
import 'package:e_commerce/screens/home_page.dart';
import 'package:e_commerce/screens/favorite.dart';
import 'package:flutter/material.dart';

class Appbase extends StatefulWidget {
  const Appbase({Key? key}) : super(key: key);

  @override
  State<Appbase> createState() => _AppbaseState();
}

class _AppbaseState extends State<Appbase> {
  int currentIndex = 0;

  final screens = [
    HomePage(),
    Favorite(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.purple,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.black,
        currentIndex: currentIndex,
        onTap: (index) => setState(
          () {
            currentIndex = index;
          },
        ),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              activeIcon: Icon(Icons.home_filled)),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined),
              label: "Favorite",
              activeIcon: Icon(Icons.favorite)),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_checkout_outlined),
            label: "Card",
            activeIcon: Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: screens[currentIndex],
    );
  }
}
