import 'package:cloud_firestore/cloud_firestore.dart';

class Desert {
  final String imageUrl;
  final String id;
  final String price;
  final String description;
  final Timestamp timestamp;

  Desert({required this.imageUrl, required this.id, required this.price, required this.description, required this.timestamp});

}