import 'package:flutter/material.dart';

import '../models/app_user.dart';
import '../services/auth_service.dart';

class HomeRouterScreen extends StatelessWidget {
  const HomeRouterScreen({
    super.key,
    required this.user,
    required this.authService,
  });

  final AppUser user;
  final AuthService authService;

  @override
  Widget build(BuildContext context) {
    return switch (user.role) {
      UserRole.admin => _RoleHomeScaffold(
          title: 'Home Admin',
          subtitle: 'Gestão de condomínios, usuários, unidades e síndico.',
          actions: const [
            'Criar/gerenciar condomínios',
            'CRUD de usuários e unidades',
            'Cadastrar síndico (obrigatório admin)',
            'Relatórios e estatísticas',
          ],
          user: user,
          authService: authService,
        ),
      UserRole.sindico => _RoleHomeScaffold(
          title: 'Home Síndico',
          subtitle: 'Visão gerencial do condomínio.',
          actions: const [
            'Relatórios por período/status/unidade',
            'Histórico de entregas',
            'Configurações permitidas do condomínio',
          ],
          user: user,
          authService: authService,
        ),
      UserRole.porteiro => _RoleHomeScaffold(
          title: 'Home Porteiro',
          subtitle: 'Operação diária da portaria.',
          actions: const [
            'Nova entrega',
            'Pendências por unidade/morador',
            'Atualizar status (Recebida/Notificada/Retirada/Devolvida)',
          ],
          user: user,
          authService: authService,
        ),
      UserRole.morador => _RoleHomeScaffold(
          title: 'Home Morador',
          subtitle: 'Acompanhamento das entregas da sua unidade.',
          actions: const [
            'Minhas entregas pendentes e histórico',
            'Confirmação de retirada no app',
            'Avisos/notificações de nova entrega',
          ],
          user: user,
          authService: authService,
        ),
    };
  }
}

class _RoleHomeScaffold extends StatelessWidget {
  const _RoleHomeScaffold({
    required this.title,
    required this.subtitle,
    required this.actions,
    required this.user,
    required this.authService,
  });

  final String title;
  final String subtitle;
  final List<String> actions;
  final AppUser user;
  final AuthService authService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            onPressed: () => authService.logout(),
            icon: const Icon(Icons.logout),
            tooltip: 'Sair',
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Text('Olá, ${user.nome}', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 8),
          Text('Condomínio: ${user.condoId}'),
          Text('Usuário: ${user.usuario}'),
          Text('Perfil: ${user.role.name}'),
          if (user.unidadeId != null) Text('Unidade: ${user.unidadeId}'),
          const SizedBox(height: 20),
          Text(subtitle),
          const SizedBox(height: 12),
          ...actions.map(
            (item) => ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.check_circle_outline),
              title: Text(item),
            ),
          ),
        ],
      ),
    );
  }
}
