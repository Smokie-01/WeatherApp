import 'package:bmicalci/constants/constants.dart';
import 'package:flutter/material.dart';
import '../constants/constants.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPress;

  RoundIconButton({required this.icon, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        icon,
        color: Colors.white,
        size: 30,
      ),
      elevation: 6.0,
      constraints: BoxConstraints(
        minHeight: 56,
        minWidth: 56,
      ),
      onPressed: onPress,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      fillColor: kFloatButtonColor,
    );
  }
}
