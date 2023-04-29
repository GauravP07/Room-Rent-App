import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/providers/rooms.dart';
import '/screens/room_overview_screen.dart';

class RoomItem extends StatelessWidget {
  final String id;

  const RoomItem({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final loadedRoom = Provider.of<Rooms>(context, listen: false).findById(id);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(RoomOverviewScreen.routeName, arguments: id);
      },
      child: Card(
        elevation: 5,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Row(
          children: [
            Container( 
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(loadedRoom.imageUrl),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    loadedRoom.title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    loadedRoom.description.substring(0, 50) + "...",
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 18),
                      const SizedBox(width: 5),
                      Text(
                        loadedRoom.rating.toString(),
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "(${loadedRoom.numReviews})",
                        style: const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
