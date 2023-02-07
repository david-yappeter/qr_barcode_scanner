import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:qr_barcode_scanner/controller/hive.dart';
import 'package:qr_barcode_scanner/controller/scanner.dart';
import 'package:flutter_zxing/flutter_zxing.dart';
import 'package:qr_barcode_scanner/model/code.dart';
import 'package:qr_barcode_scanner/model/history.dart';
import 'package:qr_barcode_scanner/screen/history.dart';
import 'package:qr_barcode_scanner/screen/qr_preview.dart';
import 'package:qr_barcode_scanner/screen/scan_result.dart';

class ScannerScreen extends GetView<ScannerController> {
  static const routeName = '/scanner';

  const ScannerScreen({Key? key}) : super(key: key);

  Widget buildScanner() {
    return Center(
      child: ReaderWidget(
        allowPinchZoom: true,
        scanDelaySuccess: const Duration(seconds: 1),
        onScan: (result) async {
          if (result.text != null) {
            final hiveController = HiveController.to;
            hiveController.addHistory(
              History(
                code: QRCode(content: result.text!),
                dateTime: DateTime.now(),
              ),
            );

            Get.offAll(
              () => ScanResultScreen(code: QRCode(content: result.text!)),
            );
          }
        },
      ),
    );
  }

  Widget buildCreate() {
    Widget buildTile(
        {required IconData icon, required String title, Function()? onTap}) {
      return ListTile(
        leading: Icon(icon),
        title: Text(
          title,
        ),
        onTap: onTap,
      );
    }

    return ListView(
      children: [
        buildTile(icon: Icons.share, title: "Use \"Share\" in other apps"),
        buildTile(
            icon: Icons.copy,
            title: "Content from clipboard",
            onTap: () async {
              final copiedText =
                  (await Clipboard.getData('text/plain'))?.text ?? '';
              final hiveController = HiveController.to;
              hiveController.addHistory(
                History(
                  code: QRCode(content: copiedText),
                  dateTime: DateTime.now(),
                ),
              );

              Get.to(
                () => QrPreviewScreen(
                  code: QRCode(content: copiedText),
                ),
              );
            }),
        buildTile(icon: Icons.public, title: "Website"),
        buildTile(icon: Icons.person_add, title: "Contact"),
        buildTile(icon: Icons.wifi, title: "Wi-Fi"),
        buildTile(icon: Icons.location_on_outlined, title: "Location"),
        buildTile(icon: Icons.calendar_month_outlined, title: "Event"),
        buildTile(icon: Icons.qr_code_outlined, title: "More QR codes"),
        buildTile(
            icon: Icons.quiz_rounded, title: "Barcodes and other 2D Codes"),
      ],
    );
  }

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
            buildScanner(),
            buildCreate(),
            const HistoryScreen(),
            const Center(
              child: Text("Setting"),
            ),
          ],
        ),
      ),
    );
  }
}
