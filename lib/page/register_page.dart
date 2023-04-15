import 'package:flutter/material.dart';
import 'package:tugas_pbm_pertemuan_6/page/login_page.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Register'),
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
                  "Create Account",
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF003C41),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: username,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black87)),
                      prefixIcon: Icon(
                        Icons.person,
                        size: 30,
                      ),
                      hintText: "Enter your username",
                      hintStyle: TextStyle(color: Colors.black87),
                      labelText: "Username",
                      labelStyle: TextStyle(color: Colors.black87)),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: email,
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
                  controller: password,
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
                  color: Color.fromARGB(255, 255, 186, 36),
                  elevation: 5,
                  child: Container(
                    height: 50,
                    child: InkWell(
                      splashColor: Colors.white,
                      onTap: () {
                        if (email.text == '' ||
                            username.text == '' ||
                            password.text == '') {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text(
                                      'Please fill in all fields completely!'),
                                );
                              });
                        } else {
                          final Map<String, dynamic> data = {
                            'username': username.text,
                            'email': email.text,
                            'password': password.text
                          };
                          Navigator.pushNamed(context, '/login',
                              arguments: data);
                        }
                      },
                      child: Center(
                        child: Text(
                          "Sign Up",
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
