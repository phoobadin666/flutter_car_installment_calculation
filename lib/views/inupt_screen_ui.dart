import 'package:flutter/material.dart';

class InuptScreenUi extends StatefulWidget {
  const InuptScreenUi({super.key});

  @override
  State<InuptScreenUi> createState() => _InuptScreenUiState();
}

class _InuptScreenUiState extends State<InuptScreenUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'CI Calculation',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
