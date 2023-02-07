import 'package:hive/hive.dart';
import 'package:qr_barcode_scanner/enum/code.dart';
part 'code.g.dart';

class CodeData {
  String content;
  CodeType type;

  CodeData({
    required this.content,
    required this.type,
  });
}

abstract class CodeInterface {
  CodeData get data;
}

@HiveType(typeId: 1)
class QRCode implements CodeInterface {
  @HiveField(0)
  CodeType type = CodeType.qrCode;

  @HiveField(1)
  String content;

  QRCode({
    required this.content,
  });

  @override
  CodeData get data => CodeData(content: content, type: type);
}

@HiveType(typeId: 2)
class Barcode implements CodeInterface {
  @HiveField(0)
  CodeType type = CodeType.barCode;

  @HiveField(1)
  String content;

  Barcode({
    required this.content,
  });

  @override
  CodeData get data => CodeData(content: content, type: type);
}
