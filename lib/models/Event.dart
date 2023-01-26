// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:naslet/models/EventState.dart';

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
  final double price;
  final String address;
  final double latitude;
  final double longitude;
  final EventState? state;

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
    required this.price,
    required this.address,
    required this.latitude,
    required this.longitude,
    this.state,
  });

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      id: map['event']['id'] as String,
      name: map['event']['name'] as String,
      description: map['event']['description'] as String,
      shortDescription: map['event']['short_description'] as String,
      logoVariant: map['event']['logo_variant'] as String,
      city: map['event']['city'] as String,
      regEndDate: DateTime.parse(map['event']['reg_end_date'] as String),
      startDate: DateTime.parse(map['event']['start_date'] as String),
      endDate: DateTime.parse(map['event']['end_date'] as String),
      eventType: EventType.values
          .firstWhere((e) => e.val == map['event']['event_type']),
      categoryType: CategoryType.values
          .firstWhere((e) => e.val == map['event']['category_type']),
      union: Union.allUnions[map['event']['union_id']]!,
      minAge: map['event']['min_age'] as int,
      maxAge: map['event']['max_age'] as int,
      price: map['event']['price'] as double,
      address: map['event']['address'] as String,
      latitude: map['event']['latitude'] as double,
      longitude: map['event']['longitude'] as double,
      state: map['participation'] != null
          ? map['participation']['participation_stage'] != null
              ? EventState.values.firstWhere((element) =>
                  element.serverName ==
                  map['participation']['participation_stage'] as String)
              : null
          : null,
    );
  }

  factory Event.fromJson(String source) =>
      Event.fromMap(json.decode(source) as Map<String, dynamic>);
}
