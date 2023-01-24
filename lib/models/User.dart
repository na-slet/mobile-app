// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:naslet_mobile/services/APIService.dart';

import 'Gender.dart';
import 'Union.dart';

class User {
  final String? firstName;
  final String? lastName;
  final String? middleName;
  final Gender? gender;
  final String? phone;
  final String? parentPhone;
  final String? parentFIO;
  final String email;
  final String avatar;
  final String? city;
  final String? birthDate;
  final Union? union;

  User({
    this.firstName,
    this.lastName,
    this.middleName,
    this.gender,
    this.phone,
    this.parentPhone,
    this.parentFIO,
    required this.email,
    required this.avatar,
    this.city,
    this.birthDate,
    this.union,
  });
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      firstName: map['first_name'] != null ? map['first_name'] as String : null,
      lastName: map['last_name'] != null ? map['last_name'] as String : null,
      middleName:
          map['middle_name'] != null ? map['middle_name'] as String : null,
      gender: map['gender'] != null
          ? Gender.values.firstWhere((e) => e.val == map['gender'])
          : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      parentPhone:
          map['parent_phone'] != null ? map['parent_phone'] as String : null,
      parentFIO: map['parent_fio'] != null ? map['parent_fio'] as String : null,
      email: map['email'] as String,
      avatar: '${APIService.url}/${map['avatar_id'] as String}',
      city: map['city'] != null ? map['city'] as String : null,
      birthDate: map['birth_date'] != null ? map['birth_date'] as String : null,
      union: map['union_id'] != null
          ? Union.allUnions[map['union_id']] as Union
          : null,
    );
  }

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
