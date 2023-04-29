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

  List<Widget> pages = [ Landing(), ProfileScreen()];

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
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
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
