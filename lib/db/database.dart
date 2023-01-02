import 'dart:developer';

import 'package:aula_flutter/models/usuario.dart';
import 'package:aula_flutter/models/lembretes.dart';

class Database {
  static final Database _singleton = Database._internal();

  Database._internal();

  factory Database() {
    return _singleton;
  }

  // Usuarios
  List<Usuario> usuarios = [
    Usuario(
      codigo: 1,
      nome: "Han Dong",
      email: "handong",
      senha: "chinesegoat",
    ),
    Usuario(
      codigo: 2,
      nome: "Kim Chung-ha",
      email: "chungha",
      senha: "ioi",
    ),
    Usuario(
      codigo: 3,
      nome: "Im Nayeon",
      email: "nayeon",
      senha: "pop",
    ),
    Usuario(
      codigo: 4,
      nome: "nome",
      email: "email",
      senha: "senha",
    ),
  ];

  // Lembretes
  List<Lembrete> lembretes = [
    Lembrete(codigo: 0, titulo: "Lembrete 1", descricao: "Lembrete 1"),
    Lembrete(codigo: 1, titulo: "Lembrete 2", descricao: "Lembrete 2"),
    Lembrete(codigo: 2, titulo: "Lembrete 3", descricao: "Lembrete 3"),
    Lembrete(codigo: 3, titulo: "Lembrete 4", descricao: "Lembrete 4"),
  ];

  // Adiconar Lembrete
  void addLembrete(Lembrete lembrete) {
    lembretes.add(lembrete);
  }

  // Remover Lembrete
  void removeLembrete(Lembrete lembrete) {
    lembretes.removeAt(lembrete.codigo);
  }

  // Validar Login
  Usuario? login(String email, String senha) {
    for (var usuario in usuarios) {
      if (usuario.email == email && usuario.senha == senha) {
        return usuario;
      }
    }

    return null;
  }

  // Verificar se titulo já existe
  bool verificarTitulo(String titulo) {
    for (var lembrete in lembretes) {
      if (lembrete.titulo.trim() == titulo) {
        return true;
      }
    }

    return false;
  }

  Usuario? usuarioLogado;
}
