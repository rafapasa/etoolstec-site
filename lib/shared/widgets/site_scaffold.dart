import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';

class SiteScaffold extends StatelessWidget {
  const SiteScaffold({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final compact = width < 980;
    return Scaffold(
      drawer: compact ? const _NavDrawer() : null,
      body: Column(
        children: [
          _TopBar(compact: compact),
          Expanded(
            child: SelectionArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    child,
                    const _Footer(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar({required this.compact});
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surface,
      elevation: 0,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.line)),
        ),
        padding: EdgeInsets.symmetric(horizontal: compact ? 16 : 40, vertical: 12),
        child: Row(
          children: [
            InkWell(
              onTap: () => context.go('/'),
              child: const _BrandMark(),
            ),
            const Spacer(),
            if (!compact) ...[
              _NavLink('Início', '/'),
              _NavLink('Empresa', '/empresa'),
              _NavLink('Soluções', '/solucoes'),
              _NavLink('Conversation Commerce', '/conversation-commerce'),
              _NavLink('Suporte', '/suporte'),
              const SizedBox(width: 12),
              OutlinedButton(
                onPressed: () => context.go('/entrar'),
                child: const Text('Área restrita'),
              ),
              const SizedBox(width: 8),
              FilledButton(
                style: FilledButton.styleFrom(backgroundColor: AppColors.brandGreen),
                onPressed: () => context.go('/criar-conta'),
                child: const Text('Criar conta'),
              ),
            ] else
              IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: const Icon(Icons.menu_rounded),
              ),
          ],
        ),
      ),
    );
  }
}

class _BrandMark extends StatelessWidget {
  const _BrandMark();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.brandGreen, AppColors.brandBlue],
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: const Text('e', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 20)),
        ),
        const SizedBox(width: 10),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('eTools', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18, color: AppColors.brandBlue, height: 1)),
            Text('TECNOLOGIA', style: TextStyle(letterSpacing: 2.2, fontSize: 10, color: AppColors.brandGray, fontWeight: FontWeight.w600)),
          ],
        ),
      ],
    );
  }
}

class _NavLink extends StatelessWidget {
  const _NavLink(this.label, this.path);
  final String label;
  final String path;
  @override
  Widget build(BuildContext context) {
    final loc = GoRouterState.of(context).uri.path;
    final active = loc == path;
    return TextButton(
      onPressed: () => context.go(path),
      child: Text(
        label,
        style: TextStyle(
          fontWeight: active ? FontWeight.w800 : FontWeight.w600,
          color: active ? AppColors.brandBlue : AppColors.muted,
        ),
      ),
    );
  }
}

class _NavDrawer extends StatelessWidget {
  const _NavDrawer();
  @override
  Widget build(BuildContext context) {
    Widget item(String t, String p) => ListTile(
          title: Text(t),
          onTap: () {
            Navigator.pop(context);
            context.go(p);
          },
        );
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(child: _BrandMark()),
          item('Início', '/'),
          item('Empresa', '/empresa'),
          item('Soluções', '/solucoes'),
          item('Conversation Commerce', '/conversation-commerce'),
          item('Suporte', '/suporte'),
          item('Área restrita', '/entrar'),
          item('Criar conta', '/criar-conta'),
        ],
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.brandBlue,
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
      child: Column(
        children: [
          const Text(
            'Soluções inteligentes para sua empresa.',
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 10),
          Text(
            '© ${DateTime.now().year} eTools Tecnologia · www.etoolstec.com.br',
            style: TextStyle(color: Colors.white.withValues(alpha: 0.8)),
          ),
        ],
      ),
    );
  }
}

class PageShell extends StatelessWidget {
  const PageShell({super.key, required this.child, this.maxWidth = 1120});
  final Widget child;
  final double maxWidth;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 36), child: child),
      ),
    );
  }
}
