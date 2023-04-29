import 'package:flutter/material.dart';
import '/screens/search_screen.dart';

class Drawerr extends StatelessWidget {
  const Drawerr({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('Promod Adde'),
            accountEmail: Text('PramodAdde@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('images/profile2.png'),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.search,
              color: Colors.amber,
            ),
            title: const Text('Search Properties'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(SearchScreen.routeName);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.bookmark,
              color: Colors.purple,
            ),
            title: const Text('WishList'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.payment,
              color: Colors.green,
            ),
            title: const Text('Pay Your Rent'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Divider(
            height: 20,
            thickness: 2,
            color: Colors.grey[400],
          ),
          ListTile(
            leading: const Icon(
              Icons.person,
              color: Color(0xFF210347),
            ),
            title: const Text('About Developers'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
