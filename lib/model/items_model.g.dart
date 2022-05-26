// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ItemsModelAdapter extends TypeAdapter<ItemsModel> {
  @override
  final int typeId = 0;

  @override
  ItemsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ItemsModel(
      downloadCount: fields[0] as String?,
      viewCount: fields[1] as int?,
      likeCount: fields[2] as int?,
      downloadCountInt: fields[3] as int?,
      isPremium: fields[4] as bool?,
      sId: fields[5] as String?,
      itemId: fields[6] as String?,
      typeId: fields[7] as String?,
      categoryId: fields[8] as String?,
      itemName: fields[9] as String?,
      fileUrl: fields[10] as String?,
      imageUrl: fields[11] as String?,
      thumbUrl: fields[12] as String?,
      authorName: fields[13] as String?,
      version: fields[14] as String?,
      size: fields[15] as String?,
      description: fields[16] as String?,
      htmlDescription: fields[17] as String?,
      shortDescription: fields[18] as String?,
      hotPriority: fields[19] as String?,
      videoCode: fields[20] as String?,
      isVerify: fields[21] as String?,
      createTime: fields[22] as String?,
      price: fields[23] as String?,
      byReturnone: fields[24] as bool?,
      priority: fields[25] as int?,
      approved: fields[26] as bool?,
      createdAt: fields[27] as String?,
      updatedAt: fields[28] as String?,
      iV: fields[29] as int?,
      liked: fields[30] as bool?,
      downloaded: fields[31] as bool?,
      fileUrldownloaded: fields[32] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ItemsModel obj) {
    writer
      ..writeByte(33)
      ..writeByte(0)
      ..write(obj.downloadCount)
      ..writeByte(1)
      ..write(obj.viewCount)
      ..writeByte(2)
      ..write(obj.likeCount)
      ..writeByte(3)
      ..write(obj.downloadCountInt)
      ..writeByte(4)
      ..write(obj.isPremium)
      ..writeByte(5)
      ..write(obj.sId)
      ..writeByte(6)
      ..write(obj.itemId)
      ..writeByte(7)
      ..write(obj.typeId)
      ..writeByte(8)
      ..write(obj.categoryId)
      ..writeByte(9)
      ..write(obj.itemName)
      ..writeByte(10)
      ..write(obj.fileUrl)
      ..writeByte(11)
      ..write(obj.imageUrl)
      ..writeByte(12)
      ..write(obj.thumbUrl)
      ..writeByte(13)
      ..write(obj.authorName)
      ..writeByte(14)
      ..write(obj.version)
      ..writeByte(15)
      ..write(obj.size)
      ..writeByte(16)
      ..write(obj.description)
      ..writeByte(17)
      ..write(obj.htmlDescription)
      ..writeByte(18)
      ..write(obj.shortDescription)
      ..writeByte(19)
      ..write(obj.hotPriority)
      ..writeByte(20)
      ..write(obj.videoCode)
      ..writeByte(21)
      ..write(obj.isVerify)
      ..writeByte(22)
      ..write(obj.createTime)
      ..writeByte(23)
      ..write(obj.price)
      ..writeByte(24)
      ..write(obj.byReturnone)
      ..writeByte(25)
      ..write(obj.priority)
      ..writeByte(26)
      ..write(obj.approved)
      ..writeByte(27)
      ..write(obj.createdAt)
      ..writeByte(28)
      ..write(obj.updatedAt)
      ..writeByte(29)
      ..write(obj.iV)
      ..writeByte(30)
      ..write(obj.liked)
      ..writeByte(31)
      ..write(obj.downloaded)
      ..writeByte(32)
      ..write(obj.fileUrldownloaded);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ItemsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
