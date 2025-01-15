import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int flag = 0;
  String displayText = "A simple text";

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    return MaterialApp(
      home: Scaffold(
        body: basicDisplay(screenSize.width, screenSize.height),
      ),
    );
  }

  Center basicDisplay(double screenWidth, double screenHeight) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: screenWidth * 0.2,
            height: screenHeight * 0.07,
            color: Colors.amber,
            child: Center(
              child: Text(
                displayText,
                style: TextStyle(
                  fontSize: screenWidth * 0.02,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: screenWidth * 0.18,
            height: screenHeight * 0.07,
            child: TextButton(
              onPressed: () {
                debugPrint("Button pressed");
                setState(() {
                  changeText();
                });
              },
              child: Text(
                "Click me",
                style: TextStyle(
                  fontSize: screenWidth * 0.02,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void changeText() {
    if (flag == 0) {
      flag = 1;
      displayText = "Hello World";
    } else {
      flag = 0;
      displayText = "A simple text";
    }
  }
}
