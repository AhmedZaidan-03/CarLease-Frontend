import 'package:carlease_frontend/models/car.dart';
import 'package:carlease_frontend/screens/shop.dart';
import 'package:flutter/material.dart';

class CarDetails extends StatelessWidget {
  final Car car;
  const CarDetails({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Car Details",
          style: TextStyle(
              fontSize: 17,
              color: Colors.deepPurple,
              fontWeight: FontWeight.w900),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Justerar innehållet till vänster
        children: [
          SizedBox(
            height: 10,
          ),
          // Bilddelen
          SizedBox(
            height: 280,
            child: PageView.builder(
              itemCount: car.pic.length,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    car.pic[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                );
              },
            ),
          ),
          // Bilinformation
          Padding(
            padding:
                const EdgeInsets.all(16.0), // Skapar mellanrum runt all text
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Justerar all text till vänster
              children: [
                // Märke och modell
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      car.marke + ' ' + car.modell,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                // Pris
                Text(
                  '${car.price} kr',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade700,
                  ),
                ),
                SizedBox(height: 16),
                // Information i rader
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildInfoItem("Year", car.year_modell.toString(),
                        Icons.calendar_today),
                    _buildInfoItem("Power", "${car.hastkraft} hp", Icons.speed),
                    _buildInfoItem(
                        "Fuel", car.drivmedel, Icons.local_gas_station),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildInfoItem("Body", car.kaross, Icons.directions_car),
                    _buildInfoItem("Available", car.available ? "Yes" : "No",
                        Icons.check_circle),
                  ],
                ),
                SizedBox(height: 50),
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Shop(car: car)));
                      },
                      child: Text(
                        "Hyr bilen",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w900),
                      ),
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(300, 50),
                          backgroundColor: Colors.black87)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String label, String value, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue.shade800, size: 20),
        SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
