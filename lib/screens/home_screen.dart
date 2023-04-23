import 'package:flutter/material.dart';
import '/screens/landing_screen.dart';
import '/screens/profile_screen.dart';
import '/widgets/drawerr.dart';

class MyHomePage extends StatefulWidget {
  static const routeName = '/home';
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currpage = 0;

  List<Widget> pages = [const Landing(), ProfileScreen()];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: const Drawerr(),
        body: IndexedStack(
          index: currpage,
          children: pages,
        ),
        bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home,color:  Color(0xFF210347),), label: "Home"),
            NavigationDestination(icon: Icon(Icons.person, color:  Color(0xFF210347),), label: "Profile"),
          ],
          onDestinationSelected: (int index) {
            setState(() {
              currpage = index;
            });
          },
          selectedIndex: currpage,
        ),
      ),
    );
  }
}
