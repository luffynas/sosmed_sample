import 'package:hive/hive.dart';

import 'owner.dart';

part 'news.g.dart';

@HiveType(typeId: 1)
class News extends HiveObject {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? image;
  @HiveField(2)
  int? likes;
  @HiveField(3)
  List<String>? tags;
  @HiveField(4)
  String? text;
  @HiveField(5)
  DateTime? publishDate;
  @HiveField(6)
  Owner? owner;

  News({
    this.id,
    this.image,
    this.likes,
    this.tags,
    this.text,
    this.publishDate,
    this.owner,
  });

  factory News.fromJson(Map<String, dynamic> json) => News(
        id: json['id'] as String?,
        image: json['image'] as String?,
        likes: json['likes'] as int?,
        tags: json['tags'] as List<String>?,
        text: json['text'] as String?,
        publishDate: json['publishDate'] == null
            ? null
            : DateTime.parse(json['publishDate'] as String),
        owner: json['owner'] == null
            ? null
            : Owner.fromJson(json['owner'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
        'likes': likes,
        'tags': tags,
        'text': text,
        'publishDate': publishDate?.toIso8601String(),
        'owner': owner?.toJson(),
      };
}
