import 'package:cloud_firestore/cloud_firestore.dart';

class Desert {
  final String id;
  final String imageUrl;
  final String name;
  final String price;
  final Timestamp timestamp;
  final String category;

  Desert({required this.imageUrl, required this.id, required this.price, required this.name, required this.timestamp, required this.category});
}