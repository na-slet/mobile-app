// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:naslet_mobile/services/APIService.dart';

import 'Gender.dart';
import 'Union.dart';

class User {
  final String? firstName;
  final String? lastName;
  final Gender? gender;
  final String? phone;
  final String? parentPhone;
  final String email;
  final String avatar;
  final String? city;
  final String? birthDate;
  final Union? union;

  User({
    this.firstName,
    this.lastName,
    this.gender,
    this.phone,
    this.parentPhone,
    required this.email,
    required this.avatar,
    this.city,
    this.birthDate,
    this.union,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'first_name': firstName,
      'last_name': lastName,
      'gender': gender,
      'phone': phone,
      'parent_phone': parentPhone,
      'email': email,
      'avatar_id': avatar,
      'city': city,
      'birth_date': birthDate,
      'union_id': union?.id,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      firstName: map['first_name'] != null ? map['first_name'] as String : null,
      lastName: map['last_name'] != null ? map['last_name'] as String : null,
      gender: map['gender'] != null
          ? Gender.values.firstWhere((e) => e.val == map['gender'])
          : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      parentPhone:
          map['parent_phone'] != null ? map['parent_phone'] as String : null,
      email: map['email'] as String,
      avatar: '${APIService.url}/${map['avatar_id'] as String}',
      city: map['city'] != null ? map['city'] as String : null,
      birthDate: map['birth_date'] != null ? map['birth_date'] as String : null,
      union: map['union_id'] != null ? map['union_id'] as Union : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
