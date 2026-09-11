import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/api_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../shared/widgets/site_scaffold.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _name = TextEditingController();
  final _company = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _loading = false;
  String? _message;

  Future<void> _submit() async {
    setState(() {
      _loading = true;
      _message = null;
    });
    await Future<void>.delayed(const Duration(milliseconds: 600));
    if (!mounted) return;
    setState(() {
      _loading = false;
      _message = 'Cadastro será enviado para ${ApiConstants.url(ApiConstants.register)}.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageShell(
      maxWidth: 520,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Criar conta', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800, color: AppColors.brandBlue)),
          const SizedBox(height: 8),
          const Text('Solicite acesso à área de clientes e ao Conversation Commerce.'),
          const SizedBox(height: 24),
          TextField(controller: _name, decoration: const InputDecoration(labelText: 'Nome')),
          const SizedBox(height: 12),
          TextField(controller: _company, decoration: const InputDecoration(labelText: 'Empresa')),
          const SizedBox(height: 12),
          TextField(controller: _email, decoration: const InputDecoration(labelText: 'E-mail'), keyboardType: TextInputType.emailAddress),
          const SizedBox(height: 12),
          TextField(controller: _password, decoration: const InputDecoration(labelText: 'Senha'), obscureText: true),
          const SizedBox(height: 20),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: AppColors.brandGreen),
            onPressed: _loading ? null : _submit,
            child: Text(_loading ? 'Enviando...' : 'Criar conta'),
          ),
          TextButton(onPressed: () => context.go('/entrar'), child: const Text('Já tenho conta')),
          if (_message != null) ...[
            const SizedBox(height: 12),
            Text(_message!, style: const TextStyle(color: AppColors.muted, fontSize: 12)),
          ],
        ],
      ),
    );
  }
}
