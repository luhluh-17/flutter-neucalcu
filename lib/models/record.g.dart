// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecordAdapter extends TypeAdapter<Record> {
  @override
  final typeId = 0;

  @override
  Record read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Record(
      answer: fields[0] as String,
      equation: fields[1] as String,
      date: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Record obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.answer)
      ..writeByte(1)
      ..write(obj.equation)
      ..writeByte(2)
      ..write(obj.date);
  }
}
