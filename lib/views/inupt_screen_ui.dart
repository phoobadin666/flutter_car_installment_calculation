import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_car_installment_calculation/views/result_screen_ui.dart';
import 'package:image_picker/image_picker.dart';

class InputScreenUi extends StatefulWidget {
  const InputScreenUi({super.key});

  @override
  State<InputScreenUi> createState() => _InputScreenUiState();
}

class _InputScreenUiState extends State<InputScreenUi> {
  // สร้างตัวแปรควบคุม TextField
  TextEditingController _carPriceCtrl = TextEditingController();
  TextEditingController _interestCtrl = TextEditingController();

  int _dowmctrl = 10;

  int _monthCtrl = 24;
  // สร้างตัวแปรเก็บรูปที่เลทอกจากกล้องหรือแกลอรี่
  File? _imageFile;

  _waringDialog(msg) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('คำเตือน'),
        content: Text(msg),
        actions: [
          OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'ตกลง',
            ),
          ),
        ],
      ),
    );
  }

  // สร้างเมธอลเปิดกล้อง
  _openCamera() async {
    final pickerImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (pickerImage == null) return;

    setState(() {
      _imageFile = File(pickerImage.path);
    });
  }

  // สร้างเมธอลเปิดแกลอรี่
  _openGallery() async {
    final pickerImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickerImage == null) return;

    setState(() {
      _imageFile = File(pickerImage.path);
    });
  }

  @override
  Widget build(BuildContext context) {
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 40,
            right: 40,
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'คำนวณค่างวดรถ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.green,
                      width: 2,
                    ),
                  ),
                  child: InkWell(
                    onTap: () {
                      // เราจะเปิด snack bar ให้ผู้ใช้เลือกกล้อง และแกลอรี่
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.green,
                          content: Column(
                            children: [
                              ListTile(
                                onTap: () {},
                                title: Text('เปิดกล้อง'),
                                leading: Icon(
                                  Icons.camera,
                                  color: Colors.amber,
                                ),
                              ),
                              ListTile(
                                onTap: () {},
                                title: Text('เปิดแกลอรี่'),
                                leading: Icon(
                                  Icons.image,
                                  color: Colors.amber,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: _imageFile == null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/images/img02.png',
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              _imageFile!,
                              height: 100,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ราคารถ (บาท)',
                  ),
                ),
                TextField(
                  controller: _carPriceCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '0.00',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'จำนวนเงินดาวน์ (%)',
                  ),
                ),
                Row(
                  children: [
                    Radio(
                      onChanged: (value) {
                        setState(() {
                          _dowmctrl = value!;
                        });
                      },
                      value: 10,
                      groupValue: _dowmctrl,
                    ),
                    Text('10'),
                    Radio(
                      onChanged: (value) {
                        setState(() {
                          _dowmctrl = value!;
                        });
                      },
                      value: 20,
                      groupValue: _dowmctrl,
                    ),
                    Text('20'),
                    Radio(
                      onChanged: (value) {
                        setState(() {
                          _dowmctrl = value!;
                        });
                      },
                      value: 30,
                      groupValue: _dowmctrl,
                    ),
                    Text('30'),
                    Radio(
                      onChanged: (value) {
                        setState(() {
                          _dowmctrl = value!;
                        });
                      },
                      value: 40,
                      groupValue: _dowmctrl,
                    ),
                    Text('40'),
                    Radio(
                      onChanged: (value) {
                        setState(() {
                          _dowmctrl = value!;
                        });
                      },
                      value: 50,
                      groupValue: _dowmctrl,
                    ),
                    Text('50'),
                    Radio(
                      onChanged: (value) {
                        setState(() {
                          _dowmctrl = value!;
                        });
                      },
                      value: 60,
                      groupValue: _dowmctrl,
                    ),
                    Text('60')
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'จำนวนเงินดาวน์ (%)',
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                    ),
                    child: DropdownButton<int>(
                      value: _monthCtrl,
                      isExpanded: true,
                      underline: Container(),
                      onChanged: (int? value) {
                        setState(() {
                          _monthCtrl = value!;
                        });
                      },
                      items: <int>[
                        24,
                        36,
                        48,
                        60,
                        72,
                      ].map<DropdownMenuItem<int>>((int value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text(
                            '$value เดือน',
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'อัตราดอกเบี้ย (ปี)',
                  ),
                ),
                TextField(
                  controller: _interestCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '0.00',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_carPriceCtrl.text.isEmpty) {
                      _waringDialog('กรุณากรอกราคารถ');
                    } else if (_interestCtrl.text.isEmpty) {
                      _waringDialog('กรุณากรอกอัตราดอกเบี้ย');
                    } else {
                      double carPrice = double.parse(_carPriceCtrl.text);
                      double interest = double.parse(_interestCtrl.text);

                      double balance =
                          carPrice - (carPrice * _dowmctrl / 100.0);

                      double totalInterest =
                          (balance * interest / 100 / 12) * _monthCtrl;

                      double payPerMonth =
                          (balance + totalInterest) / _monthCtrl;

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultScreenUi(
                            carPrice: carPrice,
                            parPerMonth: payPerMonth,
                            month: _monthCtrl,
                          ),
                        ),
                      );
                    }
                  },
                  child: Text(
                    'คำนวณ',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    minimumSize: Size(
                      double.infinity,
                      55,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _carPriceCtrl.text = '';
                      _dowmctrl = 10;
                      _monthCtrl = 24;
                      _interestCtrl.text = '';
                    });
                  },
                  child: Text(
                    'ยกเลิก',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    minimumSize: Size(
                      double.infinity,
                      55,
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
      ),
    );
  }
}
