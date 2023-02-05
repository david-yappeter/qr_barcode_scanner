import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qr_barcode_scanner/controller/scanner.dart';
import 'package:qr_barcode_scanner/screen/scan_result.dart';
import 'package:qr_barcode_scanner/screen/scanner.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await GetStorage.init();

  Get.put(ScannerController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'QR Scanner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: ScannerScreen.routeName,
      getPages: [
        GetPage(
          name: ScannerScreen.routeName,
          page: () => ScannerScreen(),
          // binding: ScannerBinding(),
        ),
        // GetPage(name: ScanResultScreen.routeName, page: () => ScanResultScreen(content: content),),
      ],
    );
  }
}
