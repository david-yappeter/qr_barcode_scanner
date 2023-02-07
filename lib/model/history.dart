import 'package:hive/hive.dart';
import 'package:qr_barcode_scanner/model/code.dart';
part 'history.g.dart';

@HiveType(typeId: 0)
class History extends HiveObject {
  @HiveField(0)
  CodeInterface code;

  @HiveField(1)
  DateTime dateTime;

  History({
    required this.code,
    required this.dateTime,
  });
}
