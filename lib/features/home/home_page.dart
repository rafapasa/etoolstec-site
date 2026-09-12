import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../shared/widgets/site_scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width > 860;
    return PageShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flex(
            direction: wide ? Axis.horizontal : Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: wide ? 6 : 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('eTools Tecnologia', style: TextStyle(color: AppColors.brandGreen, fontWeight: FontWeight.w800)),
                    const SizedBox(height: 10),
                    const Text(
                      'Soluções inteligentes\npara sua empresa.',
                      style: TextStyle(fontSize: 42, fontWeight: FontWeight.w800, height: 1.1, color: AppColors.brandBlue),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Inovação, qualidade e agilidade em tecnologia. Do ERP à conversa comercial no WhatsApp.',
                      style: TextStyle(fontSize: 17, color: AppColors.muted, height: 1.5),
                    ),
                    const SizedBox(height: 24),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        FilledButton(
                          onPressed: () => context.go('/conversation-commerce'),
                          child: const Text('OpenERP + WhatsApp'),
                        ),
                        OutlinedButton(
                          onPressed: () => context.go('/criar-conta'),
                          child: const Text('Criar conta'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (wide) const SizedBox(width: 24),
              Expanded(
                flex: wide ? 5 : 0,
                child: Container(
                  margin: EdgeInsets.only(top: wide ? 0 : 28),
                  padding: const EdgeInsets.all(28),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.line),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OpenErpMark(height: 64),
                      SizedBox(height: 16),
                      Text('DESTAQUE', style: TextStyle(color: AppColors.brandGreen, letterSpacing: 1.6, fontWeight: FontWeight.w800)),
                      SizedBox(height: 10),
                      Text('OpenERP-WhatsApp', style: TextStyle(color: AppColors.brandBlue, fontSize: 28, fontWeight: FontWeight.w800)),
                      Text('Conversation Commerce', style: TextStyle(color: AppColors.ink, fontSize: 20)),
                      SizedBox(height: 14),
                      Text(
                        'Venda, atenda e integre o ERP no mesmo fluxo de conversa. Pedidos, catálogo e relacionamento no WhatsApp.',
                        style: TextStyle(color: AppColors.muted, height: 1.45),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 48),
          const Text('O que entregamos', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800)),
          const SizedBox(height: 16),
          LayoutBuilder(
            builder: (context, constraints) {
              final stacked = constraints.maxWidth < 800;
              final cards = const [
                _Card(title: 'OpenERP', body: 'Gestão integrada de processos, financeiro, estoque e operação.', showLogo: true),
                _Card(title: 'Conversation Commerce', body: 'Comércio conversacional no WhatsApp ligado ao ERP.', showLogo: true),
                _Card(title: 'Suporte e área restrita', body: 'Conta, documentos e atendimento para clientes.'),
              ];
              if (stacked) {
                return Column(
                  children: [
                    for (var i = 0; i < cards.length; i++) ...[
                      SizedBox(height: 220, width: double.infinity, child: cards[i]),
                      if (i != cards.length - 1) const SizedBox(height: 16),
                    ],
                  ],
                );
              }
              return SizedBox(
                height: 240,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (var i = 0; i < cards.length; i++) ...[
                      Expanded(child: cards[i]),
                      if (i != cards.length - 1) const SizedBox(width: 16),
                    ],
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({required this.title, required this.body, this.showLogo = false});
  final String title;
  final String body;
  final bool showLogo;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      color: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: AppColors.line),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showLogo) ...[
              const OpenErpMark(height: 48),
              const SizedBox(height: 12),
            ] else
              const SizedBox(height: 60),
            Text(title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 18, color: AppColors.brandBlue)),
            const SizedBox(height: 8),
            Expanded(
              child: Text(body, style: const TextStyle(color: AppColors.muted, height: 1.4)),
            ),
          ],
        ),
      ),
    );
  }
}
