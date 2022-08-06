import 'dart:math';

class CalulatoBrain {
  CalulatoBrain({
    required this.height,
    required this.weight,
  });
  int height;
  int weight;
  double _bmi = 0;

  String calculationBMi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi > 30) {
      return 'OBESITY !';
    } else if (_bmi >= 25) {
      return 'OVER WEIGHT ';
    } else if (_bmi >= 18.5) {
      return 'NORMAL';
    } else {
      return " UNDER-WEIGHT ";
    }
  }

  String getAdvice() {
    if (_bmi > 30) {
      return 'You have a Higher Body Weight than Normal, Try to excercise more  and Eat less';
    } else if (_bmi >= 25) {
      return ' You have a litle Higher Body Weight than Normal, Try to excercise more';
    } else if (_bmi >= 18.5) {
      return 'You have a Normal Body Weight . Keep it Up !';
    } else {
      return "You have Lower Body Weight than Normal ! Try to eat more.";
    }
  }
}
