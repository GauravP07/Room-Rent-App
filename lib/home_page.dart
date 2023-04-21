import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 16.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: IconButton(
                  icon: const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('images/profile.jpg'),
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  iconSize: 48.0,
                ),
              ),
              const Expanded(
                child: Center(
                  child: Text(
                    'Current Location',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding:const  EdgeInsets.symmetric(horizontal: 25.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.search_sharp),
                  onPressed: () {},
                ),
               const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search address, city, location',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                    ),
                  ),
                ),
                
              ],
            ),
          ),
        ),
      ],
    );
  }
}
