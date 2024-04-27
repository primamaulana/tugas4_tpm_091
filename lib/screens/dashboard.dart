import 'package:favorite_meals/data/dummy_data.dart';
import 'package:favorite_meals/screens/prima_page.dart';
import 'package:favorite_meals/screens/segitiga.dart';
import 'package:favorite_meals/screens/site.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:favorite_meals/providers/favorites_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'anggota.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


enum DashboardItemType {
  AnggotaPage,
  PrimaPage,
  Segitiga,
  Site,
  Favorite,
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState(){
    return _MyHomePageState();
  }
}


class _MyHomePageState extends ConsumerState<MyHomePage> {
  String username = "";

  Future getEmail()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      username = preferences.getString('username')!;
    });
  }

  @override
  void initState() {
    super.initState();
    getEmail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 50),
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                  title: Text('Hello ' + username, style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Colors.white
                  )),
                  subtitle: Text('Have a nice day!', style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      color: Colors.white54
                  )),
                  trailing: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey,
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 30)
              ],
            ),
          ),
          Container(
            color: Theme.of(context).primaryColor,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(200)
                  )
              ),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
                children: [
                  itemDashboard('Daftar Anggota', CupertinoIcons.person_2_square_stack, Colors.deepOrange, DashboardItemType.AnggotaPage),
                  itemDashboard('Bilangan Prima', CupertinoIcons.number, Colors.green, DashboardItemType.PrimaPage),
                  itemDashboard('Segitiga', CupertinoIcons.triangle, Colors.purple, DashboardItemType.Segitiga),
                  itemDashboard('Daftar Situs', CupertinoIcons.search, Colors.brown, DashboardItemType.Site),
                  itemDashboard('Favorite', CupertinoIcons.heart_fill, Colors.indigo, DashboardItemType.Favorite),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20)
        ],
      ),
    );
  }

  Widget itemDashboard(String title, IconData iconData, Color background, DashboardItemType type) => GestureDetector(
    onTap: () {
      // Navigasi ke halaman yang sesuai berdasarkan jenis item dashboard
      switch (type) {
        case DashboardItemType.AnggotaPage:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AnggotaPage()),
          );
          break;
        case DashboardItemType.PrimaPage:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PrimaPage()),
          );
          break;
        case DashboardItemType.Segitiga:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Segitiga()),
          );
          break;
        case DashboardItemType.Site:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Site(
              meals: dummyMeals,
            )),
          );
          break;
        case DashboardItemType.Favorite:
          final favoriteMeals = ref.watch(favoriteMealsProvider);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Site(
              meals: favoriteMeals,
            )),
          );
          break;
        default:
        // Do nothing
          break;
      }
    },
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 5),
              color: Theme.of(context).primaryColor.withOpacity(.2),
              spreadRadius: 2,
              blurRadius: 5,
            )
          ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: background,
                shape: BoxShape.circle,
              ),
              child: Icon(iconData, color: Colors.white)
          ),
          const SizedBox(height: 8),
          Text(title.toUpperCase(), style: Theme.of(context).textTheme.subtitle1)
        ],
      ),
    ),
  );



}
