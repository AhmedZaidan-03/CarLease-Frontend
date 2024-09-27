import 'package:carlease_frontend/main.dart';
import 'package:carlease_frontend/models/user.dart';
import 'package:carlease_frontend/screens/home_screen.dart';
import 'package:carlease_frontend/screens/signinScreen.dart';
import 'package:flutter/material.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _loginPageState();
}

class _loginPageState extends State<Loginscreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned.fill(
          child: Image.asset(
            "images/2.jpeg",
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
            top: 10,
            left: 20,
            right: 20,
            // right: 40,
            child: Container(
                height: 35,
                width: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                        colors: [Colors.grey.shade800, Colors.black],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight)),
                child: Center(
                    child: Text("Login Page",
                        style: putColor(Colors.grey.shade300, 23))))),
        Positioned(
            top: 230,
            left: 35,
            right: 35,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10))),
              height: 34,
            )),
        Positioned(
            top: 260,
            left: 35,
            right: 35,
            child: Container(
              height: 324,
              decoration: BoxDecoration(
                  color: Color(0xFF030824),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 10, left: 17, right: 17),
                      child: TextField(
                        controller: emailController,
                        style: putColor(Colors.white70, 20),
                        decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: putColor(Colors.grey, 20),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.white,
                            ))),
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 17, right: 17),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      obscuringCharacter: "*",
                      style: putColor(Colors.white70, 20),
                      decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: putColor(Colors.grey, 20),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey))),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 90),
                    child: ElevatedButton(
                      onPressed: () async {
                        User user = User(
                            name: "",
                            email: emailController.text,
                            password: passwordController.text);
                        await login_post(context, user);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                      },
                      child: Text("Login", style: putColor(Colors.white, 16)),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0x5C3318D8),
                          minimumSize: Size(160, 30)),
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Dont have an account ? ",
                        style: putColor(Colors.white, 15),
                      ),
                      GestureDetector(
                        child: Text(
                          "Sign in",
                          style: putColor(Colors.white, 15).copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Signinscreen()));
                        },
                      )
                    ],
                  )
                ],
              ),
            )),
      ]),
    );
  }
}
