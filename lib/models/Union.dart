import 'dart:convert';

class Union {
  final String id;
  final String name;
  final String shortName;

  Union({
    required this.id,
    required this.name,
    required this.shortName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'short_name': shortName,
    };
  }

  factory Union.fromMap(Map<String, dynamic> map) {
    return Union(
      id: map['id'] as String,
      name: map['name'] as String,
      shortName: map['short_name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Union.fromJson(String source) =>
      Union.fromMap(json.decode(source) as Map<String, dynamic>);
}
