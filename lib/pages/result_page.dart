import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String disease, plant, remedy;

  const ResultPage(
      {Key? key,
      required this.disease,
      required this.plant,
      required this.remedy})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Your Crop Analysis Report"),
          backgroundColor: Colors.green),
      body: Center(
          child: Container(
              height: 300,
              width: 350,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.greenAccent.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(
                    flex: 2,
                  ),
                  Text("Plant Name: " + plant, style: TextStyle(fontSize: 18)),
                  Spacer(
                    flex: 1,
                  ),
                  Text("Disease detected: " + disease,
                      style: TextStyle(fontSize: 18)),
                  Spacer(flex: 1),
                  Text("Possible remedy: " + remedy,
                      style: TextStyle(fontSize: 18)),
                  Spacer(
                    flex: 2,
                  ),
                ],
              ))),
    );
  }
}
