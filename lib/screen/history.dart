import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:qr_barcode_scanner/controller/hive.dart';
import 'package:qr_barcode_scanner/model/code.dart';
import 'package:qr_barcode_scanner/screen/scan_result.dart';

class HistoryScreen extends GetView<HiveController> {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 16.0),
            decoration: BoxDecoration(
              color: Colors.grey[300],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${controller.histories.length}'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Export'),
                    const SizedBox(width: 10.0),
                    const Text('Import'),
                    const SizedBox(width: 5.0),
                    IconButton(
                      onPressed: () {
                        HiveController.to.clearHistory();
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: controller.histories.length,
              itemBuilder: (BuildContext context, int idx) {
                final history =
                    controller.histories[controller.histories.length - idx - 1];

                return ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.black,
                    child: Icon(Icons.qr_code, color: Colors.white),
                  ),
                  title: Text(history.code.data.content),
                  subtitle: Text(
                    DateFormat('dd/MM/yy hh:mm').format(history.dateTime),
                  ),
                  onTap: () {
                    Get.to(
                      () => ScanResultScreen(
                        code: history.code,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
