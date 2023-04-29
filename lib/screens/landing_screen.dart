import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/providers/rooms.dart';
import '/widgets/room_item.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';



class Landing extends StatefulWidget {
  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  // const Landing({Key? key}) : super(key: key);
   String _cityName = '';
   @override
   void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    // List<Placemark> placemarks = await Geolocator.placemarkFromCoordinates(
    //     position.latitude, position.longitude);
      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark placemark = placemarks[0];
    setState(() {
      _cityName = placemark.locality!;
    });
  }

  Widget build(BuildContext context) {
    final rooms = Provider.of<Rooms>(context);
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('images/profile2.png'),
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                iconSize: 48.0,
              ),
               Center(
                child: Text(
                  _cityName,
                  style:const TextStyle(fontSize: 20),
                ),
              ),
              IconButton(
                iconSize: 25,
                icon: const Icon(
                  Icons.bookmark,
                  color: Colors.purple,
                ),
                onPressed: () {
                  // ...
                },
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
                  icon: const Icon(
                    Icons.search_sharp,
                    color: Colors.purple,
                  ),
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
        Expanded(
          child: ListView.builder(
            itemCount: rooms.items.length,
            itemBuilder: (ctx, i) {
              return RoomItem(
                  id: rooms.items[i].id!,
                );
            },
          ),
        ),
      ],
    );
  }
}
