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
            middlePadding(screenSize),
            buttonField(screenSize),
          ],
        ),
      ),
    );
  }

  Expanded buttonField(Size screenSize) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(child: indivButton("7", screenSize)),
                Expanded(child: indivButton("8", screenSize)),
                Expanded(child: indivButton("9", screenSize)),
                Expanded(child: specialButton("C", screenSize)),
                Expanded(child: specialButton("AC", screenSize)),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(child: indivButton("4", screenSize)),
                Expanded(child: indivButton("5", screenSize)),
                Expanded(child: indivButton("6", screenSize)),
                Expanded(child: indivButton("+", screenSize)),
                Expanded(child: indivButton("-", screenSize)),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(child: indivButton("1", screenSize)),
                Expanded(child: indivButton("2", screenSize)),
                Expanded(child: indivButton("3", screenSize)),
                Expanded(child: indivButton("*", screenSize)),
                Expanded(child: indivButton("/", screenSize)),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(child: indivButton("0", screenSize)),
                Expanded(child: indivButton(".", screenSize)),
                Expanded(child: indivButton("00", screenSize)),
                Expanded(child: indivButton("=", screenSize)),
                Expanded(child: indivButton("", screenSize)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector indivButton(String text, Size screenSize) {
    return GestureDetector(
      onTap: () {
        if (text != "") {
          debugPrint("button pressed: $text");
        }
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.teal[100],
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: screenSize.height * 0.045),
          ),
        ),
      ),
    );
  }

  GestureDetector specialButton(String text, Size screenSize) {
    return GestureDetector(
      onTap: () {
        if (text != "") {
          debugPrint("button pressed: $text");
        }
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.teal[100],
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: screenSize.height * 0.045,
                color: Colors.red
                ),
          ),
        ),
      ),
    );
  }

  Container middlePadding(Size screenSize) {
    return Container(
      width: double.infinity,
      height: screenSize.height * 0.4,
      color: Colors.amber,
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
