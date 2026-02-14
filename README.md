# App de Entregas em Condomínios

## Diagnóstico rápido do repositório

No estado inicial deste repositório havia apenas `.gitkeep`, sem estrutura Flutter prévia, sem código de autenticação, sem integração Firebase e sem coleções/modelos já implementados.

### O que já existe
- Repositório Git inicializado.

### O que faltava para o MVP
- Estrutura base Flutter.
- Login por **usuário + senha** (sem e-mail).
- Definição de perfis (`admin`, `sindico`, `porteiro`, `morador`).
- Navegação/home por perfil.
- Entidades de negócio para condomínio/unidade/entrega.
- Fluxos de entrega (cadastro/lista/status).
- Gestão administrativa (usuários/unidades/condomínio e cadastro de síndico por admin).
- Relatórios para síndico/admin.
- Regras de segurança de isolamento por condomínio.

## Plano de implementação (MVP em etapas)

- [x] **Etapa A**: autenticação por usuário/senha (sem e-mail).
- [x] **Etapa B**: roles e navegação por perfil.
- [ ] **Etapa C**: cadastro de entrega + listagens.
- [ ] **Etapa D**: gestão admin + cadastro do síndico pelos admins.
- [ ] **Etapa E**: regras de segurança + refinamentos + backend persistente.

## Status desta entrega

Implementado neste commit:
1. Estrutura inicial Flutter.
2. Serviço de autenticação local de referência com login por usuário/senha.
3. Sessão com stream e logout.
4. Home roteada por perfil com escopos de responsabilidade por role.

> Observação: neste primeiro passo o repositório ainda está em modo local/mock para autenticação. A próxima etapa é conectar a stack real existente (ex.: Firebase/Firestore) sem alterar a regra de login por usuário/senha.
