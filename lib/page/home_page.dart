import 'package:flutter/material.dart';

// final String username = "";

class HomePage extends StatefulWidget {
  // var username;
  const HomePage({super.key});
  // const HomePage({this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  dynamic hasil = '';
  dynamic result = '';
  TextEditingController _beratController = TextEditingController();
  TextEditingController _tinggiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? data =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    var username = data?['username'];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('BMI Calculator'),
        //   backgroundColor: Color(0xFF003C41),
        // ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(8),
          color: Color(0xFFFFFFFF),
          child: Column(
            children: <Widget>[
              // Text(
              //   "BMI Calculator",
              //   style: TextStyle(
              //       fontSize: 20,
              //       color: Color(0xFF003C41),
              //       fontWeight: FontWeight.bold),
              // ),
              SizedBox(
                height: 20,
              ),
              Image.asset('../assets/bmi.jpg', width: 200, height: 200),
              Text(
                "Hello $username!",
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF003C41),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Let's calculate your BMI",
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF003C41),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                '$hasil',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF003C41),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '${result}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF003C41),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: _tinggiController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black87)),

                    // ),
                    hintText: "Enter your body height (cm)",
                    hintStyle: TextStyle(color: Colors.black87),
                    labelText: "Height",
                    labelStyle: TextStyle(color: Colors.black87)),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _beratController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black87)),
                    hintText: "Enter your body weight (kg)",
                    hintStyle: TextStyle(color: Colors.black87),
                    labelText: "Weight",
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
                      setState(() {
                        double berat = double.parse(_beratController.text);
                        double tinggi =
                            double.parse(_tinggiController.text) / 100;
                        double bmi = berat / (tinggi * tinggi);

                        if (bmi < 18.5) {
                          result = 'Underweight';
                          hasil = bmi.toStringAsFixed(1);
                        } else if (bmi >= 18.5 && bmi < 24.9) {
                          result = 'Healthy Weight';
                          hasil = bmi.toStringAsFixed(1);
                        } else if (bmi >= 25.0 && bmi < 29.9) {
                          result = 'Over Weight';
                          hasil = bmi.toStringAsFixed(1);
                        } else {
                          result = 'Obesity';
                          hasil = bmi.toStringAsFixed(1);
                        }
                      });
                    },
                    child: Center(
                      child: Text(
                        "Calculate",
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
          ),
        ),
      ),
    );
  }
}
