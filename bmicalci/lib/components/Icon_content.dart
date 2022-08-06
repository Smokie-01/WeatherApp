import 'package:bmicalci/constants/constants.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class IconContent extends StatelessWidget {
  final String gender;
  final IconData iconData;
  IconContent({required this.gender, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 80,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          gender,
          style: genderTXTstyle,
        ),
      ],
    );
  }
}
