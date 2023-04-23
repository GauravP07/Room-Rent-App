import 'package:flutter/material.dart';

class Profile with ChangeNotifier{
  final String name;
  final String email;
  final String imageUrl;

  Profile({
    required this.name,
    required this.email,
    required this.imageUrl,
  });
}

