import 'package:hive/hive.dart';

part 'owner.g.dart';

@HiveType(typeId: 2)
class Owner extends HiveObject {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? title;
  @HiveField(2)
  String? firstName;
  @HiveField(3)
  String? lastName;
  @HiveField(4)
  String? picture;

  Owner({this.id, this.title, this.firstName, this.lastName, this.picture});

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        id: json['id'] as String?,
        title: json['title'] as String?,
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        picture: json['picture'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'firstName': firstName,
        'lastName': lastName,
        'picture': picture,
      };
}
