import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  String name;
  String phoneNumber;
  User({
    required this.name,
    required this.phoneNumber,
  });

  factory User.fromjson(Map<String, dynamic> map) {
    return User(
      name: map["name"],
      phoneNumber: map["phoneNumber"],

      // color: map["color"],
    );
  }
  tojson() => {
        "name": name,
        "phoneNumber": phoneNumber
        // "color": color,
      };
}
