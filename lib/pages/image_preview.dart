import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:susya/pages/result_page.dart';
import 'package:susya/remote_services/http.dart';
import 'package:susya/widgets/login_button.dart';

class ImagePreview extends StatefulWidget {
  final String imagePath;

  const ImagePreview({Key? key, required this.imagePath}) : super(key: key);

  @override
  _ImagePreviewState createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(
                  flex: 2,
                ),
                Image.file(File(widget.imagePath),
                    height: 300, fit: BoxFit.cover),
                Spacer(
                  flex: 1,
                ),
                LoginButton(
                  title: "Send",
                  onTap: () async {
                    setState(() {
                      isLoading = true;
                    });
                    var result = await sendToPredictor(widget.imagePath);
                    final String plant = result['plant'];
                    final String disease = result['disease'];
                    print(result);
                    setState(() {
                      isLoading = false;
                    });
                    Get.to(ResultPage(disease: disease, plant: plant));
                  },
                ),
                isLoading
                    ? Expanded(
                        flex: 2,
                        child: Center(child: CircularProgressIndicator()))
                    : Spacer(flex: 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
