import 'dart:convert';

import 'package:http/http.dart' as http;

class Order {
  String name;
  String email;
  String marke;
  String modell;
  int price;
  DateTime start_date;
  DateTime end_date;

  Order(this.name, this.email, this.marke, this.modell, this.price,
      this.start_date, this.end_date);
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'marke': marke,
      'modell': modell,
      'price': price,
      'start_date': start_date.toIso8601String(),
      'end_date': end_date.toIso8601String()
    };
  }

  Future<bool> store_the_order(Order order) async {
    bool svar = await store_order(order);
    return svar;
  }
}

Future<bool> store_order(Order order) async {
  final http.Response response = await http.post(
      Uri.parse("http://127.0.0.1:4000/storeOrder"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(order.toJson()));
  if (response.statusCode == 200) {
    return true;
  }
  return false;
}
