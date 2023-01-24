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

  static Map<String, Union> allUnions = {
    '3fa85f64-5717-4562-b3fc-2c963f66afa6': Union(
        id: '3fa85f64-5717-4562-b3fc-2c963f66afa6',
        name: 'Северо-Западное объединение',
        shortName: 'СЗО'),
    '4fa85f64-5717-4562-b3fc-2c963f66afa6': Union(
        id: '4fa85f64-5717-4562-b3fc-2c963f66afa6',
        name: 'Центральное объединение',
        shortName: 'ЦО'),
    '5fa85f64-5717-4562-b3fc-2c963f66afa6': Union(
        id: '5fa85f64-5717-4562-b3fc-2c963f66afa6',
        name: 'Московское объединение',
        shortName: 'МО'),
    '6fa85f64-5717-4562-b3fc-2c963f66afa6': Union(
        id: '6fa85f64-5717-4562-b3fc-2c963f66afa6',
        name: 'Волго-Вятское объединение',
        shortName: 'ВВО'),
    '7fa85f64-5717-4562-b3fc-2c963f66afa6': Union(
        id: '7fa85f64-5717-4562-b3fc-2c963f66afa6',
        name: 'Волжское объединение',
        shortName: 'ВО'),
    '8fa85f64-5717-4562-b3fc-2c963f66afa6': Union(
        id: '8fa85f64-5717-4562-b3fc-2c963f66afa6',
        name: 'Уральское объединение',
        shortName: 'УО'),
    '9fa85f64-5717-4562-b3fc-2c963f66afa6': Union(
        id: '9fa85f64-5717-4562-b3fc-2c963f66afa6',
        name: 'Южное объединение',
        shortName: 'ЮО'),
    '33a85f64-5717-4562-b3fc-2c963f66afa6': Union(
        id: '33a85f64-5717-4562-b3fc-2c963f66afa6',
        name: 'Кубанско-Черноморское объединение',
        shortName: 'КЧО'),
    '34a85f64-5717-4562-b3fc-2c963f66afa6': Union(
        id: '34a85f64-5717-4562-b3fc-2c963f66afa6',
        name: 'Ростово-Калмыцкое объединение',
        shortName: 'РКО'),
  };
}
