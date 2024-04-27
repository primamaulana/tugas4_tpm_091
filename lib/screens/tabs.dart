import 'package:favorite_meals/providers/favorites_provider.dart';
import 'package:favorite_meals/screens/bantuan.dart';
import 'package:favorite_meals/screens/dashboard.dart';
import 'package:favorite_meals/screens/site.dart';
import 'package:favorite_meals/screens/stopwatch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    Widget activePage = const MyHomePage();
    var activePageTitle = 'Dashboard';

    if (_selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activePage = StopWatch();
      activePageTitle = 'Stopwatch';
    }
    if (_selectedPageIndex == 2) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activePage = ProfilePage();
      activePageTitle = 'Help';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: 'Stopwatch',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_outline),
            label: 'Help',
          ),
        ],
      ),
    );
  }
}
