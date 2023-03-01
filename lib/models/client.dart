import 'package:cloud_firestore/cloud_firestore.dart';

class Client {
  String name;
  String phone;
  final Timestamp timestamp;

  Client({
    required this.phone,
    required this.name,
    required this.timestamp,
  });
}
