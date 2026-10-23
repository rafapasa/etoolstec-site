import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../shared/widgets/site_scaffold.dart';

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
            'O copiloto de engenharia que respeita a arquitetura, os testes e as regras do seu time.',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: AppColors.ink, height: 1.3),
          ),
          const SizedBox(height: 16),
          const Text(
            'O eToolsCode não é um chat genérico que “joga código na tela”. É uma plataforma de execução de engenharia: '
            'roda na sua infraestrutura, opera sobre o repositório local e executa tarefas com contrato — por conversa ou por issues em JSON. '
            'Suporta múltiplas linguagens (Go, TypeScript, Python, Dart/Flutter, Java e outras) porque o fluxo é orientado a arquivos, regras e testes — não a um único runtime.',
            style: TextStyle(fontSize: 17, height: 1.55, color: AppColors.muted),
          ),
          const SizedBox(height: 28),
          const Text('Por que isso muda o jogo', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: AppColors.brandBlue)),
          const SizedBox(height: 12),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: const [
              _Card(Icons.rule_folder_outlined, 'Issues com contrato', 'Demanda, arquivos permitidos, rules e branch. A IA não inventa escopo: executa o combinado.'),
              _Card(Icons.forum_outlined, 'Chat com tools reais', 'Lê, lista, edita com search_replace, roda comandos permitidos e registra tudo no log da operação.'),
              _Card(Icons.account_tree_outlined, 'Assistente de Engenharia', 'Escolha o estilo (camadas, hexagonal, DDD leve, monólito modular), revise o plano e gere scaffold TDD.'),
              _Card(Icons.science_outlined, 'TDD de verdade', 'Interfaces + testes vermelhos + stub. O time implementa com critério — júnior supervisionado ou automação assistida.'),
              _Card(Icons.hub_outlined, 'Multi-LLM', 'DeepSeek, Grok (xAI), OpenAI, Claude, Gemini e Meta — você escolhe o modelo e a key na Config.'),
              _Card(Icons.dns_outlined, 'Código na sua casa', 'Binário local ou servidor do time. Ideal quando o repositório não pode ir para um sandbox genérico na nuvem.'),
            ],
          ),
          const SizedBox(height: 36),
          const Text('Fluxo de trabalho', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: AppColors.brandBlue)),
          const SizedBox(height: 8),
          const Text('Do pedido à entrega com rastreabilidade.', style: TextStyle(color: AppColors.muted)),
          const SizedBox(height: 14),
          const _Flow([
            _FlowStep('1', 'Config', 'Pastas, projetos e API keys das LLMs'),
            _FlowStep('2', 'Plano', 'Assistente de Engenharia define estilo e contratos'),
            _FlowStep('3', 'Scaffold', 'Interfaces, testes e stubs no repositório'),
            _FlowStep('4', 'Issue / Chat', 'Implementação assistida com arquivos fechados'),
            _FlowStep('5', 'Diff + Teste', 'Review visual e gate de testes na UI'),
          ]),
          const SizedBox(height: 36),
          const Text('Casos de uso', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: AppColors.brandBlue)),
          const SizedBox(height: 12),
          const _UseCase(
            title: 'Refatoração cirúrgica em ERP',
            body: 'Extrair DTO, ajustar assinatura em 3 arquivos e manter comportamento. Issue com lista fechada + search_replace evita reescrever módulos inteiros.',
          ),
          const _UseCase(
            title: 'Onboarding de júnior com TDD',
            body: 'O sênior gera o plano e o scaffold. O júnior implementa até os testes passarem — aprende a arquitetura sem “colar” solução pronta da IA.',
          ),
          const _UseCase(
            title: 'Feature nova com estilo do time',
            body: 'Detecta se o repo é camadas ou hexagonal, propõe pastas e interfaces, cria branch e issue pronta para o runner executar.',
          ),
          const _UseCase(
            title: 'Homologação com Diff e Teste',
            body: 'Antes do merge, a aba Diff mostra o delta e a aba Teste dispara o comando de testes do projeto — critério objetivo de pronto.',
          ),
          const SizedBox(height: 28),
          const Text('LLMs suportadas', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: AppColors.brandBlue)),
          const SizedBox(height: 12),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: const [
              _Chip('DeepSeek'),
              _Chip('Grok · xAI'),
              _Chip('OpenAI'),
              _Chip('Claude · Anthropic'),
              _Chip('Gemini · Google'),
              _Chip('Meta · Llama'),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Troque de provedor sem mudar o fluxo de issues e chat. A disciplina fica no eToolsCode; a inteligência, no modelo que você escolher.',
            style: TextStyle(fontSize: 15, height: 1.45, color: AppColors.muted),
          ),
          const SizedBox(height: 32),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              FilledButton(
                onPressed: () => context.go('/criar-conta'),
                child: const Text('Falar com a eTools sobre o eToolsCode'),
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

class _Card extends StatelessWidget {
  const _Card(this.icon, this.title, this.body);
  final IconData icon;
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
            Icon(icon, color: AppColors.brandGreen, size: 28),
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

class _Chip extends StatelessWidget {
  const _Chip(this.label);
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.brandBlue.withOpacity(0.06),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.brandBlue.withOpacity(0.2)),
      ),
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.w700, color: AppColors.brandBlue, fontSize: 13)),
    );
  }
}

class _FlowStep {
  const _FlowStep(this.n, this.title, this.body);
  final String n;
  final String title;
  final String body;
}

class _Flow extends StatelessWidget {
  const _Flow(this.steps);
  final List<_FlowStep> steps;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 10,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        for (var i = 0; i < steps.length; i++) ...[
          Container(
            width: 150,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.line),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 14,
                  backgroundColor: AppColors.brandGreen,
                  child: Text(steps[i].n, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 12)),
                ),
                const SizedBox(height: 8),
                Text(steps[i].title, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.w800, color: AppColors.brandBlue)),
                const SizedBox(height: 4),
                Text(steps[i].body, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12, color: AppColors.muted, height: 1.3)),
              ],
            ),
          ),
          if (i < steps.length - 1) const Icon(Icons.arrow_forward_rounded, color: AppColors.brandGreen, size: 20),
        ],
      ],
    );
  }
}

class _UseCase extends StatelessWidget {
  const _UseCase({required this.title, required this.body});
  final String title;
  final String body;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.line),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w800, color: AppColors.brandBlue)),
          const SizedBox(height: 6),
          Text(body, style: const TextStyle(color: AppColors.muted, height: 1.45)),
        ],
      ),
    );
  }
}
