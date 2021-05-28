import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String disease, plant;

  const ResultPage({Key? key, required this.disease, required this.plant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
              child: Column(
        children: [
          Spacer(
            flex: 2,
          ),
          Text(plant, style: TextStyle(fontSize: 55)),
          Spacer(
            flex: 1,
          ),
          Text(disease, style: TextStyle(fontSize: 55)),
          Spacer(
            flex: 2,
          ),
        ],
      ))),
    );
  }
}
