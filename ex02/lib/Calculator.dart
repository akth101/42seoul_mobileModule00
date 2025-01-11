import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({
    super.key,
  });

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String expression = "0";
  String result = "0";
  @override
  Widget build(BuildContext context) {
  final screenSize = MediaQuery.sizeOf(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ),
      body: Center(
        child: Column(
          children: [
            textField(expression, screenSize.height),
            textField(result, screenSize.height),
          ],
        ),
      ),
    );
  }

  Container textField(String data, double screenHeight) {
    return Container(
      width: double.infinity,
      height: screenHeight * 0.06,
      color: Colors.amber,
      child: Padding(
        padding: EdgeInsets.only(right: screenHeight * 0.01),
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            data,
            style: TextStyle(
              fontSize: screenHeight * 0.04,
            ),
          ),
        ),
      ),
      
    );
  }
}
