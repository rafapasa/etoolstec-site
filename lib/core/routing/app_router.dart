import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../features/auth/login_page.dart';
import '../../features/auth/register_page.dart';
import '../../features/company/company_page.dart';
import '../../features/home/home_page.dart';
import '../../features/openerp_whatsapp/conversation_commerce_page.dart';
import '../../features/products/products_page.dart';
import '../../features/restricted/restricted_page.dart';
import '../../features/support/support_page.dart';
import '../../shared/widgets/site_scaffold.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) => SiteScaffold(child: child),
      routes: [
        GoRoute(path: '/', builder: (_, __) => const HomePage()),
        GoRoute(path: '/empresa', builder: (_, __) => const CompanyPage()),
        GoRoute(path: '/solucoes', builder: (_, __) => const ProductsPage()),
        GoRoute(path: '/conversation-commerce', builder: (_, __) => const ConversationCommercePage()),
        GoRoute(path: '/entrar', builder: (_, __) => const LoginPage()),
        GoRoute(path: '/criar-conta', builder: (_, __) => const RegisterPage()),
        GoRoute(path: '/suporte', builder: (_, __) => const SupportPage()),
        GoRoute(path: '/area-restrita', builder: (_, __) => const RestrictedPage()),
      ],
    ),
  ],
  errorBuilder: (context, state) => const SiteScaffold(
    child: PageShell(child: Text('Página não encontrada')),
  ),
);
