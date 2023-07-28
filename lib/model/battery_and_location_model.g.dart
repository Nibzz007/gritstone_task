// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'battery_and_location_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BatteryDataAdapter extends TypeAdapter<BatteryData> {
  @override
  final int typeId = 0;

  @override
  BatteryData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BatteryData(
      batteryLevel: fields[0] as int,
      time: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, BatteryData obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.batteryLevel)
      ..writeByte(1)
      ..write(obj.time);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BatteryDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
