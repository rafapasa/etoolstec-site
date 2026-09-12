import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/asset_paths.dart';
import '../../core/theme/app_colors.dart';

class SiteScaffold extends StatelessWidget {
  const SiteScaffold({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final compact = width < 980;
    return Scaffold(
      backgroundColor: AppColors.canvas,
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
      color: Colors.white,
      child: SizedBox(
        height: 160,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned.fill(
              child: ColoredBox(
                color: Colors.white,
                child: Image.asset(
                  AssetPaths.header,
                  fit: BoxFit.contain,
                  alignment: Alignment.centerLeft,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),
            Positioned(
              right: compact ? 8 : 28,
              bottom: 14,
              left: compact ? 8 : null,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () => Scaffold.of(context).openDrawer(),
                        icon: const Icon(Icons.menu_rounded, color: AppColors.brandBlue),
                      ),
                    ),
                ],
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => context.go('/'),
                  child: const SizedBox(width: 280, height: 160),
                ),
              ),
            ),
          ],
        ),
      ),
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
          color: AppColors.brandBlue,
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
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.white),
            child: Image.asset(AssetPaths.header, fit: BoxFit.contain),
          ),
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
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 28),
      child: Column(
        children: [
          Image.asset(
            AssetPaths.footerLogo,
            height: 64,
            fit: BoxFit.contain,
            filterQuality: FilterQuality.high,
          ),
          const SizedBox(height: 12),
          const Text(
            'Soluções inteligentes para sua empresa.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          Text(
            '© ${DateTime.now().year} eTools Tecnologia · www.etoolstec.com.br',
            textAlign: TextAlign.center,
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 36),
          child: child,
        ),
      ),
    );
  }
}

class OpenErpMark extends StatelessWidget {
  const OpenErpMark({super.key, this.height = 72});
  final double height;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetPaths.openerpLogo,
      height: height,
      fit: BoxFit.contain,
      filterQuality: FilterQuality.high,
    );
  }
}
