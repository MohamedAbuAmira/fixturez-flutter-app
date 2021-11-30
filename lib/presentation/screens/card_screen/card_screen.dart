import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card"),
      ),
      body: Center(
          child: Container(
        child: Text("Card"),
      )),
    );
  }
}
