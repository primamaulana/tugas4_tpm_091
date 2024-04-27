import 'package:flutter/material.dart';
import 'dart:math';

class Segitiga extends StatefulWidget {
  @override
  State<Segitiga> createState() => _SegitigaState();
}

class _SegitigaState extends State<Segitiga> {
  late TextEditingController _alas;
  late TextEditingController _tinggi;
  late TextEditingController _side1;
  late TextEditingController _side2;
  late TextEditingController _side3;
  String result = '';

  void _getPrimes() {
    setState(() {
      // error handling for non-numeric inputs
      if (!_isNumeric(_tinggi.text) ||
          !_isNumeric(_alas.text) ||
          !_isNumeric(_side1.text) ||
          !_isNumeric(_side2.text) ||
          !_isNumeric(_side3.text)) {
        // handle non-numeric input error
        result = 'Please enter numeric values';
        return; // exit the function to prevent further execution
      }

      // get range from the user input
      double alas = double.tryParse(_alas.text) ?? 0;
      double tinggi = double.tryParse(_tinggi.text) ?? 0;
      double side1 = double.tryParse(_side1.text) ?? 0;
      double side2 = double.tryParse(_side2.text) ?? 0;
      double side3 = double.tryParse(_side3.text) ?? 0;

      // Menghitung luas segitiga
      double area = 0.5 * alas * tinggi;

      // Menghitung keliling segitiga
      double perimeter = side1 + side2 + side3;

      // Menyimpan hasil perhitungan
      result = 'Luas: $area, Keliling: $perimeter';
    });
  }

  bool _isNumeric(String str) {
    if (str == null) {
      return false;
    }
    return double.tryParse(str) != null;
  }

  @override
  void initState() {
    _alas = TextEditingController();
    _tinggi = TextEditingController();
    _side1 = TextEditingController();
    _side2 = TextEditingController();
    _side3 = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _alas.dispose();
    _tinggi.dispose();
    _side1.dispose();
    _side2.dispose();
    _side3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: width / 4,
                  child: TextField(
                    controller: _alas,
                    decoration: const InputDecoration(hintText: 'Alas'),
                    style: const TextStyle(fontSize: 21, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: width / 4,
                  child: TextField(
                    controller: _tinggi,
                    decoration: const InputDecoration(hintText: 'Tinggi'),
                    style: const TextStyle(fontSize: 21, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: width / 4,
                  child: TextField(
                    controller: _side1,
                    decoration: const InputDecoration(hintText: 'Sisi Pertama'),
                    style: const TextStyle(fontSize: 21, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: width / 4,
                  child: TextField(
                    controller: _side2,
                    decoration: const InputDecoration(hintText: 'Sisi Kedua'),
                    style: const TextStyle(fontSize: 21, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: width / 4,
                  child: TextField(
                    controller: _side3,
                    decoration: const InputDecoration(hintText: 'Sisi Ketiga'),
                    style: const TextStyle(fontSize: 21, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Center(
              child: SizedBox(
                width: width / 2,
                child: SelectionArea(
                  child: Text(
                    result,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getPrimes,
        tooltip: 'Get!',
        child: const Icon(Icons.filter_alt_sharp),
      ),
    );
  }
}

