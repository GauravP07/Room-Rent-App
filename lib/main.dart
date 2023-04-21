import 'package:flutter/material.dart';
import 'package:room_locator/add_page.dart';
import 'package:room_locator/home_page.dart';
import 'package:room_locator/widgets/drawerr.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currpage = 0;

  List<Widget> pages = [const HomePage(), const AddPage()];

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
            NavigationDestination(icon: Icon(Icons.business), label: "Ads"),
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
