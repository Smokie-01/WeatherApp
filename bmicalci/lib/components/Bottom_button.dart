import 'package:flutter/material.dart';

import '../constants/constants.dart';

class BottomButton extends StatelessWidget {
  VoidCallback onPress;
  final String buttonTitle;
  BottomButton({required this.onPress, required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Center(
            child: Text(
          buttonTitle,
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        )),
        color: bottomContainerColor,
        height: 65,
        width: double.infinity,
      ),
    );
  }
}
