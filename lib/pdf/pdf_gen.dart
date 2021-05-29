import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';
import 'package:susya/authentication/auth_class.dart';

Future<Uint8List> getImageFileFromAssets(String path) async {
  final byteData = await rootBundle.load('assets/$path');

  final file = File('${(await getTemporaryDirectory()).path}/$path');
  await file.writeAsBytes(byteData.buffer
      .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

  return File('${(await getTemporaryDirectory()).path}/$path')
      .readAsBytesSync();
}

getImageFile(String filename) {
  getImageFileFromAssets(filename).then((value) {
    return value;
  });
}

Future<bool> makeReport({plant, disease, remedy}) async {
  final User user = Authentication.getCurrentUser();
  print(user.toString());
  String dateTime = DateTime.now().toString();

  Directory? appDocDirectory = await getExternalStorageDirectory();

  var downloads = "/storage/emulated/0/Download";

  Permission permission1 = await Permission.storage;

  var dir;
  new Directory(downloads + '/SUSya').create(recursive: true)
      // The created directory is returned as a Future.
      .then((Directory directory) async {
    dir = directory.path;
    print('Path of New Dir: ' + directory.path);
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) => pw.Center(
          child: pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.center,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Spacer(flex: 3),
                pw.Text("$dateTime"),
                pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    children: [
                      pw.Spacer(),
                      pw.Text("SUSya",
                          style: pw.TextStyle(
                              color: PdfColors.green,
                              fontSize: 40,
                              fontWeight: pw.FontWeight.bold)),
                      pw.Spacer(),
                    ]),
                pw.Spacer(flex: 2),
                pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.center,
                    crossAxisAlignment: pw.CrossAxisAlignment.center,
                    children: [
                      pw.Spacer(),
                      pw.Text("Crop Analysis Report",
                          style: pw.TextStyle(
                              color: PdfColors.black,
                              fontSize: 32,
                              fontWeight: pw.FontWeight.bold,
                              fontStyle: pw.FontStyle.italic)),
                      pw.Spacer(),
                    ]),
                pw.Spacer(flex: 2),
                pw.Text("Username: ${user.displayName}",
                    style: pw.TextStyle(color: PdfColors.black, fontSize: 26)),
                pw.SizedBox(height: 5),
                pw.Text("Email: ${user.email}",
                    style: pw.TextStyle(color: PdfColors.black, fontSize: 26)),
                pw.SizedBox(height: 5),
                pw.Text("Plant: $plant",
                    style: pw.TextStyle(color: PdfColors.black, fontSize: 26)),
                pw.SizedBox(height: 5),
                pw.Text("Identified Disease: $disease",
                    style: pw.TextStyle(color: PdfColors.black, fontSize: 26)),
                pw.Spacer(flex: 6),
              ]),
        ),
      ),
    );

    String name = "${plant}_"
        .replaceAll(' ', "_")
        .replaceAll(".", "_")
        .replaceAll(":", "_");

    final file = File('$dir/Report_$name.pdf');
    await file.writeAsBytes(await pdf.save());

    return true;
  });
  return true;
}
