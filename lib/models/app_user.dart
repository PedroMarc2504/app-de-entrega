enum UserRole { admin, sindico, porteiro, morador }

class AppUser {
  const AppUser({
    required this.id,
    required this.condoId,
    required this.usuario,
    required this.nome,
    required this.role,
    this.unidadeId,
    this.ativo = true,
  });

  final String id;
  final String condoId;
  final String usuario;
  final String nome;
  final UserRole role;
  final String? unidadeId;
  final bool ativo;
}
