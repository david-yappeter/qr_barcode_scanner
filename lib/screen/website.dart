import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_barcode_scanner/controller/hive.dart';
import 'package:qr_barcode_scanner/model/code.dart';
import 'package:qr_barcode_scanner/model/history.dart';
import 'package:qr_barcode_scanner/screen/qr_preview.dart';

class WebsiteScreen extends StatefulWidget {
  final TextEditingController inputController =
      TextEditingController(text: "https://");

  WebsiteScreen({Key? key}) : super(key: key);

  @override
  State<WebsiteScreen> createState() => _WebsiteScreenState();
}

class _WebsiteScreenState extends State<WebsiteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              final code = QRCode(content: widget.inputController.text);
              HiveController.to.addHistory(
                History(
                  code: code,
                  dateTime: DateTime.now(),
                ),
              );

              Get.to(() => QrPreviewScreen(code: code));
            },
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: TextFormField(
          controller: widget.inputController,
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            labelText: "Website",
          ),
          keyboardType: TextInputType.number,
        ),
      ),
    );
  }
}
