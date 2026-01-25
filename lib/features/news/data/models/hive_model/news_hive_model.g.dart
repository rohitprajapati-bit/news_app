// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NewsHiveModelAdapter extends TypeAdapter<NewsHiveModel> {
  @override
  final int typeId = 1;

  @override
  NewsHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NewsHiveModel(
      title: fields[0] as String,
      description: fields[1] as String,
      urlToImage: fields[2] as String,
      url: fields[3] as String,
      author: fields[4] as String?,
      content: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, NewsHiveModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.urlToImage)
      ..writeByte(3)
      ..write(obj.url)
      ..writeByte(4)
      ..write(obj.author)
      ..writeByte(5)
      ..write(obj.content);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NewsHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
