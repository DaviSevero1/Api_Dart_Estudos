import 'dart:convert';

import 'cursos.dart';
import 'endereco.dart';

class Aluno {
  int id;
  String nome;
  int? idade;
  List<String> nomeCursos;
  List<Curso> cursos;
  Endereco endereco;

  Aluno(
      {required this.id,
      required this.nome,
      this.idade,
      required this.cursos,
      required this.nomeCursos,
      required this.endereco,
      });

  Map<String, dynamic> toMap(){
    final map = <String,dynamic>{
      'id' : id,
      'nome' : nome,
      'idade' : idade,
      'nomeCursos' : nomeCursos,
      'cursos' : cursos.map((curso) => curso.toMap()).toList(),
      'endereco' : endereco.toMap(),
      
    };

    if( idade != null){
      map['idade'] = idade;
    }

    return map;

  }

  String toJson() => jsonEncode(toMap());

  factory Aluno.fromMap(Map<String, dynamic> map){
    return Aluno(
      id: map['id'] ?? 0,
      nome: map['nome'] ?? '',
      nomeCursos: List<String>.from(map['nomeCursos']),
      endereco: Endereco.fromMap(map['enedereco']),
      cursos: map['cursos'] 
              ?.map<Curso>((cursoMap) => Curso.fromMap(cursoMap))
              .toList() ??
            <Curso>[],
    );
  }

  factory Aluno.fromJson(String json) => Aluno.fromMap(jsonDecode(json));
  
}