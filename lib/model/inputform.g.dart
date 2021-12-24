// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inputform.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class InputFormAdapter extends TypeAdapter<InputForm> {
  @override
  final int typeId = 1;

  @override
  InputForm read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InputForm(
      name: fields[0] as String,
      age: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, InputForm obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.age);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InputFormAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
