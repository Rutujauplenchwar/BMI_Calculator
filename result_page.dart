import 'package:bmi/reusable_card.dart';
import 'package:flutter/material.dart';
import 'costant.dart';
import 'bottombutton.dart';

class ResultPage extends StatelessWidget {

  ResultPage({required this.resultBmi, required this.Mess1,required this.Mess2});
  final String resultBmi;
  final String Mess1;
  final String Mess2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMICalculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: kYourResultTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              col: kActiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    Mess1,
                    style: kMessageTextStyle,
                  ),
                  Text(
                    resultBmi,
                    style: knumberTextStyle,
                  ),
                  Text(
                    Mess2,
                    textAlign: TextAlign.center,
                    style: kNoteTextStyle,
                  ),
                ],
              ),
            ),
          ),
          Button(
            bottomTitle: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
