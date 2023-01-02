class Usuario {
  Usuario({
    required this.codigo,
    required this.nome,
    required this.email,
    required this.senha,
  });

  final int codigo;
  final String nome;
  String email;
  String senha;
}
