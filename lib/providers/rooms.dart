import 'package:flutter/material.dart';

class Room with ChangeNotifier {
  final String? id;
  final String title;
  final String description;
  final double rent;
  bool isWishlisted;

  Room({
    required this.id,
    required this.title,
    required this.description,
    required this.rent,
    this.isWishlisted = false,
  });

  void toggleWishlist() {
    isWishlisted = !isWishlisted;
    notifyListeners();
  }
}
