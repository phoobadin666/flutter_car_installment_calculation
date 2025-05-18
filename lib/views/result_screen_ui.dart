import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ResultScreenUi extends StatefulWidget {
  double? carPrice;
  double? parPerMonth;
  int? month;

  ResultScreenUi({super.key, this.carPrice, this.parPerMonth, this.month});

  @override
  State<ResultScreenUi> createState() => _ResultScreenUiState();
}

class _ResultScreenUiState extends State<ResultScreenUi> {
  @override
  Widget build(BuildContext context) {
    NumberFormat fm = NumberFormat(
      "#,###,##0.00",
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'CI Calculator',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(text: 'ผ่อนทั้งหมด '),
                  TextSpan(
                    text: '${widget.month}',
                    style: TextStyle(color: Colors.red),
                  ),
                  TextSpan(text: ' เดือน'),
                ],
              ),
            ),
            Text('ค่างาดรถต่อเดือน'),
            Text(
              '${fm.format(widget.parPerMonth)} ',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            Text(
              'บาท',
            ),
          ],
        ),
      ),
    );
  }
}
