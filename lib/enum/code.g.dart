// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CodeTypeAdapter extends TypeAdapter<CodeType> {
  @override
  final int typeId = 3;

  @override
  CodeType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return CodeType.qrCode;
      case 1:
        return CodeType.barCode;
      default:
        return CodeType.qrCode;
    }
  }

  @override
  void write(BinaryWriter writer, CodeType obj) {
    switch (obj) {
      case CodeType.qrCode:
        writer.writeByte(0);
        break;
      case CodeType.barCode:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CodeTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
