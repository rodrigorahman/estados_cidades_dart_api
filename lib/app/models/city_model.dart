import 'dart:convert';

class CityModel {
  final String name;
  final String ibge;
  CityModel({
    required this.name,
    required this.ibge,
  });

  Map<String, dynamic> toMap() {
    return {
      'nome': name,
      'codigo_ibge': ibge,
    };
  }

  factory CityModel.fromMap(Map<String, dynamic> map) {
    return switch (map) {
      {
        'nome': final String name,
        'codigo_ibge': final String ibge,
      } =>
        CityModel(name: name, ibge: ibge),
      _ => throw ArgumentError('Invalid Json')
    };
  }

  String toJson() => json.encode(toMap());

  factory CityModel.fromJson(String source) =>
      CityModel.fromMap(json.decode(source));
}
