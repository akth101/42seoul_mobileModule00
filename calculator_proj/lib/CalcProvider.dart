import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalcProvider extends ChangeNotifier {
  String expression = "0";
  String result = "0";


  //getter
  String get getExpression => expression;
  String get getResult => result;

  // 계산 함수
 void calculate() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(expression);
      double calcResult = exp.evaluate(EvaluationType.REAL, ContextModel());
      result = calcResult.toString();  // 계산 결과를 문자열로 변환
      notifyListeners();
    } catch (e) {
      debugPrint('Error calculating: $e');
      result = 'Error';  // 에러 발생 시 'Error' 표시
      notifyListeners();
    }
  }

  //사용자가 계산을 지시했을 때 calculate 함수 발동
  void pressEqual() {
    calculate();
    notifyListeners();
  }

  //자판 하나 누를 때마다 하나씩 추가
  void addExpression(String text) {
    if (expression == "0") {
      expression = "";
    }
    expression += text;
    notifyListeners();
  }

  void pressC() {
    expression = expression.isEmpty
        ? ""
        : expression.substring(0, expression.length - 1);
      notifyListeners();
  }

  void pressAC() {
    expression = "0";
    result = "0";
    notifyListeners();
  }



  
}
