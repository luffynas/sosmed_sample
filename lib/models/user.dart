import 'package:hive/hive.dart';

import '../utils/preference.dart';

part 'user.g.dart';

@HiveType(typeId: 2)
class User extends HiveObject {
  User({
    this.id,
    this.title,
    this.firstName,
    this.lastName,
    this.picture,
    this.gender,
    this.email,
    this.dateOfBirth,
    this.phone,
    this.registerDate,
    this.updatedDate,
  });

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
  @HiveField(5)
  String? gender;
  @HiveField(6)
  String? email;
  @HiveField(7)
  String? dateOfBirth;
  @HiveField(8)
  String? phone;
  @HiveField(9)
  String? registerDate;
  @HiveField(10)
  String? updatedDate;

  bool get isMe => id == spUtils.getInt('user_id');

  static User empty() {
    return User(
      id: '',
      title: "",
      firstName: "",
      lastName: "",
      picture: "",
      gender: "",
      email: "",
      dateOfBirth: "",
      phone: "",
      registerDate: '',
      updatedDate: "",
    );
  }

  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as String?,
        title: json['title'] as String?,
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        picture: json['picture'] as String?,
        gender: json['gender'] as String?,
        email: json['email'] as String?,
        dateOfBirth: json['dateOfBirth'] as String?,
        phone: json['phone'] as String?,
        registerDate: json['registerDate'] as String?,
        updatedDate: json['updatedDate'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'firstName': firstName,
        'lastName': lastName,
        'picture': picture,
        'gender': gender,
        'email': email,
        'dateOfBirth': dateOfBirth,
        'phone': phone,
        'registerDate': registerDate,
        'updatedDate': updatedDate,
      };

  User copy({
    String? id,
    String? title,
    String? firstName,
    String? lastName,
    String? picture,
    String? gender,
    String? email,
    String? dateOfBirth,
    String? phone,
    String? registerDate,
    String? updatedDate,
  }) =>
      User(
        id: id ?? this.id,
        title: title ?? this.title,
        firstName: firstName ?? this.firstName,
        email: email ?? this.email,
        picture: picture ?? this.picture,
        gender: gender ?? this.gender,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        phone: phone ?? this.phone,
        registerDate: registerDate ?? this.registerDate,
        updatedDate: updatedDate ?? this.updatedDate,
      );

  @override
  List<Object?> get props => [
        id,
        title,
        firstName,
        lastName,
        picture,
        gender,
        email,
        dateOfBirth,
        phone,
        registerDate,
        updatedDate,
      ];
}
