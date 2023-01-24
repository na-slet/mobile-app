// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'CategoryType.dart';
import 'EventType.dart';
import 'Union.dart';

class Event {
  final String id;
  final String name;
  final String description;
  final String shortDescription;
  final String logoVariant;
  final String city;
  final DateTime regEndDate;
  final DateTime startDate;
  final DateTime endDate;
  final EventType eventType;
  final CategoryType categoryType;
  final Union union;
  final int minAge;
  final int maxAge;
  final String address;
  final double latitude;
  final double longitude;

  Event({
    required this.id,
    required this.name,
    required this.description,
    required this.shortDescription,
    required this.logoVariant,
    required this.city,
    required this.regEndDate,
    required this.startDate,
    required this.endDate,
    required this.eventType,
    required this.categoryType,
    required this.union,
    required this.minAge,
    required this.maxAge,
    required this.address,
    required this.latitude,
    required this.longitude,
  });

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      shortDescription: map['short_description'] as String,
      logoVariant: map['logo_variant'] as String,
      city: map['city'] as String,
      regEndDate: DateTime.parse(map['reg_end_date'] as String),
      startDate: DateTime.parse(map['start_date'] as String),
      endDate: DateTime.parse(map['end_date'] as String),
      eventType: EventType.values.firstWhere((e) => e.val == map['event_type']),
      categoryType:
          CategoryType.values.firstWhere((e) => e.val == map['category_type']),
      union: Union.allUnions[map['union_id']]!,
      minAge: map['min_age'] as int,
      maxAge: map['max_age'] as int,
      address: map['address'] as String,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
    );
  }

  factory Event.fromJson(String source) =>
      Event.fromMap(json.decode(source) as Map<String, dynamic>);
}
