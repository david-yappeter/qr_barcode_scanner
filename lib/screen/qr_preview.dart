import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_barcode_scanner/model/code.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrPreviewScreen extends StatelessWidget {
  final CodeInterface code;

  const QrPreviewScreen({
    required this.code,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Scanner'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: ListView(
          children: [
            QrImage(
              padding: const EdgeInsets.all(30),
              data: code.data.content,
              version: QrVersions.auto,
              size: Get.width,
            ),
            Text(code.data.content),
          ],
        ),
      ),
    );
  }
}
