import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:qr_barcode_scanner/model/history.dart';

class HiveController extends GetxController {
  String historyBoxScanKey = 'histories.scan';
  RxList<History> histories = RxList([]);
  late Box _box;

  @override
  Future<void> onInit() async {
    _box = await Hive.openBox('histories');
    _getHistory();
    super.onInit();
  }

  void _getHistory() {
    histories.value = _box.get(historyBoxScanKey) ?? [];
  }

  Future<void> addHistory(History history) async {
    histories.add(history);
    await _box.put(historyBoxScanKey, histories);
  }

  Future<void> clearHistory() async {
    histories.value = [];
    await _box.put(historyBoxScanKey, histories);
  }

  @override
  void dispose() {
    _box.close();
    super.dispose();
  }
}
