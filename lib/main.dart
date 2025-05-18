import 'package:flutter/material.dart';
import 'package:flutter_car_installment_calculation/views/inupt_screen_ui.dart';
import 'package:flutter_car_installment_calculation/views/result_screen_ui.dart';
import 'package:flutter_car_installment_calculation/views/splash_screen_ui.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    Fluttercarinstallmentcalculation(),
  );
}

class Fluttercarinstallmentcalculation extends StatefulWidget {
  const Fluttercarinstallmentcalculation({super.key});

  @override
  State<Fluttercarinstallmentcalculation> createState() =>
      _FluttercarinstallmentcalculationState();
}

class _FluttercarinstallmentcalculationState
    extends State<Fluttercarinstallmentcalculation> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenUi(),
      theme: ThemeData(
        textTheme: GoogleFonts.kanitTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
    );
  }
}
