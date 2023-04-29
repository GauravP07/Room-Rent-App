import 'package:flutter/material.dart';
import '/providers/room.dart';
import '/providers/room_filters.dart';

class Rooms with ChangeNotifier {
  final List<Room> _items = [
    Room(
      id: '1',
      title: 'Boys Hostel in Mumbai',
      description:
          'A hostel for boys with comfortable rooms and shared facilities',
      rent: 1500.0,
      imageUrl: 'https://www.shutterstock.com/image-photo/modern-design-hotel-hostel-dorm-260nw-1444007420.jpg',
      location: 'Mumbai, Maharashtra',
      rating: 4.5,
      numReviews: 20,
      isWishlisted: false,
      isBoysHostel: true,
      isGirlsHostel: false,
    ),
    Room(
      id: '2',
      title: 'Girls Hostel in Pune',
      description:
          'A hostel for girls with spacious rooms and private bathrooms',
      rent: 2500.0,
      imageUrl: 'https://qph.cf2.quoracdn.net/main-qimg-aaf7d00c1aad03c3398687089b335c06-lq',
      location: 'Pune, Maharashtra',
      rating: 4.8,
      numReviews: 15,
      isWishlisted: false,
      isBoysHostel: false,
      isGirlsHostel: true,
    ),
    Room(
      id: '3',
      title: 'Boys Hostel in Nashik',
      description:
          'A hostel for boys with basic amenities and affordable prices',
      rent: 5000.0,
      imageUrl: 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0e/01/e2/98/neat.jpg?w=700&h=-1&s=1',
      location: 'Nashik, Maharashtra',
      rating: 4.9,
      numReviews: 10,
      isWishlisted: false,
      isBoysHostel: true,
      isGirlsHostel: false,
    ),
    Room(
      id: '4',
      title: 'Girls Hostel in Aurangabad',
      description:
          'A hostel for girls with comfortable rooms and shared facilities',
      rent: 500.0,
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6JniPbv-sUDivTMuKvN0Futv_Py31xv3V1A&usqp=CAU',
      location: 'Aurangabad, Maharashtra',
      rating: 3.5,
      numReviews: 5,
      isWishlisted: false,
      isBoysHostel: false,
      isGirlsHostel: true,
    ),
  ];

  List<Room> get items {
    return [..._items];
  }

  List<Room> get wishlistItem {
    return _items
        .where(
          (prod) => prod.isWishlisted,
        )
        .toList();
  }

  Room findById(String id) {
    return _items.firstWhere((room) => room.id == id);
  }

  Future<List<Room>> search(String query, {RoomFilters filters = const RoomFilters()}) async {
  await Future.delayed(const Duration(seconds: 2)); // simulate network delay
  List<Room> results = [];
  for (var room in _items) {
    if (room.location.toLowerCase().contains(query.toLowerCase())) {
      if (filters.isBoysHostel! && !room.isBoysHostel) {
        continue;
      }
      if (filters.isGirlsHostel! && !room.isGirlsHostel) {
        continue;
      }
      if (filters.location != null && filters.location != room.location) {
        continue;
      }
      if (filters.minRent != null && room.rent < filters.minRent!) {
        continue;
      }
      if (filters.maxRent != null && room.rent > filters.maxRent!) {
        continue;
      }
      results.add(room);
    }
  }
  return results;
}



}
