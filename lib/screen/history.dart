import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:qr_barcode_scanner/controller/hive.dart';

class HistoryScreen extends GetView<HiveController> {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemCount: controller.histories.length,
        itemBuilder: (BuildContext context, int idx) => ListTile(
          title: Text(controller.histories[idx].code.data.content),
        ),
      ),
    );
  }
}
