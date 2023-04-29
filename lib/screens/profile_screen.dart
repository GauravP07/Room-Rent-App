import 'package:flutter/material.dart';
import '/providers/profile.dart';

class ProfileScreen extends StatelessWidget {
  final Profile profile = Profile(
    name: 'Promod Adde',
    email: 'PramodAdde@gmail.com',
    imageUrl: 'images/profile2.png',
  );

  ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.all(16),
                child: FloatingActionButton(
                  onPressed: () {
                    // handle edit profile button tap
                  },
                  child: const Icon(Icons.edit),
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(profile.imageUrl),
            ),
          ),
          const SizedBox(height: 28),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                profile.name,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                profile.email,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
          ),
          const Spacer(),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: TextButton(
                onPressed: () {
                  // handle logout button tap
                  Navigator.of(context).pop();
                },
                child: const Text('Logout'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
