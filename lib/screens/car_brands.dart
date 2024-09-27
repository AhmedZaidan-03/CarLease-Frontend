import 'package:carlease_frontend/models/car.dart';
import 'package:carlease_frontend/screens/car_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarBrands extends StatelessWidget {
  final String name;
  const CarBrands({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Car>(context);
    List<Car> filteredList =
        provider.lst.where((item) => item.marke == name).toList();

    return Scaffold(
        appBar: AppBar(
          title:
              Text(name, style: TextStyle(color: Colors.black, fontSize: 17)),
          backgroundColor: Colors.deepPurple,
        ),
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisExtent: 200, // höjd på varje cell
                mainAxisSpacing: 20 // avstånd mellan raderna
                ),
            padding: EdgeInsets.all(10),
            itemCount: filteredList.length,
            itemBuilder: (contex, index) {
              final item = filteredList[index];
              return show_cars_vert(item: item);
            }));
  }
}

class show_cars_vert extends StatelessWidget {
  const show_cars_vert({
    super.key,
    required this.item,
  });

  final Car item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CarDetails(car: item)));
      },
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Image.network(
                  item.pic[0],
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.marke,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 17),
                  ),
                  SizedBox(
                    width: 17,
                  ),
                  Text(
                    item.modell,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 17),
                  )
                ],
              ),
              Text(
                item.price.toString() + " kr",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade600,
                    fontSize: 17),
              )
            ],
          ),
        ),
      ),
    );
  }
}
