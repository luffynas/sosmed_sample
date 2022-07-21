// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewsAdapter extends TypeAdapter<News> {
  @override
  final int typeId = 1;

  @override
  News read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return News(
      id: fields[0] as String?,
      image: fields[1] as String?,
      likes: fields[2] as int?,
      tags: (fields[3] as List?)?.cast<String>(),
      text: fields[4] as String?,
      publishDate: fields[5] as DateTime?,
      owner: fields[6] as Owner?,
    );
  }

  @override
  void write(BinaryWriter writer, News obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.likes)
      ..writeByte(3)
      ..write(obj.tags)
      ..writeByte(4)
      ..write(obj.text)
      ..writeByte(5)
      ..write(obj.publishDate)
      ..writeByte(6)
      ..write(obj.owner);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
