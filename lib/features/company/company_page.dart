import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../shared/widgets/site_scaffold.dart';

class CompanyPage extends StatelessWidget {
  const CompanyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageShell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Empresa', style: TextStyle(fontSize: 34, fontWeight: FontWeight.w800, color: AppColors.brandBlue)),
          SizedBox(height: 8),
          Text('Soluções inteligentes para sua empresa.', style: TextStyle(color: AppColors.muted, fontSize: 16)),
          SizedBox(height: 28),
          Text('Missão', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
          SizedBox(height: 8),
          Text(
            'Oferecer de forma inovadora as melhores soluções em tecnologia, visando satisfazer integralmente as reais necessidades do cliente, com qualidade e agilidade nos serviços prestados.',
            style: TextStyle(height: 1.5),
          ),
          SizedBox(height: 22),
          Text('Visão', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
          SizedBox(height: 8),
          Text(
            'Ser referência nacional pela excelência em inovações e soluções tecnológicas, atuando com lealdade para com clientes e a sociedade.',
            style: TextStyle(height: 1.5),
          ),
          SizedBox(height: 22),
          Text('Valores', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800)),
          SizedBox(height: 8),
          Text('Inovação · Ética · Solução · Satisfação · Responsabilidade social e ambiental'),
          SizedBox(height: 12),
          Text('DNA: Perfeição, Inovação e Exclusividade no atendimento de cada cliente.'),
        ],
      ),
    );
  }
}
