import 'package:carlease_frontend/main.dart';
import 'package:carlease_frontend/models/user.dart';
import 'package:carlease_frontend/screens/loginScreen.dart';
import 'package:flutter/material.dart';

class Signinscreen extends StatefulWidget {
  const Signinscreen({super.key});

  @override
  State<Signinscreen> createState() => _SigninscreenState();
}

class _SigninscreenState extends State<Signinscreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned.fill(
            child: Image.asset(
          "images/9.jpg",
          fit: BoxFit.fill,
        )),
        Positioned(
            top: 29,
            left: 10,
            right: 20,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.yellow,
                      size: 29,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    width: 140,
                  ),
                  Text("Sign In", style: putColor(Colors.white, 26)),
                ],
              ),
              height: 36,
              width: 200,
            )),
        Positioned(
            top: 100,
            left: 10,
            right: 10,
            child: Container(
              height: 600,
              width: 420,
              decoration: BoxDecoration(
                  color: Color(0x705600C4),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 5, right: 15),
                    child: TextField(
                      controller: nameController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          hintText: "Name",
                          hintStyle: putColor(Colors.white70, 19),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 5, right: 15),
                    child: TextField(
                      controller: emailController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          hintText: "Email",
                          hintStyle: putColor(Colors.white70, 19),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 5, right: 15),
                    child: TextField(
                      obscureText: true,
                      obscuringCharacter: "*",
                      controller: passwordController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: putColor(Colors.white70, 19),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey))),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      User user = User(
                        name: nameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                      );

                      await SignIn_post(user);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Loginscreen()));
                    },
                    child: Text(
                      "Sign in",
                      style: putColor(Colors.black, 18),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow.shade400),
                  )
                ],
              ),
            )),
      ],
    ));
  }
}
