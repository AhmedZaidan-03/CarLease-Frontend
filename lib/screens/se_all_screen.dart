import 'package:carlease_frontend/models/car.dart';
import 'package:carlease_frontend/screens/car_brands.dart';
import 'package:flutter/material.dart';

class SeAllScreen extends StatefulWidget {
  final Car provider;
  const SeAllScreen({super.key, required this.provider});

  @override
  State<SeAllScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SeAllScreen> {
  String search = "";
  @override
  Widget build(BuildContext context) {
    final Car provider = widget.provider;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        title: Text(
          "All Cars",
          style:
              TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.w900),
        ),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(55),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    search = value;
                  });
                },
                decoration: InputDecoration(
                    hintText: "Search by the name or modell",
                    hintStyle: TextStyle(color: Colors.deepPurple),
                    labelStyle: TextStyle(color: Colors.deepPurple),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12))),
              ),
            )),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 200,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20),
          padding: EdgeInsets.all(10),
          itemCount: provider.lst.where((car) {
            return car.marke.toLowerCase().contains(search.toLowerCase()) ||
                car.modell.toLowerCase().contains(search.toLowerCase());
          }).length,
          itemBuilder: (context, index) {
            final item = provider.lst.where((car) {
              return car.marke.toLowerCase().contains(search.toLowerCase()) ||
                  car.modell.toLowerCase().contains(search.toLowerCase());
            }).toList()[index];
            return show_cars_vert(item: item);
          }),
    );
  }
}
