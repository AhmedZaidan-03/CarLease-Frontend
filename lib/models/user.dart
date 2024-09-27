import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class User {
  String? user_id;
  String name;
  String email;
  String password;
  List<String> favorites = [];

  User({
    this.user_id,
    required this.name,
    required this.email,
    required this.password,
    this.favorites = const [],
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      user_id: json['user_id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      favorites: List<String>.from(json['favorites'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': user_id,
      'name': name,
      'email': email,
      'password': password,
      'favorites': favorites
    };
  }
}

Future<void> SignIn_post(User user) async {
  final http.Response response = await http.post(
    Uri.parse("http://127.0.0.1:4000/signIn"),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(user.toJson()),
  );

  if (response.statusCode == 201) {
    print(response.body);
  } else {
    print("Error: ${response.body}");
  }
}

Future<void> login_post(BuildContext context, User user) async {
  final http.Response response = await http.post(
      Uri.parse("http://127.0.0.1:4000/login"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()));

  if (response.statusCode == 200) {
    print(response.body);
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => home()));
    return;
  }
  print("Error: ${response.body}");
}
