import 'dart:convert';

class StateModel {
  final String acronym;
  final String name;

  StateModel({
    required this.acronym,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'sigla': acronym,
      'nome': name,
    };
  }

  factory StateModel.fromMap(Map<String, dynamic> map) {
    return switch (map) {
      {'sigla': final String sigla, 'nome': final String nome} => StateModel(
          acronym: sigla,
          name: nome,
        ),
      _ => throw ArgumentError('Inválid Json')
    };
  }

  String toJson() => json.encode(toMap());

  factory StateModel.fromJson(String source) =>
      StateModel.fromMap(json.decode(source));
}
