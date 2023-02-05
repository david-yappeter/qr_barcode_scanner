import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_barcode_scanner/controller/scanner.dart';
import 'package:flutter_zxing/flutter_zxing.dart';
import 'package:qr_barcode_scanner/screen/scan_result.dart';

class ScannerScreen extends GetView<ScannerController> {
  static const routeName = '/scanner';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          elevation: 0,
          title: TabBar(
            controller: controller.tabBarController,
            tabs: const <Widget>[
              Tab(
                icon: Icon(Icons.qr_code_scanner),
                text: 'Scan',
              ),
              Tab(
                icon: Icon(Icons.edit),
                text: 'Create',
              ),
              Tab(
                icon: Icon(Icons.history),
                text: 'History',
              ),
              Tab(
                icon: Icon(Icons.settings),
                text: 'Setting',
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: controller.tabBarController,
          children: <Widget>[
            Center(
              child: ReaderWidget(
                allowPinchZoom: true,
                scanDelaySuccess: const Duration(seconds: 1),
                onScan: (result) async {
                  if (result.text != null) {
                    Get.to(
                      ScanResultScreen(content: result.text!),
                    );
                  }
                },
              ),
            ),
            const Center(
              child: Text("It's rainy here"),
            ),
            const Center(
              child: Text("It's sunny here"),
            ),
            const Center(
              child: Text("Setting"),
            ),
          ],
        ),
      ),
    );
  }
}
