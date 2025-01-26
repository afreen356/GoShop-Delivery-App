import 'package:flutter/material.dart';
import 'package:machine_task/features/home/presentation/screen/account_screen.dart';
import 'package:machine_task/features/home/presentation/screen/cart_page.dart';
import 'package:machine_task/features/home/presentation/screen/home_screen.dart';
import 'package:machine_task/features/home/presentation/screen/my_order.dart';


class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  Color btnClr = const Color.fromRGBO(121, 147, 174, 1);

  int currentSelectedIdx = 0;

  final pages = [
    HomeScreen(),    
    Cartpage(),
    MyOrder(),
    AccountScreen()
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentSelectedIdx],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.grey,
          selectedItemColor: btnClr,
          currentIndex: currentSelectedIdx,
          onTap: (newidx) {
            setState(() {
              currentSelectedIdx = newidx;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'Cart'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_bag_outlined,
                ),
                label: 'My order'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: "Account"),
          ]),
    );
  }
}