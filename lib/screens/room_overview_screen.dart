import 'package:flutter/material.dart';

class RoomOverviewScreen extends StatelessWidget {
  static const routeName = 'room-overview-screen';
  const RoomOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'This is the overview screen',
      ),
    );
  }
}
