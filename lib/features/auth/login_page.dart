import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/api_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../shared/widgets/site_scaffold.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _loading = false;
  String? _message;

  Future<void> _submit() async {
    setState(() {
      _loading = true;
      _message = null;
    });
    // Endpoint previsto: ApiConstants.login — ainda não publicado.
    await Future<void>.delayed(const Duration(milliseconds: 600));
    if (!mounted) return;
    setState(() {
      _loading = false;
      _message =
          'Login será autenticado em ${ApiConstants.url(ApiConstants.login)} quando o endpoint estiver disponível.';
    });
    context.go('/area-restrita');
  }

  @override
  Widget build(BuildContext context) {
    return PageShell(
      maxWidth: 480,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Área restrita', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800, color: AppColors.brandBlue)),
          const SizedBox(height: 8),
          const Text('Acesse com sua conta eTools.'),
          const SizedBox(height: 24),
          TextField(controller: _email, decoration: const InputDecoration(labelText: 'E-mail'), keyboardType: TextInputType.emailAddress),
          const SizedBox(height: 12),
          TextField(controller: _password, decoration: const InputDecoration(labelText: 'Senha'), obscureText: true),
          const SizedBox(height: 20),
          FilledButton(
            onPressed: _loading ? null : _submit,
            child: Text(_loading ? 'Entrando...' : 'Entrar'),
          ),
          TextButton(onPressed: () => context.go('/criar-conta'), child: const Text('Ainda não tem conta? Criar conta')),
          if (_message != null) ...[
            const SizedBox(height: 12),
            Text(_message!, style: const TextStyle(color: AppColors.muted, fontSize: 12)),
          ],
        ],
      ),
    );
  }
}
