import 'package:flutter/material.dart';

import 'screens/home_router_screen.dart';
import 'screens/login_screen.dart';
import 'services/auth_service.dart';

class EntregaApp extends StatefulWidget {
  const EntregaApp({super.key});

  @override
  State<EntregaApp> createState() => _EntregaAppState();
}

class _EntregaAppState extends State<EntregaApp> {
  final AuthService _authService = AuthService();

  @override
  void dispose() {
    _authService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Entregas',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      home: StreamBuilder(
        stream: _authService.sessionStream,
        initialData: _authService.currentUser,
        builder: (context, snapshot) {
          final currentUser = snapshot.data;
          if (currentUser == null) {
            return LoginScreen(authService: _authService);
          }

          return HomeRouterScreen(
            user: currentUser,
            authService: _authService,
          );
        },
      ),
    );
  }
}
