import 'package:flutter/material.dart';
import '../../core/constants/api_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../shared/widgets/site_scaffold.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({super.key});
  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _subject = TextEditingController();
  final _message = TextEditingController();
  String? _feedback;

  Future<void> _send() async {
    setState(() => _feedback = 'Chamado será enviado para ${ApiConstants.url(ApiConstants.supportTickets)}.');
  }

  @override
  Widget build(BuildContext context) {
    return PageShell(
      maxWidth: 640,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Suporte', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800, color: AppColors.brandBlue)),
          const SizedBox(height: 8),
          const Text('Abra um chamado. Assim que o backend estiver no ar, o ticket entra na fila oficial.'),
          const SizedBox(height: 24),
          TextField(controller: _name, decoration: const InputDecoration(labelText: 'Nome')),
          const SizedBox(height: 12),
          TextField(controller: _email, decoration: const InputDecoration(labelText: 'E-mail')),
          const SizedBox(height: 12),
          TextField(controller: _subject, decoration: const InputDecoration(labelText: 'Assunto')),
          const SizedBox(height: 12),
          TextField(controller: _message, decoration: const InputDecoration(labelText: 'Mensagem'), maxLines: 5),
          const SizedBox(height: 20),
          FilledButton(onPressed: _send, child: const Text('Enviar solicitação')),
          if (_feedback != null) ...[
            const SizedBox(height: 12),
            Text(_feedback!, style: const TextStyle(color: AppColors.muted)),
          ],
        ],
      ),
    );
  }
}
