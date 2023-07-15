import 'package:cloud_firestore/cloud_firestore.dart';

class Usermodel {
  final String? id;
  final String name;
  final String phone;

  const Usermodel({
    this.id,
    required this.name,
    required this.phone,
  });

  tojson() {
    return {
      "ID": id,
      "Name": name,
      "Phone": phone,
    };
  }

  factory Usermodel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> documentsnapshot) {
    final data = documentsnapshot.data()!;
    return Usermodel(
        id: documentsnapshot.id, name: data["Name"], phone: data["Phone"]);
  }
}
