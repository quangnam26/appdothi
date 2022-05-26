import 'package:hive/hive.dart';
part 'items_model.g.dart';

@HiveType(typeId: 0)
class ItemsModel {
  @HiveField(0)
  String? downloadCount;
  @HiveField(1)
  int? viewCount;
  @HiveField(2)
  int? likeCount;
  @HiveField(3)
  int? downloadCountInt;
  @HiveField(4)
  bool? isPremium;
  @HiveField(5)
  String? sId;
  @HiveField(6)
  String? itemId;
  @HiveField(7)
  String? typeId;
  @HiveField(8)
  String? categoryId;
  @HiveField(9)
  String? itemName;
  @HiveField(10)
  String? fileUrl;
  @HiveField(11)
  String? imageUrl;
  @HiveField(12)
  String? thumbUrl;
  @HiveField(13)
  String? authorName;
  @HiveField(14)
  String? version;
  @HiveField(15)
  String? size;
  @HiveField(16)
  String? description;
  @HiveField(17)
  String? htmlDescription;
  @HiveField(18)
  String? shortDescription;
  @HiveField(19)
  String? hotPriority;
  @HiveField(20)
  String? videoCode;
  @HiveField(21)
  String? isVerify;
  @HiveField(22)
  String? createTime;
  @HiveField(23)
  String? price;
  @HiveField(24)
  bool? byReturnone;
  @HiveField(25)
  int? priority;
  @HiveField(26)
  bool? approved;
  @HiveField(27)
  String? createdAt;
  @HiveField(28)
  String? updatedAt;
  @HiveField(29)
  int? iV;
  @HiveField(30)
  bool? liked;
  @HiveField(31)
  bool? downloaded;
  @HiveField(32)
  String? fileUrldownloaded;

  ItemsModel(
      {this.downloadCount,
      this.viewCount,
      this.likeCount,
      this.downloadCountInt,
      this.isPremium,
      this.sId,
      this.itemId,
      this.typeId,
      this.categoryId,
      this.itemName,
      this.fileUrl,
      this.imageUrl,
      this.thumbUrl,
      this.authorName,
      this.version,
      this.size,
      this.description,
      this.htmlDescription,
      this.shortDescription,
      this.hotPriority,
      this.videoCode,
      this.isVerify,
      this.createTime,
      this.price,
      this.byReturnone,
      this.priority,
      this.approved,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.liked,
      this.downloaded,
      this.fileUrldownloaded});

  ItemsModel.fromJson(Map<String, dynamic> json) {
    downloadCount = json['download_count'];
    viewCount = json['view_count'];
    likeCount = json['like_count'];
    downloadCountInt = json['download_count_int'];
    isPremium = json['is_premium'];
    sId = json['_id'];
    itemId = json['item_id'];
    typeId = json['type_id'];
    categoryId = json['category_id'];
    itemName = json['item_name'];
    fileUrl = json['file_url'];
    imageUrl = json['image_url'];
    thumbUrl = json['thumb_url'];
    authorName = json['author_name'];
    version = json['version'];
    size = json['size'];
    description = json['description'];
    htmlDescription = json['html_description'];
    shortDescription = json['short_description'];
    hotPriority = json['hot_priority'];
    videoCode = json['video_code'];
    isVerify = json['is_verify'];
    createTime = json['create_time'];
    price = json['price'];
    byReturnone = json['by_returnone'];
    priority = json['priority'];
    approved = json['approved'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['download_count'] = downloadCount;
    data['view_count'] = viewCount;
    data['like_count'] = likeCount;
    data['download_count_int'] = downloadCountInt;
    data['is_premium'] = isPremium;
    data['_id'] = sId;
    data['item_id'] = itemId;
    data['type_id'] = typeId;
    data['category_id'] = categoryId;
    data['item_name'] = itemName;
    data['file_url'] = fileUrl;
    data['image_url'] = imageUrl;
    data['thumb_url'] = thumbUrl;
    data['author_name'] = authorName;
    data['version'] = version;
    data['size'] = size;
    data['description'] = description;
    data['html_description'] = htmlDescription;
    data['short_description'] = shortDescription;
    data['hot_priority'] = hotPriority;
    data['video_code'] = videoCode;
    data['is_verify'] = isVerify;
    data['create_time'] = createTime;
    data['price'] = price;
    data['by_returnone'] = byReturnone;
    data['priority'] = priority;
    data['approved'] = approved;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}
