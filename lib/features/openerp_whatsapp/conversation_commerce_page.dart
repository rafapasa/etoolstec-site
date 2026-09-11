import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../shared/widgets/site_scaffold.dart';

class ConversationCommercePage extends StatelessWidget {
  const ConversationCommercePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('PRODUTO EM DESTAQUE', style: TextStyle(color: AppColors.brandGreen, fontWeight: FontWeight.w800, letterSpacing: 1.2)),
          const SizedBox(height: 8),
          const Text('OpenERP-WhatsApp', style: TextStyle(fontSize: 36, fontWeight: FontWeight.w800, color: AppColors.brandBlue)),
          const Text('Conversation Commerce', style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700, color: AppColors.ink)),
          const SizedBox(height: 16),
          const Text(
            'Transforme o WhatsApp no canal oficial de vendas e atendimento, com o OpenERP por trás da conversa: catálogo, pedido, estoque, financeiro e histórico do cliente no mesmo fluxo.',
            style: TextStyle(fontSize: 17, height: 1.5, color: AppColors.muted),
          ),
          const SizedBox(height: 28),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: const [
              _Feature('Catálogo na conversa', 'Produtos e preços atualizados direto do ERP.'),
              _Feature('Pedido sem retrabalho', 'O pedido nasce no chat e cai no OpenERP.'),
              _Feature('Atendimento com contexto', 'Histórico, crédito e status em um só lugar.'),
              _Feature('Jornada omnichannel', 'Do primeiro “oi” à nota e à entrega.'),
            ],
          ),
          const SizedBox(height: 32),
          FilledButton(
            onPressed: () => context.go('/criar-conta'),
            child: const Text('Solicitar acesso / criar conta'),
          ),
        ],
      ),
    );
  }
}

class _Feature extends StatelessWidget {
  const _Feature(this.title, this.body);
  final String title;
  final String body;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.line),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.w800, color: AppColors.brandBlue)),
            const SizedBox(height: 6),
            Text(body, style: const TextStyle(color: AppColors.muted, height: 1.4)),
          ],
        ),
      ),
    );
  }
}
