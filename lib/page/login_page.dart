import 'dart:html';

import 'package:flutter/material.dart';
import 'package:tugas_pbm_pertemuan_6/page/home_page.dart';
import 'package:tugas_pbm_pertemuan_6/page/register_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController emailValue = TextEditingController();
  TextEditingController passwordValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? data =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    var username = data?['username'];
    var email = data?['email'];
    var password = data?['password'];

    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Login'),
        //   backgroundColor: Color(0xFF003C41),
        // ),
        body: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(8),
            color: Color(0xFFFFFFFF),
            child: Column(
              children: <Widget>[
                Image.asset('../assets/bmi.jpg', width: 200, height: 200),
                Text(
                  "Welcome $username!",
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF003C41),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: emailValue,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black87)),
                      prefixIcon: Icon(
                        Icons.email_rounded,
                        size: 30,
                      ),
                      hintText: "Enter your email",
                      hintStyle: TextStyle(color: Colors.black87),
                      labelText: "Email",
                      labelStyle: TextStyle(color: Colors.black87)),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: true,
                  controller: passwordValue,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black87)),
                      prefixIcon: Icon(
                        Icons.lock,
                        size: 30,
                      ),
                      hintText: "Enter your password",
                      hintStyle: TextStyle(color: Colors.black87),
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.black87)),
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                  color: Color(0xFFFFBA24),
                  elevation: 5,
                  child: Container(
                    height: 50,
                    child: InkWell(
                      splashColor: Colors.white,
                      onTap: () {
                        if (emailValue.text != email ||
                            passwordValue.text != password) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text(
                                      'Your email address or password incorectly'),
                                );
                              });
                        } else {
                          final Map<String, dynamic> data = {
                            'username': username,
                          };
                          Navigator.pushNamed(context, '/home',
                              arguments: data);
                        }
                      },
                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF003C41),
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            )));
  }
}
