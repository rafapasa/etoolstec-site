import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../shared/widgets/site_scaffold.dart';

/// Página comercial do eToolsCode.
class EtoolsCodePage extends StatelessWidget {
  const EtoolsCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppColors.brandGreen.withOpacity(0.12),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'ENGENHARIA DE SOFTWARE · IA APLICADA',
              style: TextStyle(color: AppColors.brandGreen, fontWeight: FontWeight.w800, letterSpacing: 1.1, fontSize: 12),
            ),
          ),
          const SizedBox(height: 14),
          const Text('</> eToolsCode', style: TextStyle(fontSize: 36, fontWeight: FontWeight.w800, color: AppColors.brandBlue)),
          const SizedBox(height: 8),
          const Text(
            'O copiloto de engenharia que respeita a arquitetura do seu time.',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: AppColors.ink, height: 1.3),
          ),
          const SizedBox(height: 16),
          const Text(
            'O eToolsCode não é só um chat que gera código. É uma ferramenta pensada para times que precisam '
            'de velocidade com controle: roda na sua infraestrutura, opera sobre o repositório local e executa '
            'tarefas com regras do projeto — por conversa ou por issues em JSON auditáveis.',
            style: TextStyle(fontSize: 17, height: 1.55, color: AppColors.muted),
          ),
          const SizedBox(height: 28),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: const [
              _Feature(
                'Issues com contrato',
                'Cada tarefa define demanda, arquivos permitidos, regras e branch. Menos surpresa, mais previsibilidade.',
              ),
              _Feature(
                'Chat com contexto real',
                'A LLM lê o código local, aplica padrões do base.json e registra leituras e escritas no log da operação.',
              ),
              _Feature(
                'Diff e Fontes na mesma UI',
                'Veja o que mudou, abra o arquivo com highlight e acompanhe o git status sem sair do fluxo.',
              ),
              _Feature(
                'Seu código, sua máquina',
                'Binário local ou servidor do time. Ideal para ambientes em que o repositório não pode “ir para a nuvem genérica”.',
              ),
              _Feature(
                'Padrões do time embutidos',
                'base.json e projeto.json orientam a IA: apperror, mapper, camadas, o que pode e o que não pode.',
              ),
              _Feature(
                'Pronto para evoluir em TDD',
                'Caminho natural para scaffolds de interface + testes: o engenheiro define o contrato; o time implementa com critério.',
              ),
            ],
          ),
          const SizedBox(height: 36),
          const Text('Para quem é', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: AppColors.brandBlue)),
          const SizedBox(height: 12),
          const Text(
            'Times de produto e ERP que precisam acelerar entrega sem abrir mão de revisão, padrão de código e rastreabilidade. '
            'Do júnior supervisionado ao sênior que automatiza refactors cirúrgicos em issues repetíveis.',
            style: TextStyle(fontSize: 16, height: 1.5, color: AppColors.muted),
          ),
          const SizedBox(height: 28),
          const Text('Como encaixa na eTools', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: AppColors.brandBlue)),
          const SizedBox(height: 12),
          const Text(
            'Nasce da prática real de evolução de sistemas como o ecossistema OpenERP/WhatsApp da eTools: '
            'muitas mudanças pequenas, regras de arquitetura fortes e necessidade de histórico do que a IA fez. '
            'O eToolsCode transforma isso em produto — para uso interno e para clientes que querem o mesmo nível de disciplina.',
            style: TextStyle(fontSize: 16, height: 1.5, color: AppColors.muted),
          ),
          const SizedBox(height: 32),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              FilledButton(
                onPressed: () => context.go('/criar-conta'),
                child: const Text('Falar com a eTools'),
              ),
              OutlinedButton(
                onPressed: () => context.go('/suporte'),
                child: const Text('Suporte'),
              ),
              TextButton(
                onPressed: () => context.go('/solucoes'),
                child: const Text('Voltar às soluções'),
              ),
            ],
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
