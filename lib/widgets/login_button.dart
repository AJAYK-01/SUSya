import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:susya/camera/camera_page.dart';

class LoginButton extends StatelessWidget {
  final String title;
  final void Function() onTap;
  const LoginButton({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        width: 120,
        child: Center(
            child: Text(title,
                style: TextStyle(fontSize: 22, color: Colors.white))),
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(26)),
      ),
    );
  }
}
