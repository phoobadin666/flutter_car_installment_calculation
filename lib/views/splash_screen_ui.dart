import 'package:flutter/material.dart';
import 'package:flutter_car_installment_calculation/views/inupt_screen_ui.dart';

class SplashScreenUi extends StatefulWidget {
  const SplashScreenUi({super.key});

  @override
  State<SplashScreenUi> createState() => _SplashScreenUiState();
}

class _SplashScreenUiState extends State<SplashScreenUi> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => InputScreenUi(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/img01.png",
              width: 200,
            ),
            SizedBox(height: 20),
            Text(
              'Car installment ',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.lightGreenAccent,
              ),
            ),
            Text(
              'calculation',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.lightGreenAccent,
              ),
            ),
            SizedBox(height: 30),
            CircularProgressIndicator(
              color: Colors.white,
            ),
            SizedBox(height: 30),
            Text(
              'created by: DTI-SAU',
              style: TextStyle(
                fontSize: 17,
                color: Colors.lightGreenAccent,
              ),
            ),
            Text(
              'Version 1.0',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.lightGreenAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
