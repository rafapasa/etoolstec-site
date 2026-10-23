import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../shared/widgets/site_scaffold.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Soluções', style: TextStyle(fontSize: 34, fontWeight: FontWeight.w800, color: AppColors.brandBlue)),
          const SizedBox(height: 8),
          const Text(
            'Do WhatsApp operacional ao copiloto de engenharia de software — tecnologia eTools para o negócio e para o time técnico.',
            style: TextStyle(color: AppColors.muted, height: 1.45),
          ),
          const SizedBox(height: 28),
          _SolutionTile(
            leading: const OpenErpMark(height: 48),
            title: 'OpenERP-WhatsApp',
            subtitle:
                'Vendedor 24h, pedidos no chat e assistente virtual empresarial no WhatsApp — integrado ao ERP, com autonomia e escala de atendimento.',
            onTap: () => context.go('/conversation-commerce'),
          ),
          const Divider(height: 32),
          _SolutionTile(
            leading: Container(
              width: 48,
              height: 48,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.brandBlue.withOpacity(0.08),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.line),
              ),
              child: const Text('</>', style: TextStyle(fontWeight: FontWeight.w900, color: AppColors.brandBlue, fontSize: 16)),
            ),
            title: '</> eToolsCode',
            subtitle:
                'Assistente de engenharia multi-linguagem: issues, chat, Diff, TDD e LLMs (DeepSeek, Grok, OpenAI, Claude, Gemini…). Plano de arquitetura e scaffold com as regras do seu time.',
            onTap: () => context.go('/etoolscode'),
          ),
          const Divider(height: 32),
          const ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text('Consultoria e implantação', style: TextStyle(fontWeight: FontWeight.w800)),
            subtitle: Text('Diagnóstico, customização e acompanhamento contínuo.'),
          ),
        ],
      ),
    );
  }
}

class _SolutionTile extends StatelessWidget {
  const _SolutionTile({required this.leading, required this.title, required this.subtitle, required this.onTap});
  final Widget leading;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            leading,
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 18, color: AppColors.ink)),
                  const SizedBox(height: 6),
                  Text(subtitle, style: const TextStyle(color: AppColors.muted, height: 1.45)),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_rounded, color: AppColors.brandBlue),
          ],
        ),
      ),
    );
  }
}
