import 'package:flutter/material.dart';
import 'dart:math';

class BmiPage extends StatefulWidget {
  @override
  _BmiPageState createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {

  String _resultText = "";
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _heightController.dispose();
    _weightController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI 계산기"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Text('신체 정보', style: TextStyle(color: Colors.red, fontSize: 30, fontStyle: FontStyle.italic),),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: '신장(cm)을 입력하세요'),
              controller: _heightController,),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: '몸무게(kg)를 입력하세요'),
              controller: _weightController,),
            Container(
              alignment: Alignment.centerRight,
              child: RaisedButton(
                onPressed: () {
                  String heightText = _heightController.text;
                  String weightText = _weightController.text;

                  if(heightText.trim() != '' && weightText.trim() != '') {
                    double height = double.parse(heightText);
                    double weight = double.parse(weightText);
                    _calcBmi(height, weight);
                  }
                  _heightController.clear();
                  _weightController.clear();
                },
                child: Text('결과확인'),
                color: Colors.green,
                textColor: Colors.white,),
            ),
            Padding(padding: EdgeInsets.all(16)),
            Text('$_resultText', style: Theme.of(context).textTheme.title,),
          ],
        ),
      ),
    );
  }

  void _calcBmi(double height, double weight) {
    final bmi = weight / pow(height / 100.0, 2.0);
    setState(() {
      _resultText = "BMI 지수는 ${bmi.toStringAsFixed(1)} 입니다.";
    });
  }
}
