/// Contrato do backend institucional.
/// Base: https://mcp-server.etoolstec.com.br/api/v1
/// Endpoints ainda não publicados — constantes prontas para consumo.
class ApiConstants {
  ApiConstants._();

  static const String baseUrl = 'https://mcp-server.etoolstec.com.br/api/v1';

  // Auth
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String logout = '/auth/logout';
  static const String refreshToken = '/auth/refresh';
  static const String forgotPassword = '/auth/forgot-password';
  static const String me = '/auth/me';

  // Área restrita
  static const String dashboard = '/restricted/dashboard';
  static const String documents = '/restricted/documents';

  // Suporte
  static const String supportTickets = '/support/tickets';
  static const String supportTicketById = '/support/tickets/{id}';
  static const String supportCategories = '/support/categories';

  // Institucional / conteúdo
  static const String contact = '/contact';
  static const String products = '/products';
  static const String conversationCommerce = '/products/conversation-commerce';
  static const String newsletter = '/newsletter';

  static String url(String path) => '$baseUrl$path';
}
