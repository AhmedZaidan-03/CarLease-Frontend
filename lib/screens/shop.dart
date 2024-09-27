import 'package:carlease_frontend/models/car.dart';
import 'package:carlease_frontend/models/order.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Shop extends StatefulWidget {
  final Car car;
  const Shop({super.key, required this.car});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  int totalDays = 1;

  Future<void> selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        firstDate: DateTime(2024),
        lastDate: DateTime(2025),
        initialDate: DateTime.now());
    if (pickedDate != null) {
      controller.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      calculate();
    }
  }

  void calculate() {
    if (startDateController.text.isNotEmpty &&
        endDateController.text.isNotEmpty) {
      DateTime? startdate = DateTime.tryParse(startDateController.text);
      DateTime? enddate = DateTime.tryParse(endDateController.text);

      if (startdate != null && enddate != null) {
        totalDays = enddate.difference(startdate).inDays;
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hyra bien",
          style: TextStyle(color: Colors.deepPurple),
        ),
        backgroundColor: Colors.white,
      ),
      body: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(hintText: "Name"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter the name please";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: "Email"),
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter the email please";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText: "Start date",
                      suffixIcon: IconButton(
                          onPressed: () =>
                              selectDate(context, startDateController),
                          icon: Icon(Icons.calendar_today))),
                  controller: startDateController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter the start date please";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter the end date please";
                    }
                    return null;
                  },
                  controller: endDateController,
                  decoration: InputDecoration(
                      hintText: "End date",
                      suffixIcon: IconButton(
                          onPressed: () =>
                              selectDate(context, endDateController),
                          icon: Icon(Icons.calendar_today))),
                  readOnly: true,
                ),
                SizedBox(height: 20),
                Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                          colors: [Colors.deepPurple, Colors.blue],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                    ),
                    child: Center(
                        child: Text(
                      "The price is: ${widget.car.price * totalDays} kr",
                      style: TextStyle(color: Colors.white),
                    ))),
                SizedBox(height: 18),
                ElevatedButton(
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      DateTime startdate =
                          DateTime.parse(startDateController.text);
                      DateTime enddate = DateTime.parse(endDateController.text);

                      Order order = Order(
                          nameController.text,
                          emailController.text,
                          widget.car.marke,
                          widget.car.modell,
                          widget.car.price * totalDays,
                          startdate,
                          enddate);
                      bool svar = await order.store_the_order(order);
                      if (svar == true) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text("The order has been successfully confirmed"),
                          backgroundColor: Colors.green,
                        ));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          duration: Duration(seconds: 4),
                          content: Text("Failed with confirmed the order"),
                          backgroundColor: Colors.red,
                        ));
                      }
                    }
                  },
                  child: Text(
                    "Confirm boking",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, minimumSize: Size(130, 50)),
                ),
              ],
            ),
          )),
    );
  }
}
