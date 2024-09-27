import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Car extends ChangeNotifier {
  String marke;
  String modell;
  String car_id;
  int year_modell;
  String drivmedel;
  int price;
  int hastkraft;
  String kaross;
  bool available;
  bool isLiked;
  List<String> pic;

  List<Car> lst = [];

  Car({
    required this.marke,
    required this.modell,
    required this.car_id,
    required this.year_modell,
    required this.drivmedel,
    required this.price,
    required this.hastkraft,
    required this.kaross,
    required this.available,
    required this.isLiked,
    required this.pic,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
        marke: json['märke'],
        modell: json['modell'],
        car_id: json['car_id'],
        year_modell: json['year_modell'],
        drivmedel: json['drivmedel'],
        price: json['price'],
        hastkraft: json['hästkraft'],
        kaross: json['kaross'],
        available: json['available'],
        isLiked: json['isLiked'],
        pic: List<String>.from(json['picture'] ?? []));
  }

  Future<void> getCars() async {
    final cars = await get_Cars();
    lst = cars;
    notifyListeners();
  }
}

Future<List<Car>> get_Cars() async {
  final http.Response response =
      await http.get(Uri.parse("http://127.0.0.1:4000/getCars"));
  List<dynamic> toList = jsonDecode(response.body);
  return toList.map((item) => Car.fromJson(item)).toList();
}
