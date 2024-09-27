import 'package:carlease_frontend/models/car.dart';
import 'package:carlease_frontend/screens/home_screen.dart';
import 'package:carlease_frontend/screens/loginScreen.dart';
import 'package:carlease_frontend/screens/signinScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  Car car = Car(
      marke: "Toyota",
      modell: "Corolla",
      car_id: "001",
      year_modell: 2020,
      drivmedel: "Bensin",
      price: 150000,
      hastkraft: 120,
      kaross: "Sedan",
      available: true,
      isLiked: false,
      pic: [
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5Cg6yK-dL78uo4KTKqEBzS-5oom3Ot2--3w&s',
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5Cg6yK-dL78uo4KTKqEBzS-5oom3Ot2--3w&s'
      ]); // Använd riktiga bild-URL:er här

  runApp(ChangeNotifierProvider(create: (context) => car, child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

TextStyle putColor(Color setColor, double fontsize) {
  return TextStyle(color: setColor, fontSize: fontsize);
}

class firstScreen extends StatelessWidget {
  const firstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Car rent",
            style: TextStyle(color: Colors.deepPurple),
          ),
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Loginscreen()));
                  },
                  child: Text("Log in ")),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Signinscreen()));
                  },
                  child: Text("Sign in")),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Loginscreen()));
                  },
                  child: Text("Guest")),
            ],
          ),
        ));
  }
}
