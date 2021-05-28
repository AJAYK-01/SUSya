import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'camera/camera_page.dart';
import 'widgets/login_button.dart';

void main() {
  runApp(GetMaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(flex: 4),
                Image.asset(
                  "assets/logo.png",
                  height: 125,
                ),
                Text("SUSya",
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.green,
                        fontWeight: FontWeight.bold)),
                Spacer(flex: 1),
                LoginButton(
                  title: "Login",
                  onTap: () => Get.to(CameraPage()),
                ),
                Spacer(flex: 6)
              ],
            )),
          ),
        ],
      ),
    );
  }
}
