import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  double _imc = 0.0;

  double _calculateIMC() {
    double weight = double.parse(_weightController.text);
    double height = double.parse(_heightController.text) / 100;
    double imc = weight / (height * height);
    setState(() {
      _imc = imc;
    });
    return _imc;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Calcule seu IMC",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'poppins',
            ),
          ),
          backgroundColor: Colors.pink,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _weightController,
                  decoration: const InputDecoration(
                    labelText: 'Peso',
                    labelStyle: TextStyle(fontSize: 24),
                  ),
                  keyboardType: TextInputType.number,
                ),
                TextFormField(
                  controller: _heightController,
                  decoration: const InputDecoration(
                    labelText: 'Altura',
                    labelStyle: TextStyle(fontSize: 24),
                  ),
                  keyboardType: TextInputType.number,
                ),
                Divider(
                  color: Colors.white,
                  height: 40,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    shadowColor: Colors.pink,
                  ),
                  onPressed: _calculateIMC,
                  child: const Text(
                    'Calcular',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Seu IMC é: $_imc',
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
