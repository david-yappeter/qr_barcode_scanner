import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_barcode_scanner/controller/scanner.dart';
import 'package:flutter_zxing/flutter_zxing.dart';

class ScannerScreen extends GetView<ScannerController> {
  static const routeName = '/scanner';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        elevation: 0,
        title: TabBar(
          controller: controller.controller,
          tabs: const <Widget>[
            Tab(
              icon: Icon(Icons.qr_code),
            ),
            Tab(
              icon: Icon(Icons.beach_access_sharp),
            ),
            Tab(
              icon: Icon(Icons.brightness_5_sharp),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller.controller,
        children: <Widget>[
          Center(
            child: ReaderWidget(
              allowPinchZoom: true,
              onScan: (result) async {
                print("RESULT $result");
                print(result.text);
              },
            ),
          ),
          const Center(
            child: Text("It's rainy here"),
          ),
          const Center(
            child: Text("It's sunny here"),
          ),
        ],
      ),
    );
  }
}
