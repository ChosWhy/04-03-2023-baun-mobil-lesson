import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/demos.dart';
import 'main_page.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Demo",
      theme: ThemeData.dark(),
      home: const Demos(),
    );
  }
}
