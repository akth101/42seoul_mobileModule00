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
            height: screenHeight * 0.08,
            color: Colors.amber,
            child: Center(
              child: Text(
                "A Simple text",
                style: TextStyle(
                  fontSize: screenWidth * 0.03,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: screenWidth * 0.2,
            height: screenHeight * 0.1,
            child: TextButton(
              onPressed: () {
                debugPrint("Button pressed");
              },
              child: Text(
                "Click me",
                style: TextStyle(
                  fontSize: screenWidth * 0.03,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
