import 'dart:async';

import '../models/app_user.dart';

class AuthService {
  AppUser? _currentUser;

  final StreamController<AppUser?> _sessionController =
      StreamController<AppUser?>.broadcast();

  Stream<AppUser?> get sessionStream => _sessionController.stream;

  AppUser? get currentUser => _currentUser;

  // TODO: substituir por backend (Firebase/stack existente) mantendo login por usuario+senha.
  final Map<String, ({String senha, AppUser user})> _usersByUsuario = {
    'admin': (
      senha: '123456',
      user: const AppUser(
        id: 'u-admin',
        condoId: 'condo-1',
        usuario: 'admin',
        nome: 'Administrador',
        role: UserRole.admin,
      ),
    ),
    'sindico': (
      senha: '123456',
      user: const AppUser(
        id: 'u-sindico',
        condoId: 'condo-1',
        usuario: 'sindico',
        nome: 'Síndico',
        role: UserRole.sindico,
      ),
    ),
    'porteiro': (
      senha: '123456',
      user: const AppUser(
        id: 'u-porteiro',
        condoId: 'condo-1',
        usuario: 'porteiro',
        nome: 'Porteiro',
        role: UserRole.porteiro,
      ),
    ),
    'morador': (
      senha: '123456',
      user: const AppUser(
        id: 'u-morador',
        condoId: 'condo-1',
        usuario: 'morador',
        nome: 'Morador',
        role: UserRole.morador,
        unidadeId: 'bloco-a-101',
      ),
    ),
  };

  Future<AppUser> login({required String usuario, required String senha}) async {
    final credentials = _usersByUsuario[usuario.trim().toLowerCase()];
    if (credentials == null || credentials.senha != senha) {
      throw const AuthException('Usuário ou senha inválidos.');
    }

    _currentUser = credentials.user;
    _sessionController.add(_currentUser);
    return credentials.user;
  }

  Future<void> logout() async {
    _currentUser = null;
    _sessionController.add(null);
  }

  void dispose() {
    _sessionController.close();
  }
}

class AuthException implements Exception {
  const AuthException(this.message);
  final String message;
}
