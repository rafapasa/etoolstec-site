import 'package:flutter/material.dart';
import '../../core/constants/api_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../shared/widgets/site_scaffold.dart';

class RestrictedPage extends StatelessWidget {
  const RestrictedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Área restrita', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800, color: AppColors.brandBlue)),
          const SizedBox(height: 8),
          const Text('Espaço do cliente: documentos, instâncias e acompanhamento.'),
          const SizedBox(height: 20),
          Text('Dashboard: ${ApiConstants.url(ApiConstants.dashboard)}', style: const TextStyle(color: AppColors.muted)),
          Text('Documentos: ${ApiConstants.url(ApiConstants.documents)}', style: const TextStyle(color: AppColors.muted)),
          const SizedBox(height: 16),
          const Text('Quando os endpoints forem publicados, esta área passará a consumir os dados reais da conta.'),
        ],
      ),
    );
  }
}
