import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: basicDisplay(),
      ),
      );
  }

  Center basicDisplay() {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 30,
              color: Colors.amber,
              child: const Center(child: Text("A Simple text")),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(onPressed: () {
              debugPrint("Button pressed");
            }, child: const Text("Click me")),
          ],
        ),
      );
  }
}