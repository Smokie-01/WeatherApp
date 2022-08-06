import 'package:bmicalci/constants/constants.dart';

import 'package:bmicalci/components/reusable_card.dart';

import 'package:flutter/material.dart';
import '../components/Bottom_button.dart';

class ResultPage extends StatelessWidget {
  final String bmiResults;
  final String resultTxt;
  final String advice;

  ResultPage(
      {required this.bmiResults,
      required this.resultTxt,
      required this.advice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bottomContainerColor,
        title: Text('BMI CALCULATOR',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Container(
          padding: EdgeInsets.all(10),
          child: Text(
            "Yor Result ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 50,
            ),
          ),
        ),
        Expanded(
          child: ReusableCard(
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  resultTxt,
                  style: kResultxtStyl,
                ),
                Text(
                  bmiResults,
                  style: kNumbertxtStyl,
                ),
                Text(
                  advice,
                  textAlign: TextAlign.center,
                  style: kSuggestionTxTstyl,
                ),
              ],
            ),
            colour: Colors.green.shade200,
          ),
        ),
        BottomButton(
            onPress: () {
              Navigator.pop(context);
            },
            buttonTitle: 'Re-Calculate ')
      ]),
    );
  }
}
