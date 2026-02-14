import 'package:app_de_entrega/services/auth_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuthService', () {
    test('realiza login por usuario e senha válidos', () async {
      final auth = AuthService();

      final user = await auth.login(usuario: 'porteiro', senha: '123456');

      expect(user.usuario, 'porteiro');
      expect(auth.currentUser, isNotNull);
    });

    test('falha login com senha inválida', () async {
      final auth = AuthService();

      expect(
        () => auth.login(usuario: 'porteiro', senha: 'errada'),
        throwsA(isA<AuthException>()),
      );
    });
  });
}
