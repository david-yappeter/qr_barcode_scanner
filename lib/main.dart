import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_barcode_scanner/controller/hive.dart';
import 'package:qr_barcode_scanner/controller/scanner.dart';
import 'package:qr_barcode_scanner/enum/code.dart';
import 'package:qr_barcode_scanner/model/code.dart';
import 'package:qr_barcode_scanner/model/history.dart';
import 'package:qr_barcode_scanner/screen/scanner.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(HistoryAdapter());
  Hive.registerAdapter(QRCodeAdapter());
  Hive.registerAdapter(BarcodeAdapter());
  Hive.registerAdapter(CodeTypeAdapter());

  Get.put(ScannerController());
  Get.put(HiveController());

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
          page: () => const ScannerScreen(),
        ),
      ],
    );
  }
}
