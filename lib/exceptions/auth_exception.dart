class AuthException implements Exception {
  static const Map<String, String> errors = {
    'EMAIL_EXISTS': 'E-mail ja existe',
    'OPERATION_NOT_ALLOWED': 'Operação não permitida',
    'TOO_MANY_ATTEMPTS_TRY_LATER':
        'Muitas tentativas. Tente novamente mais tarde',
    'EMAIL_NOT_FOUND': 'E-mail não encontrado',
    'INVALID_PASSWORD': 'Senha inválida',
    'USER_DISABLED': 'Usuário desativado',
    'INVALID_EMAIL': 'E-mail inválido',
    'USER_NOT_FOUND': 'Usuário não encontrado',
    'INVALID_LOGIN_CREDENTIALS': 'Credenciais inválidas asdfasdf',
  };

  final String key;

  AuthException(this.key);

  @override
  String toString() {
    return errors[key] ?? 'Ocorreu um erro inesperado';
  }
}
