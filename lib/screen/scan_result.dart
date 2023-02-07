import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:qr_barcode_scanner/model/code.dart';
import 'package:qr_barcode_scanner/screen/qr_preview.dart';
import 'package:qr_barcode_scanner/screen/scanner.dart';

class ScanResultScreen extends StatelessWidget {
  static const routeName = '/scan-result';
  final CodeInterface code;

  const ScanResultScreen({
    required this.code,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.offAllNamed(ScannerScreen.routeName);
          },
        ),
        title: const Text('Result'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: ListView(
          children: [
            Text(code.data.content),
            const SizedBox(height: 20.0),
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: const CircleAvatar(
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.qr_code,
                  color: Colors.white,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () async {
                      await Clipboard.setData(
                              ClipboardData(text: code.data.content))
                          .then((_) {
                        Get.rawSnackbar(
                          // message: 'Copied to clipboard',
                          messageText: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: Colors.grey[800],
                                ),
                                child: const Text(
                                  'Copied to clipboard',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),

                          borderRadius: 10.0,

                          backgroundColor: Colors.transparent,
                          isDismissible: true,
                          duration: const Duration(seconds: 3),
                          snackPosition: SnackPosition.BOTTOM,
                          margin: const EdgeInsets.fromLTRB(20, 0, 20, 40),
                        );
                      });
                    },
                    icon: const Icon(Icons.copy),
                  ),
                ],
              ),
              title: const Text("View code"),
              onTap: () {
                Get.to(() => QrPreviewScreen(code: code));
              },
            ),
          ],
        ),
      ),
    );
  }
}
