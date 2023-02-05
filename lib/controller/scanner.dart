import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScannerController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController _controller;

  TabController get controller => _controller;

  @override
  void onInit() {
    _controller = TabController(length: 3, vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    _controller.dispose();
    super.onClose();
  }
}
