import 'package:ecom_ui/pages/bagPage.dart';
import 'package:ecom_ui/pages/favourites/ui/favourites.dart';
import 'package:ecom_ui/pages/home.dart';
import 'package:ecom_ui/pages/profilePage.dart';
import 'package:ecom_ui/pages/shop.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  final String? name;
  const NavigationPage({super.key, this.name});

  @override
  State<NavigationPage> createState() => _Home();
}

class _Home extends State<NavigationPage> {
  int _currentIndex = 0;

  late List<Widget> _pages;

  @override
  void initState() {
    var name = widget.name;
    _pages = [
      PageOne(name: name),
      PageTwo(),
      PageThree(),
      PageFour(),
      PageFive(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.grey),
            activeIcon: Icon(Icons.home, color: Colors.red),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined, color: Colors.grey),
            activeIcon: Icon(Icons.shopping_cart, color: Colors.red),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: Colors.grey,
            ),
            activeIcon: Icon(
              Icons.shopping_bag,
              color: Colors.red,
            ),
            label: 'Bag',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border_outlined, color: Colors.grey),
            activeIcon: Icon(Icons.favorite, color: Colors.red),
            label: 'Favourites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined, color: Colors.grey),
            activeIcon: Icon(Icons.account_circle, color: Colors.red),
            label: 'Profile',
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.red[400],
        onTap: (index) => setState(() {
          this._currentIndex = index;
        }),
      ),
    );
  }
}

class PageOne extends StatefulWidget {
  final String? name;
  PageOne({Key? key, this.name}) : super(key: key);
  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  @override
  Widget build(BuildContext context) {
    return const Home();
  }
}

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Shop();
  }
}

class PageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Bag();
  }
}

class PageFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FavoritePage();
  }
}

class PageFive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const ProfilePage();
  }
}
