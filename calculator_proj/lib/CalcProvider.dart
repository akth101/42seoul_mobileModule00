import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalcProvider extends ChangeNotifier {
  String expression = '';
  double result = 0;


  //getter
  String get getExpression => expression;
  double get getResult => result;

  // 계산 함수
  void calculate() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(expression);
      result = exp.evaluate(EvaluationType.REAL, ContextModel());
      notifyListeners(); // UI 업데이트를 위해 필요
    } catch (e) {
      debugPrint('Error calculating: $e');
    }
  }

  //사용자가 계산을 지시했을 때 calculate 함수 발동
  void pressEqual() {
    calculate();
  }

  //자판 하나 누를 때마다 하나씩 추가
  void addExpression(String text) {
    expression += text;
  }

  void pressC() {
    expression = expression.isEmpty
        ? ""
        : expression.substring(0, expression.length - 1);
  }

  void pressAC() {
    expression = "0";
    result = 0;
  }



  
}
