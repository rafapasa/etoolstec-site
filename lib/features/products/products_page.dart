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
          const Text('Tecnologia aplicada à operação e à engenharia da sua empresa.', style: TextStyle(color: AppColors.muted)),
          const SizedBox(height: 24),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const OpenErpMark(height: 44),
            title: const Text('OpenERP-WhatsApp', style: TextStyle(fontWeight: FontWeight.w800)),
            subtitle: const Text(
              'Integração do WhatsApp ao OpenERP para vendas e atendimento com contexto do ERP. Texto básico — conteúdo detalhado em ajuste.',
            ),
            trailing: const Icon(Icons.arrow_forward_rounded),
            onTap: () => context.go('/conversation-commerce'),
          ),
          const Divider(),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Container(
              width: 44,
              height: 44,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.brandBlue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.line),
              ),
              child: const Text('</>', style: TextStyle(fontWeight: FontWeight.w900, color: AppColors.brandBlue, fontSize: 16)),
            ),
            title: const Text('</> eToolsCode', style: TextStyle(fontWeight: FontWeight.w800)),
            subtitle: const Text(
              'Assistente de engenharia de software: issues, chat e TDD sobre o código local — com as regras do seu time.',
            ),
            trailing: const Icon(Icons.arrow_forward_rounded),
            onTap: () => context.go('/etoolscode'),
          ),
          const Divider(),
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
