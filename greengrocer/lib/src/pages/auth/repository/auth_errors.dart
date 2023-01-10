String authErrorsString(String? code){
  switch(code){
    case 'INVALID_CREDENTIALS':
      return 'Email ou senha inválidos!';

    case 'Invalid session token':
      return 'Sessão expirada';

    case 'INVALID_FULLNAME':
      return 'Ocorreu um erro ao cadstrar usuário: nome inválido';

    case 'INVALID_PHONE':
      return 'Ocorreu um erro ao cadstrar usuário: Celular inválido';

    case 'INVALID_CPF':
      return 'Ocorreu um erro ao cadstrar usuário: CPF inválido';

    default:
      return 'Algo de errado aconteceu.';
  }
}