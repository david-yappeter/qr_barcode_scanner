import 'package:hive/hive.dart';

part 'code.g.dart';

@HiveType(typeId: 3)
enum CodeType {
  @HiveField(0)
  qrCode,
  @HiveField(1)
  barCode,
}
