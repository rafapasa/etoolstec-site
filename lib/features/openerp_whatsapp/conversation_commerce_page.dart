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
          const OpenErpMark(height: 88),
          const SizedBox(height: 16),
          const Text('PRODUTO EM DESTAQUE', style: TextStyle(color: AppColors.brandGreen, fontWeight: FontWeight.w800, letterSpacing: 1.2)),
          const SizedBox(height: 8),
          const Text('OpenERP-WhatsApp', style: TextStyle(fontSize: 36, fontWeight: FontWeight.w800, color: AppColors.brandBlue)),
          const Text('Conversation Commerce · Vendedor 24 horas', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: AppColors.ink)),
          const SizedBox(height: 16),
          const Text(
            'Transforme o WhatsApp no canal oficial de vendas e atendimento da sua empresa. '
            'Com o OpenERP por trás da conversa, cada mensagem pode virar pedido, consulta de estoque, '
            'cobrança ou pós-venda — sem retrabalho e sem depender do horário comercial.',
            style: TextStyle(fontSize: 17, height: 1.55, color: AppColors.muted),
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [AppColors.brandBlue.withOpacity(0.08), AppColors.brandGreen.withOpacity(0.08)]),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.line),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Potencial de vendas', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: AppColors.brandBlue)),
                SizedBox(height: 8),
                Text(
                  'Um vendedor que não dorme: responde no primeiro contato, apresenta catálogo atualizado, '
                  'fecha pedido e registra tudo no ERP. Sua equipe humana foca no que exige relacionamento; '
                  'a operação escala com autonomia e independência do plantão manual.',
                  style: TextStyle(fontSize: 16, height: 1.5, color: AppColors.muted),
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: const [
              _Feature(Icons.storefront_rounded, 'Vendedor 24h', 'Atende, tira dúvida e registra interesse a qualquer hora — inclusive fora do expediente.'),
              _Feature(Icons.shopping_cart_checkout_rounded, 'Pedido no chat', 'O pedido nasce na conversa e cai no OpenERP com estoque e preço reais.'),
              _Feature(Icons.bolt_rounded, 'Autonomia operacional', 'Menos “deixa eu ver e te retorno”: o fluxo segue sozinho quando a regra de negócio permite.'),
              _Feature(Icons.handshake_outlined, 'Independência do plantão', 'Reduz dependência de plantão e sobrecarga da equipe em picos de demanda.'),
              _Feature(Icons.inventory_2_outlined, 'Catálogo vivo', 'Produtos e preços atualizados direto do ERP, sem planilha paralela.'),
              _Feature(Icons.history_rounded, 'Contexto do cliente', 'Histórico, crédito e status no mesmo fluxo da conversa.'),
            ],
          ),
          const SizedBox(height: 36),
          const Text('ASSISTENTE VIRTUAL PARA SUA EMPRESA', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: AppColors.brandGreen, letterSpacing: 0.6)),
          const SizedBox(height: 10),
          const Text(
            'Além das vendas, a eTools personaliza a IA para o dia a dia da gestão. '
            'O gestor usa o próprio WhatsApp como assistente corporativo 24 horas, totalmente integrado à empresa.',
            style: TextStyle(fontSize: 16, height: 1.5, color: AppColors.muted),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: const [
              _Chip('Solicitar relatórios'),
              _Chip('Aprovar orçamentos'),
              _Chip('Autorizar pagamentos e compras'),
              _Chip('Agendar reuniões'),
              _Chip('Enviar e-mails'),
              _Chip('Consultar status operacional'),
              _Chip('Acionar fluxos do ERP'),
              _Chip('Assistente 24h no WhatsApp'),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Nicho: assistente virtual empresarial sob medida. A eTools configura a inteligência, as permissões e as integrações '
            'para o seu processo — para que a conversa no WhatsApp vire ação real no sistema da empresa.',
            style: TextStyle(fontSize: 15, height: 1.5, color: AppColors.muted),
          ),
          const SizedBox(height: 32),
          const Text('Fluxo simplificado', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: AppColors.brandBlue)),
          const SizedBox(height: 12),
          const _FlowRow(steps: [
            'Cliente ou gestor\nno WhatsApp',
            'IA + regras\nda empresa',
            'OpenERP\nexecuta',
            'Resposta e\nregistro',
          ]),
          const SizedBox(height: 32),
          FilledButton(
            onPressed: () => context.go('/criar-conta'),
            child: const Text('Quero vender e operar pelo WhatsApp'),
          ),
        ],
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip(this.label);
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.brandGreen.withOpacity(0.35)),
      ),
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.w600, color: AppColors.ink, fontSize: 13)),
    );
  }
}

class _FlowRow extends StatelessWidget {
  const _FlowRow({required this.steps});
  final List<String> steps;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (var i = 0; i < steps.length; i++) ...[
          Container(
            width: 140,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.line),
            ),
            child: Text(steps[i], textAlign: TextAlign.center, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, height: 1.3)),
          ),
          if (i < steps.length - 1) const Icon(Icons.arrow_forward_rounded, color: AppColors.brandGreen, size: 20),
        ],
      ],
    );
  }
}

class _Feature extends StatelessWidget {
  const _Feature(this.icon, this.title, this.body);
  final IconData icon;
  final String title;
  final String body;
  @override
  Widget build(BuildContext context) {
    // Icons.handshake_outlined may not exist - use verified icons only
    final resolved = icon == Icons.handshake_outlined ? Icons.handshake_outlined : icon;
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
            Icon(resolved, color: AppColors.brandGreen, size: 28),
            const SizedBox(height: 10),
            Text(title, style: const TextStyle(fontWeight: FontWeight.w800, color: AppColors.brandBlue)),
            const SizedBox(height: 6),
            Text(body, style: const TextStyle(color: AppColors.muted, height: 1.4)),
          ],
        ),
      ),
    );
  }
}
