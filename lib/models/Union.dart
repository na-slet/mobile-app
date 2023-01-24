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
    '85d00c15-a65c-4893-a7d9-b952d43cebcb': Union(
        id: '85d00c15-a65c-4893-a7d9-b952d43cebcb',
        name: 'Северо-западное объединение',
        shortName: 'СЗО'),
    '926d4297-bd52-481b-afc8-82c04176e5e3': Union(
        id: '926d4297-bd52-481b-afc8-82c04176e5e3',
        name: 'Центральное объединение',
        shortName: 'ЦО'),
    '47987a2a-1302-464c-a720-1e9a4f16ab23': Union(
        id: '47987a2a-1302-464c-a720-1e9a4f16ab23',
        name: 'Московское объединение',
        shortName: 'МО'),
    '344d2bfc-ee13-41e2-b85d-6e7be9261f57': Union(
        id: '344d2bfc-ee13-41e2-b85d-6e7be9261f57',
        name: 'Волго-Вятское объединение',
        shortName: 'ВВО'),
    '4c311c84-085c-4b6f-ad76-bc736bf41fcb': Union(
        id: '4c311c84-085c-4b6f-ad76-bc736bf41fcb',
        name: 'Волжское объединение',
        shortName: 'ВО'),
    '2728d053-d7e3-4ec3-afa9-3e23091aa949': Union(
        id: '2728d053-d7e3-4ec3-afa9-3e23091aa949',
        name: 'Уральское объединение',
        shortName: 'УО'),
    '83a3006b-d4ca-4b22-9ea3-0b8f4363444b': Union(
        id: '83a3006b-d4ca-4b22-9ea3-0b8f4363444b',
        name: 'Южное объединение',
        shortName: 'ЮО'),
    '6e3bf29a-3091-4e1b-a7ab-a82181b742aa': Union(
        id: '6e3bf29a-3091-4e1b-a7ab-a82181b742aa',
        name: 'Кубанско-Черноморское объединение',
        shortName: 'КЧО'),
    '069dd1c3-277a-4af3-822f-4a8f5ede11b5': Union(
        id: '069dd1c3-277a-4af3-822f-4a8f5ede11b5',
        name: 'Ростово-Калмыцкое объединение',
        shortName: 'РКО'),
  };
}
