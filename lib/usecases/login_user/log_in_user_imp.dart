import '/usecases/login_user/log_in_user_usecase.dart';

class LogInUserUseCaseImp implements LogInUserUseCase {
  @override
  bool? call(String _email, String _password) {
    if (_email == 'teste@teste.com.br' && _password == '123456789+') {
      return true;
    }
    return false;
  }
}
