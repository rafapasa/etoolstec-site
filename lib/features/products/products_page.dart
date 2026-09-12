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
          const Text('Tecnologia aplicada à operação da sua empresa.', style: TextStyle(color: AppColors.muted)),
          const SizedBox(height: 24),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const OpenErpMark(height: 44),
            title: const Text('OpenERP-WhatsApp · Conversation Commerce', style: TextStyle(fontWeight: FontWeight.w800)),
            subtitle: const Text('Comércio conversacional integrado ao ERP.'),
            trailing: const Icon(Icons.arrow_forward_rounded),
            onTap: () => context.go('/conversation-commerce'),
          ),
          const Divider(),
          const ListTile(
            contentPadding: EdgeInsets.zero,
            leading: OpenErpMark(height: 44),
            title: Text('OpenERP', style: TextStyle(fontWeight: FontWeight.w800)),
            subtitle: Text('Gestão empresarial integrada: vendas, estoque, financeiro e processos.'),
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
