import 'package:flutter/material.dart';
import 'dart:math';

class PrimaPage extends StatefulWidget {
  @override
  _PrimaPageState createState() => _PrimaPageState();
}

class _PrimaPageState extends State<PrimaPage> {
  late TextEditingController _rangeStartTextController;
  late TextEditingController _rangeEndTextController;
  String result = '';

  void _getPrimes() {
    setState(() {
      // error handling for non-numeric inputs
      if (!_isNumeric(_rangeStartTextController.text) ||
          !_isNumeric(_rangeEndTextController.text)) {
        // handle non-numeric input error
        result = 'Please enter numeric values for Start and End';
        return; // exit the function to prevent further execution
      }

      // get range from the user input
      int rangeStart = int.tryParse(_rangeStartTextController.text) ?? 0;
      int rangeEnd = int.tryParse(_rangeEndTextController.text) ?? 0;

      // error handling if end is less than start
      if (rangeEnd < rangeStart) {
        // display an error message or handle the situation accordingly
        result = 'End must be greater than or equal to Start';
        return; // exit the function to prevent further execution
      }

      // generate numbers using the given range
      List<int> numbers = List<int>.generate(
        rangeEnd - rangeStart + 1,
            (index) => index + rangeStart,
      );

      // filter out primes into a list
      List<int> primes = numbers.where((number) => isPrime(number)).toList();

      // finally, store the result in the string to be shown
      result = primes.join(', ');
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
    _rangeStartTextController = TextEditingController();
    _rangeEndTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _rangeStartTextController.dispose();
    _rangeEndTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
      ),
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
                    controller: _rangeStartTextController,
                    decoration: const InputDecoration(hintText: 'Start'),
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
                    controller: _rangeEndTextController,
                    decoration: const InputDecoration(hintText: 'End'),
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

bool isPrime(int n) {
  if (n <= 1) {
    return false;
  }

  for (int i = 2; i <= pow(n, 1 / 2).toInt(); i++) {
    if (n % i == 0) {
      return false;
    }
  }

  return true;
}