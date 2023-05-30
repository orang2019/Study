// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qa.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QAAdapter extends TypeAdapter<QA> {
  @override
  final int typeId = 3;

  @override
  QA read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QA(
      question: fields[1] as String,
      answer: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, QA obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.question)
      ..writeByte(2)
      ..write(obj.answer);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QAAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
