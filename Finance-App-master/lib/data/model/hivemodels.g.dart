// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hivemodels.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AdddataAdapter extends TypeAdapter<FinancesData> {
  @override
  final int typeId = 1;

  @override
  FinancesData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
     final isFavorite = fields[5] as bool? ?? false;
    return FinancesData(
      fields[3] as String,
      fields[2] as String,
      fields[4] as DateTime,
      fields[1] as String,
      fields[0] as String,
      isFavorite: isFavorite,
      //isFavorite: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, FinancesData obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.purpose)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.transactionType)
      ..writeByte(4)
      ..write(obj.dateTime)
      ..writeByte(5)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdddataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ProfileDataAdapter extends TypeAdapter<ProfileData> {
  @override
  final int typeId = 2;

  @override
  ProfileData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProfileData(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ProfileData obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.gender)
      ..writeByte(2)
      ..write(obj.nickName)
      ..writeByte(3)
      ..write(obj.profilePhotoPath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
