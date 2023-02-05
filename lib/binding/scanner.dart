import 'package:get/get.dart';
import 'package:qr_barcode_scanner/controller/scanner.dart';

class ScannerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(() => ScannerController);
  }
}
